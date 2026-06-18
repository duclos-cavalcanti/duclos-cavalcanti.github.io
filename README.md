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
site/            sources you edit (plain text, 80-column terminal style)
  index.txt      home: $ whoami hero + table of contents + sections
  about.txt
  posts.txt      post index
  posts/*.txt    individual posts
  resume.txt     embeds the built PDF
  contact.txt
template.html    the <pre> wrapper: CSS + nav + %%TITLE%% / %%CONTENT%% slots
build.sh         the generator (POSIX sh + sed)
Makefile         entrypoint: build / serve / resume / clean
assets/          images etc. copied verbatim into the output (assets/img -> /img)
public/          BUILD OUTPUT — committed; GitHub Pages publishes this dir
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

GitHub Actions ([.github/workflows/main.yml](.github/workflows/main.yml)) publishes
the committed `public/` directory to Pages on every push to `main`, copying `CNAME`
for the custom domain. So the workflow is: edit `site/`, `make build`, commit
`public/`, push.

> Note: `resume/resume.pdf` is git-ignored and built from LaTeX. Run `make resume`
> before `make build` if you want the resume page populated; the build warns and
> continues if the PDF is absent.

## License

Released under the GPL 3.0 license. See [LICENSE](LICENSE).

## Thanks

* [kisslinux](https://github.com/kisslinux/kisslinux.github.io) — the plain-text site approach
* [altacv](https://github.com/liantze/AltaCV) — the resume template
