# ghinda.com

The personal website of Lucian Ghinda — essays and notes on products, ideas,
teams, and creativity. Built with [Jekyll](https://jekyllrb.com/) and a custom
"quiet-editorial" theme styled with [Tailwind CSS v4](https://tailwindcss.com/).

## Stack

- **Jekyll 4.4** — static site generator.
- **Tailwind v4, no Node** — compiled by
  [`jekyll-tailwind`](https://github.com/crbelaus/jekyll-tailwind) using the
  standalone CLI shipped by the `tailwindcss-ruby` gem. The theme lives in
  [`_tailwind.css`](./_tailwind.css) and compiles into
  `_site/assets/css/styles.css` on every build — there is no npm step.
- **Rouge** — build-time syntax highlighting (kramdown), themed in
  [`assets/css/syntax-highlighting.css`](./assets/css/syntax-highlighting.css).
- Ruby is managed with **chruby**; see `.ruby-version`.

## Develop

```bash
bin/dev
```

Runs `bundle exec jekyll serve` with drafts and livereload on
<http://localhost:4000>. Tailwind recompiles automatically as part of the build.

## Refresh the homepage stream

The homepage merges local posts with recent articles pulled from
[notes.ghinda.com](https://notes.ghinda.com) and
[allaboutcoding.ghinda.com](https://allaboutcoding.ghinda.com). Those items are
fetched into `_data/external_posts.yml` (committed to the repo) by a small
script — the build itself never hits the network. Refresh before deploying:

```bash
bundle exec bin/fetch_feeds
```

It is offline-safe: if a feed is unreachable it keeps that source's previously
committed items rather than dropping them.

## Content

- `_posts/` — published articles. Front matter drives the layout
  (`post` / `short` / `learning-note`) and the category badge shown in lists.
- `_drafts/` — work in progress (shown by `bin/dev`, not in production builds).
- `about.md` — the about / hub page.
- `_config.yml` — site title, description, and the `social_links` list.

## Deploy

Deployment is handled separately (see `config/`) and is out of scope for this
README.

## License

Dual-licensed — see [LICENSE.md](./LICENSE.md) for details:

- **Code** (layouts, includes, styles, scripts, configuration) is licensed
  under the [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0).
- **Content** (articles in `_posts/` and `_drafts/`, pages, images) is
  copyright © Lucian Ghinda, all rights reserved. Short quotations with
  attribution and a link back are welcome.
