# frozen_string_literal: true

source "https://rubygems.org"

gem "jekyll", "~> 4.4.1"

# Ruby 3.4+ no longer bundles these as default gems; declaring them keeps the
# app working across 3.3/3.4 and makes them available under `bundle exec`.
gem "csv"
gem "base64"
gem "bigdecimal"
gem "rss" # used by bin/fetch_feeds to aggregate external RSS/Atom feeds

gem "webrick", group: :development # jekyll serve needs this on Ruby 3+

group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.17"
  gem "jekyll-seo-tag"
  gem "jekyll-sitemap"
  gem "jekyll-target-blank"
  gem "jekyll-tailwind", "~> 2.0" # crbelaus/jekyll-tailwind: compiles Tailwind via a build hook, no Node
end

# Ships the standalone Tailwind v4 CLI binary; pinning ~> 4.0 selects Tailwind v4.
gem "tailwindcss-ruby", "~> 4.0"
