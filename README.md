# Fernando Donado — academic website (demo)

Personal/academic site for **Dr. Fernando Donado Pérez** (Professor-Researcher,
Academic Area of Mathematics and Physics, UAEH).

Built on the [al-folio](https://github.com/alshedivat/al-folio) Jekyll theme
(MIT). This repository is a **demo for approval** — content marked *"demo"* is
placeholder text to be replaced once the professor signs off on structure and
style. It lives under `Richard7987/` for now; the production site will move to his
own GitHub account (`ferdonadoperez-star`).

## What's here

| Section | Source |
|---|---|
| Home / bio | `_pages/about.md` |
| People (students) | `_pages/people.md` + `_data/people.yml` |
| Publications | `_bibliography/papers.bib` (generated — see below) |
| Blog (outreach) | `_posts/` |
| News | `_news/` |
| CV | `_pages/cv.md` + `_data/cv.yml` |
| Colours / theme | `_sass/_variables.scss`, `_sass/_themes.scss` (navy / khaki / sand) |
| CMS | `admin/` (Sveltia CMS) |

## Running locally

No Ruby on the machine? There's a `shell.nix`:

```sh
nix-shell
bundle install          # first time only
bundle exec jekyll serve --livereload
# http://localhost:4000/donado-website/
```

`imagemagick` and `nodejs` are included in the shell for responsive images and the
publication importer.

## Publications

`_bibliography/papers.bib` is **generated**, not hand-written:

```sh
node bin/fetch_publications.mjs            # 8 most recent (demo)
node bin/fetch_publications.mjs --limit 0  # all works (production)
node bin/fetch_publications.mjs --dry-run  # preview only
```

It reads the professor's ORCID (`0000-0002-7032-3265`), takes the works that have
a DOI, and pulls a full BibTeX record (with co-authors) from Crossref for each.
Entries whose cite key is in the `SELECTED` list at the top of the script get
`selected={true}` and appear on the home page.

To add a paper that isn't in ORCID yet, paste a BibTeX block into
`_bibliography/papers.bib` by hand — re-running the script later will overwrite the
file, so add it to ORCID too.

**Automatic weekly refresh.** `.github/workflows/refresh-publications.yml` runs the
importer every Monday. If ORCID has something new, it commits the updated
`papers.bib` and triggers a rebuild — so a new paper appears on the site on its own
within a week of reaching ORCID (no one has to touch anything). It can also be run
on demand from the repo's **Actions** tab. This depends on the paper being **in
ORCID with a DOI**; most publishers push there automatically via Crossref, but the
author may need to accept/add it once in orcid.org.

## Content editing (Sveltia CMS)

`/donado-website/admin/` — a git-based CMS. Editors fill in forms; each save is a
commit. Collections: **Blog posts**, **News**, **Pages** (about + CV intro),
**People**.

- **Demo auth:** on the login screen click **"Sign In with Token"** and paste a
  GitHub [personal access token](https://github.com/settings/tokens) with `repo`
  scope. Nothing else to set up.
- **Production auth** (so the professor just clicks "Sign in with GitHub"): deploy
  [`sveltia/sveltia-cms-auth`](https://github.com/sveltia/sveltia-cms-auth) to
  Cloudflare Workers (free), register a GitHub OAuth App, and add
  `base_url: https://<your-worker>.workers.dev` to `admin/config.yml`.

Publications are **not** editable through the CMS — use the importer script above.

## Deployment

GitHub Pages, via the al-folio-provided workflow **`.github/workflows/deploy.yml`**
(Ruby 3.3). On every push to `main` it builds with Jekyll and pushes `_site/` to
the `gh-pages` branch. In repo **Settings → Pages**, set the source to
`gh-pages` / `/ (root)`.

> **Maintenance note.** al-folio cannot be built by GitHub Pages' native Jekyll —
> it needs ~13 plugins outside the Pages allow-list (`jekyll-scholar`,
> `jekyll-imagemagick`, `jekyll-archives`, …). The site therefore depends on the
> Actions workflow. If GitHub deprecates an action version or the Ruby setup, the
> site stops rebuilding until `deploy.yml` is updated. This trade-off was made
> deliberately to keep al-folio's publications-from-BibTeX machinery.

## Migrating to the professor's account

1. Create `ferdonadoperez-star/<repo>` and push this repo to it.
2. `_config.yml`: set `url:` and `baseurl:` for the new location
   (`https://ferdonadoperez-star.github.io` + `/<repo>`, or the custom domain with
   empty `baseurl`).
3. `admin/config.yml`: change `repo:` to the new `owner/repo`; update
   `public_folder` if `baseurl` changed; add the OAuth `base_url` (see above).
4. Settings → Pages → source `gh-pages`.
5. Re-run `node bin/fetch_publications.mjs --limit 0` for the full list.
6. Fill in the real data: `_data/people.yml`, replace the demo blog posts, swap
   `assets/img/prof_pic.jpg` if a higher-res photo is available, set the CV PDF.

## Credit

Theme: [al-folio](https://github.com/alshedivat/al-folio) by Maruan Al-Shedivat
and contributors, MIT License (`LICENSE`).
