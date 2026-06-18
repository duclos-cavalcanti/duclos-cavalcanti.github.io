# duclos-cavalcanti.github.io

Source for my personal website, served via _GitHub Pages_ at
[https://www.duclos.dev](https://www.duclos.dev).

The site is a **plain-text static site** in the spirit of
[kisslinux.github.io](https://github.com/kisslinux/kisslinux.github.io): hand-authored
`.txt` sources are transformed by a small `sed` script and injected into a single
`template.html`. No framework, no build dependencies, no JavaScript — the source
reads almost exactly like the rendered page.

## Layout

```
site/            everything that becomes the published site
  index.txt      home: $ whoami hero + table of contents + sections
  about.txt
  posts.txt      post index
  posts/*.txt    individual posts
  resume.txt     embeds the built PDF
  contact.txt
  assets/        images etc. copied verbatim into output (assets/img -> /img)
build.sh         the generator (POSIX sh + sed)         ┐ the build system:
template.html    <pre> wrapper: CSS + nav + %%TITLE%% / %%CONTENT%% slots │ script + the
Makefile         entrypoint: build / serve / resume / clean               ┘ layout it drives
public/          BUILD OUTPUT — git-ignored; CI builds it and publishes to gh-pages
resume/          LaTeX -> resume/resume.pdf  (altacv)
cover/           LaTeX cover letter / statement
```

## Source markup

Sources are plain text. A handful of conventions are expanded at build time:

| In source            | Becomes                                   |
|----------------------|-------------------------------------------|
| `https://...`        | auto-linked                               |
| `@/path`             | relative internal link `<a href=/path>`   |
| `[001]` (line start) | anchor target (`<span id=001>`)           |
| `[001]` (inline)     | link to that anchor                       |
| raw HTML             | passed through verbatim                    |

The ASCII hero box, the dotted-leader table of contents, and the `____` rules are
hand-maintained 80-column text — edit them directly.

## Usage

```sh
make build     # site/*.txt -> public/
make serve     # build, then serve on http://localhost:8000 (links resolve)
make resume    # build the LaTeX resume -> resume/resume.pdf (needs a TeX install)
make clean     # remove public/
```

## Deploy

On every push to `main`, GitHub Actions ([.github/workflows/main.yml](.github/workflows/main.yml))
runs `sh build.sh` and publishes the resulting `public/` to the `gh-pages` branch
(which Pages serves). So `public/` is never committed — the workflow is simply:
edit `site/`, push. Run `make serve` locally to preview before pushing.

> Note: `resume/resume.pdf` is built from LaTeX (`make resume`, needs Docker) and
> **is committed**, since CI does not run LaTeX — it copies the committed PDF into
> the output. The build warns and continues if the PDF is absent.

## License

Released under the GPL 3.0 license. See [LICENSE](LICENSE).

## Thanks

* [kisslinux](https://github.com/kisslinux/kisslinux.github.io) — the plain-text site approach
* [altacv](https://github.com/liantze/AltaCV) — the resume template
