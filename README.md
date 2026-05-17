# warnerion.github.io

Personal academic website of [Nan Wang](https://warnerion.github.io), Founding
Robotics Engineer at Chestnut Robotics. Built as a single-page static site and
served by GitHub Pages.

## Structure

```
.
├── index.html              # Main page (Profile / News / Research / Publications)
├── icon.ico                # Favicon
├── assets/
│   ├── css/style.css       # Stylesheet (Source Sans Pro, academic blue palette)
│   ├── images/bio.jpg      # Profile photo
│   ├── pdfs/               # Resume, posters, slides
│   └── research/           # Per-paper thumbnails (jpg + animated webp)
├── LICENSE
└── README.md
```

## Local preview

The site is plain HTML/CSS — open `index.html` in any browser. For a local
server with proper relative-path resolution:

```bash
python3 -m http.server 8000
```

then visit <http://localhost:8000>.

## Deployment

GitHub Pages serves `master` directly. Commits pushed to `master` are live
within ~60 seconds.

## Updating content

- **Resume:** replace `assets/pdfs/resume.pdf`
- **News / Research entries:** edit `index.html`
- **Per-paper thumbnail:** drop a new image into `assets/research/` and update
  the corresponding `<img src=...>` in `index.html`
- **Styles:** `assets/css/style.css`
