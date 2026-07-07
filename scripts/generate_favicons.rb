#!/usr/bin/env ruby
# frozen_string_literal: true

# Generates the site's favicon set from a single source of truth: a geometric
# "G" monogram in Lucian Ghinda's amber brand color on a warm-dark rounded tile.
#
# Outputs (all at the repo root, where _includes/head.html expects them):
#   - favicon.svg          theme-aware; adapts to the OS light/dark scheme
#   - favicon.ico          multi-size raster fallback (16/32/48) for old browsers
#   - apple-touch-icon.png 180x180 full-bleed tile for iOS home screens
#
# Rasterization shells out to rsvg-convert (librsvg) and magick (ImageMagick),
# both already on PATH. Re-run any time to regenerate every asset.

require "tmpdir"

ROOT = File.expand_path("..", __dir__)

# --- Brand + geometry (single source of truth) ------------------------------

# 32x32 canvas. The "G" is a thick open ring (mouth on the right) plus a
# horizontal crossbar reaching the center — the classic geometric G. The path
# starts at the center, draws the crossbar out to the lower mouth lip, then
# sweeps a 296-degree arc clockwise the long way around to the upper mouth lip.
VIEWBOX      = 32
TILE_RADIUS  = 7 # rounded-corner radius of the background tile
STROKE_WIDTH = 5 # thickness of the G stroke
G_PATH       = "M16 20.8 L23.6 20.8 A9 9 0 1 1 23.6 11.2"

# Warm palette pulled from _tailwind.css: near-black stone tile, amber mark.
LIGHT = { tile: "#1c1917", mark: "#f59e0b" }.freeze # default / light OS theme
DARK  = { tile: "#14120f", mark: "#fbbf24" }.freeze # prefers-color-scheme: dark

# --- SVG builders -----------------------------------------------------------

# The shipped favicon: a <style> block swaps the tile/mark colors when the OS
# reports a dark color scheme, so the icon matches the site's own theme toggle.
def site_svg
  <<~SVG
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 #{VIEWBOX} #{VIEWBOX}" role="img" aria-label="Lucian Ghinda">
      <style>
        .tile { fill: #{LIGHT[:tile]}; }
        .mark { stroke: #{LIGHT[:mark]}; }
        @media (prefers-color-scheme: dark) {
          .tile { fill: #{DARK[:tile]}; }
          .mark { stroke: #{DARK[:mark]}; }
        }
      </style>
      <rect class="tile" x="0" y="0" width="#{VIEWBOX}" height="#{VIEWBOX}" rx="#{TILE_RADIUS}"/>
      <path class="mark" d="#{G_PATH}" fill="none" stroke-width="#{STROKE_WIDTH}" stroke-linecap="round" stroke-linejoin="round"/>
    </svg>
  SVG
end

# A flattened variant with explicit colors for rasterizers, which don't honor
# media queries. `tile_radius: 0` gives the full-bleed square iOS wants.
def flat_svg(tile_radius:)
  <<~SVG
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 #{VIEWBOX} #{VIEWBOX}">
      <rect x="0" y="0" width="#{VIEWBOX}" height="#{VIEWBOX}" rx="#{tile_radius}" fill="#{LIGHT[:tile]}"/>
      <path d="#{G_PATH}" fill="none" stroke="#{LIGHT[:mark]}" stroke-width="#{STROKE_WIDTH}" stroke-linecap="round" stroke-linejoin="round"/>
    </svg>
  SVG
end

# --- Rasterization ----------------------------------------------------------

def render_png(svg_string, size, out_path)
  Dir.mktmpdir do |dir|
    svg_path = File.join(dir, "in.svg")
    File.write(svg_path, svg_string)
    ok = system("rsvg-convert", "-w", size.to_s, "-h", size.to_s, svg_path, "-o", out_path)
    raise "rsvg-convert failed for #{out_path}" unless ok
  end
end

# Combine several PNG sizes into one multi-resolution .ico so browsers can pick
# the crispest frame for the tab, bookmarks bar, etc.
def build_ico(sizes, out_path)
  Dir.mktmpdir do |dir|
    pngs = sizes.map do |size|
      png = File.join(dir, "icon-#{size}.png")
      render_png(flat_svg(tile_radius: TILE_RADIUS), size, png)
      png
    end
    ok = system("magick", *pngs, out_path)
    raise "magick failed to build #{out_path}" unless ok
  end
end

# --- Emit -------------------------------------------------------------------

File.write(File.join(ROOT, "favicon.svg"), site_svg)
puts "wrote favicon.svg"

build_ico([16, 32, 48], File.join(ROOT, "favicon.ico"))
puts "wrote favicon.ico"

render_png(flat_svg(tile_radius: 0), 180, File.join(ROOT, "apple-touch-icon.png"))
puts "wrote apple-touch-icon.png"
