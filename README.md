# Fernando Donado — academic website (demo)

Site for Dr. Fernando Donado Pérez (Professor-Researcher, Academic Area of
Mathematics and Physics, UAEH). Built on [al-folio](https://github.com/alshedivat/al-folio)
(MIT). This is a demo under `Richard7987/` for approval; content marked *"demo"*
is placeholder. Production moves to `ferdonadoperez-star`.

## Structure

| Section | Source |
|---|---|
| Home / bio | `_pages/about.md` |
| People | `_pages/people.md`, `_data/people.yml` |
| Publications | `_bibliography/papers.bib` (generated) |
| Videos | `_pages/videos.md`, `_data/videos.yml` |
| News | `_news/` |
| CV | `_pages/cv.md`, `_data/cv.yml` |
| Theme | `_sass/_variables.scss`, `_sass/_themes.scss` (navy / khaki / sand) |
| CMS | `admin/` (Sveltia) |

`_pages/blog.md` and `_posts/` still exist (`nav: false`) but are not linked
anywhere; blog was replaced by Videos.

## Local build

Requires Ruby (see `Gemfile`).

```sh
bundle install
bundle exec jekyll serve --livereload
# http://localhost:4000/donado-website/
```

## Publications

Generated from ORCID (`0000-0002-7032-3265`) + Crossref, not hand-written:

```sh
node bin/fetch_publications.mjs            # all works with a DOI
node bin/fetch_publications.mjs --limit 8  # most recent only
node bin/fetch_publications.mjs --dry-run  # preview, don't write
```

Entries listed in `SELECTED` at the top of the script get `selected={true}` and
show on the home page. `papers.bib` is overwritten on every run — DOI-less
entries go in `_bibliography/manual.bib` instead, which is appended verbatim.

`.github/workflows/refresh-publications.yml` runs the importer every Monday and
commits + redeploys if ORCID has something new. Requires the paper to be in
ORCID with a DOI.

## Editing (Sveltia CMS)

`/admin/`. Collections: News, Pages (about + CV), People, Videos. Each save is
a commit; the site redeploys automatically.

- Demo login: "Sign In with Token" + a GitHub [PAT](https://github.com/settings/tokens)
  with `repo` scope.
- Production login (one click, "Sign in with GitHub"): deploy
  [`sveltia/sveltia-cms-auth`](https://github.com/sveltia/sveltia-cms-auth) to
  Cloudflare Workers and add `base_url:` to `admin/config.yml`.

Publications are not editable in the CMS — use the importer.

## Deployment

`.github/workflows/deploy.yml` builds with Jekyll (Ruby 3.3) and pushes `_site/`
to `gh-pages` on every push to `main`. Settings → Pages → source `gh-pages`.

al-folio needs plugins outside the GitHub Pages allow-list (`jekyll-scholar`,
`jekyll-imagemagick`, …), so it cannot build without this workflow — a
deliberate trade-off to keep BibTeX-driven publications.

## Migrating to the professor's account

1. Push this repo to `ferdonadoperez-star/<repo>`.
2. `_config.yml`: update `url` and `baseurl`.
3. `admin/config.yml`: update `repo`, `public_folder`, add OAuth `base_url`.
4. Settings → Pages → source `gh-pages`.
5. `node bin/fetch_publications.mjs` for the full list.
6. Replace placeholders: `_data/people.yml`, `_data/videos.yml`, the demo blog
   posts, `assets/img/prof_pic.jpg`, the CV PDF.

## Credit

Theme: [al-folio](https://github.com/alshedivat/al-folio), MIT (`LICENSE`).
