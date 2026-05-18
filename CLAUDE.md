# CLAUDE.md

Project memory for Nan Wang's personal academic website. Read this first
before making changes — it captures conventions established with the owner.

## Owner & Repo

- **Owner**: Nan Wang (王 南), Founding Robotics Engineer at
  [Chestnut Robotics](https://chestnut.bot/).
- **GitHub**: `warnerion/warnerion.github.io`. GitHub Pages serves `master`
  directly; a push is live in ~30–60 s.
- **Live URL**: <https://warnerion.github.io>

## Authentication Gotcha (push will fail without this)

The owner has two GitHub accounts on this machine. The default SSH key is the
**wrong** one for this repo:

| Key | GitHub identity | Usable for this repo? |
|---|---|---|
| `~/.ssh/id_ed25519` (default) | `Nan-Tetheria` (company) | No |
| `~/.ssh/id_rsa` | `warnerion` (owner) | Yes |

Always push with:

```bash
GIT_SSH_COMMAND="ssh -i ~/.ssh/id_rsa -o IdentitiesOnly=yes" git push origin master
```

## Repository Structure

```
.
├── index.html              # The only HTML file
├── icon.ico                # Favicon
├── assets/
│   ├── css/style.css       # Stylesheet
│   ├── images/bio.jpg      # Profile photo
│   ├── pdfs/               # All PDFs (kebab-case lowercase)
│   │   ├── resume.pdf
│   │   ├── poster-iros2023.pdf
│   │   ├── poster-grs2020.pdf
│   │   ├── poster-bars2019.pdf
│   │   └── slides-norcal2022.pdf
│   └── research/           # Per-paper thumbnails
│       ├── foundation_ijrr.jpg
│       ├── hyrrt.jpg
│       ├── hysst.jpg
│       ├── hyrrt_connect.jpg
│       ├── chyrrt_chysst.jpg
│       ├── setbased_aerial.jpg
│       ├── carlike.jpg
│       └── mujoco_aero.webp   # animated, real ↔ sim
├── CLAUDE.md               # This file
├── README.md
├── LICENSE
└── .gitignore
```

## Design Conventions

- **Reference style**: <https://cheng-chi.github.io> — clean, single-column,
  academic. Explicitly NOT flashy.
- **Font**: Source Sans Pro (loaded via Google Fonts CDN in `index.html`).
- **Colors** (CSS vars in `assets/css/style.css`):
  - `--primary` `#1a4480` (academic blue — headings, primary links)
  - `--accent` `#c0392b` (warm red — hover, key annotations)
  - `--text` `#2c2c2c`, `--grey` `#5a5a5a`, `--border` `#e5e5e5`
- **Layout**: 900px max-width single column; sticky header nav at top
  (Home / News / Research / Publications).
- **No emojis** in any committed file unless owner explicitly asks for one.

## Page Sections (order in `index.html`)

1. **Profile** — photo + name + affiliation + bio + links
   (Resume / Scholar / LinkedIn / Email). **No CV link** — owner removed it.
2. **News** — most-recent first. Bold date prefix. **Only accepted / presented /
   awarded** events. NEVER include "submitted to …" entries.
3. **Research** — grouped by `<h2>` topic. Each entry is a `<div class="project">`
   with thumbnail (left) + title (linked to paper) + meta (authors · venue ·
   year) + 1-paragraph description + links row.
4. **Open-Source Contributions** — list of upstream PRs: MuJoCo Menagerie,
   MuJoCo Playground, OMPL. The MuJoCo work also appears as a unified Research
   entry (with thumbnail) for visibility — that's intentional, keep both.
5. **Selected Publications** — numbered `<ol class="pub-list">`, paper title
   linked to arXiv / preprint / IEEE Xplore.
6. **Posters & Presentations** — list of PDFs in `assets/pdfs/`.
7. **Misc** — Awards / Service / Teaching.

## Content Rules

- **Paper titles**: use the **full title** in News and Publications, never
  shortened nicknames. E.g.
  `"HyRRT-Connect: A Bidirectional Rapidly-Exploring Random Trees Motion Planning Algorithm for Hybrid Systems"`,
  not just `"HyRRT-Connect"`.
- **Self-author highlight**: wrap the owner's name with
  `<span class="author-self">N. Wang</span>` in pub lists and project metas.
- **Self-name**: `Nan Wang` (English) and `王 南` (Chinese). Chinese name
  appears once next to English name in the profile header (`<span class="cn">`).
- **News dates**: month + year (e.g. `Aug 2024`). Use a bare year only when no
  month is known.
- **PDF filenames**: kebab-case lowercase (`poster-iros2023.pdf`, etc.). Don't
  rename existing ones casually — the path is the public URL.

## Per-Paper Thumbnails

For the four core motion-planning papers, **prefer defense slide figures over
paper page renderings** — the defense slides have clean, consistent visuals
designed for talks.

| Paper | Thumbnail source |
|---|---|
| Foundation Theory (IJRR 2025) | `~/Desktop/DefenseSlides/figs/hybridmotionplanning1.png` — problem formulation, no tree |
| HyRRT (CDC 2022) | `~/Desktop/DefenseSlides/figs/hybridmotionplanning_final.png` — single forward tree |
| HySST (CDC 2023) | `~/Desktop/DefenseSlides/figs/hybridmotionplanning_final_sparse.png` — sparse tree with witness neighborhoods |
| HyRRT-Connect (ADHS 2024) | Defense slides PDF page 125 (`200XYZ-Pattern copy.pdf`) — bidirectional trees with overlap |
| cHyRRT/cHySST (CASE 2025) | Paper Fig. 4, page 20 (3-panel pinball arena simulations) |
| Set-based Aerial (CCTA 2022) | Paper page 1 teaser (quadrotor with reachable obstacle sets) |
| Car-like CBF (CCTA submission) | Paper page 1 teaser (hybrid LP-I / LP-II controller switching) |
| MuJoCo Aero Hand | Owner-provided MP4 → animated WebP. Source MP4 is **not** in the repo; owner can re-drop one in `~/Desktop/` or similar if a new version is needed. |

### Paper PDF sources (for re-cropping figures)

- arXiv direct: `https://arxiv.org/pdf/<id>` — IDs:
  `2406.01802` (IJRR), `2305.18649` (HySST), `2403.18413` (HyRRT-Connect),
  `2502.07136` (Car-like), `2411.11812` (cHyRRT/cHySST).
- HSL preprints: `https://hybrid.soe.ucsc.edu/sites/default/files/preprints/{276,268}.pdf`
  (HyRRT CDC 2022, Set-based Aerial CCTA 2022).
- Defense slides: `~/Desktop/DefenseSlides/200XYZ-Pattern copy.pdf` (180 pages)
  with separate figures in `~/Desktop/DefenseSlides/figs/`.

### Image conventions

- Format: `.jpg` for static, `.webp` for animated.
- Aim for landscape aspect (~1.5:1 to 2:1) and < 500 KB.
- Defense slide PNGs are RGBA — composite onto white before saving JPG,
  otherwise transparency becomes black:

```python
from PIL import Image
img = Image.open(rgba_path)
if img.mode == "RGBA":
    bg = Image.new("RGB", img.size, (255, 255, 255))
    bg.paste(img, mask=img.split()[3])
    img = bg
img.save(out_path, "JPEG", quality=90)
```

- For MP4 → animated WebP (preferred over GIF — smaller, same quality):

```bash
ffmpeg -y -ss 0 -t 4 -i input.mp4 \
  -vf "fps=10,scale=280:-2" \
  -loop 0 -compression_level 6 -q:v 70 \
  assets/research/<slug>.webp
```

## Common Tasks

### Add a News entry

Edit the `<ul>` inside `<section id="news">` — insert a new `<li>` at the top
(most-recent first):

```html
<li><b>Month Year</b> Full event description, paper accepted to <em>Venue</em>.</li>
```

### Add a Research entry

In `<section id="research">`, insert a new project block inside the right
`<h2>` topic group:

```html
<div class="project">
    <a href="PAPER_URL" class="project-thumb">
        <img src="assets/research/SLUG.jpg" alt="..." />
    </a>
    <div class="project-body">
        <a href="PAPER_URL" class="project-title">Full Paper Title</a>
        <div class="project-meta"><span class="author-self">N. Wang</span>, Coauthors &middot; <em>Venue</em>, Year</div>
        <p>One-paragraph plain-English description.</p>
        <div class="project-links">
            <a href="...">arXiv</a>
        </div>
    </div>
</div>
```

Also add the paper as a new `<li>` in `<ol class="pub-list">` under the
Publications section.

### Replace the resume

Overwrite `assets/pdfs/resume.pdf`. Don't rename — the filename is the public
URL.

### Replace a thumbnail

Drop the new image at `assets/research/<slug>.{jpg,webp}` (same filename =
overwrite). If extension changes, also update the `<img src=...>` reference
in `index.html`.

### Deploy

```bash
git add -A
git commit -m "Concise summary"
GIT_SSH_COMMAND="ssh -i ~/.ssh/id_rsa -o IdentitiesOnly=yes" git push origin master
```

## Domain Status

- **Now**: `warnerion.github.io` (no custom domain — CNAME deliberately
  removed).
- `www.warnerion.com` was the previous custom domain; owner decided to let
  it lapse and is not maintaining it.
- Owner has discussed switching to a more professional setup (custom domain
  like `nanwang.dev` / `nanwang.me`, or renaming GitHub user) but **deferred**.
  When the time comes: add a `CNAME` file at the repo root with the domain,
  point DNS at GitHub Pages at the registrar, and enable "Enforce HTTPS" in
  repo Settings → Pages.

## What NOT to do

- Do NOT re-add the CV link unless explicitly asked.
- Do NOT add emojis to committed content.
- Do NOT include "submitted to …" papers in the News section.
- Do NOT push with the default SSH key — use `id_rsa` (see top).
- Do NOT commit large transient files (MP4 sources for WebP conversion,
  downloaded arXiv PDFs used only for figure extraction). Work in `/tmp` and
  commit only the derived asset.
- Do NOT restore `multiverse/`, `previousversion/`, or `PhotoRenameScript/` —
  they were purged from history on purpose to keep the repo lean.
- Do NOT force-push without explicit confirmation; the history was already
  rewritten once and any further rewrite will invalidate clones again.
