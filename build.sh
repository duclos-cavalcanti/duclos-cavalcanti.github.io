#!/bin/sh -e
#
# Simple static site generator.
# Transforms hand-authored plain-text sources in site/ into HTML pages under
# public/, by running a small set of sed substitutions and injecting the result
# into template.html. No dependencies beyond a POSIX shell + sed.
#
#   site/index.txt              -> public/index.html
#   site/about.txt              -> public/about/index.html
#   site/posts/master-thesis.txt-> public/posts/master-thesis/index.html
#
# Source markup dialect:
#   https://...   bare URLs are auto-linked
#   @/path        relative internal link  -> <a href=/path>path</a>
#   [NNN]         at line start -> anchor; inline -> link to that anchor
#   raw HTML is passed through verbatim (the template is "unsafe" by design)

ROOT=$(cd "$(dirname "$0")" && pwd)
cd "$ROOT"

OUT=public
TPL=template.html

render() {
    # $1 = source .txt path, $2 = page title.  Emits a full HTML page on stdout.
    body=$(mktemp)

    # 1. auto-link bare URLs (the guard avoids touching href=... attributes).
    sed -E "s|([^\"'>=])(https?://[^[:space:]<]*)|\1<a href=\2>\2</a>|g" "$1" |
    sed -E "s|^(https?://[^[:space:]<]*)|<a href=\1>\1</a>|g" |

    # 2. @/path -> relative internal link.
    sed -E "s|@/([^ )<]*)|<a href=/\1>\1</a>|g" |

    # 3. [NNN] references: line-start -> anchor span; inline -> link.
    sed -E "s|^([ -]*)\[([0-9.]*)\]|\1<span id=\2>[\2]</span>|g" |
    sed -E "s|([^\"#>])\[([0-9.]*)\]|\1[<a class=t href=#\2>\2</a>]|g" \
        > "$body"

    # 4. inject body into template, drop the marker, fill the title.
    sed -e "/%%CONTENT%%/r $body" -e "/%%CONTENT%%/d" "$TPL" |
    sed -E "s|%%TITLE%%|$2|g"

    rm -f "$body"
}

rm -rf "$OUT"
mkdir -p "$OUT"

find site -name '*.txt' | while read -r f; do
    rel=${f#site/}          # about.txt | posts/master-thesis.txt | index.txt
    base=${rel%.txt}        # about     | posts/master-thesis     | index

    case $base in
        index) out=$OUT/index.html;        title=home ;;
        *)     out=$OUT/$base/index.html;  title=${base##*/} ;;
    esac

    mkdir -p "$(dirname "$out")"
    printf 'CC %s -> %s\n' "$f" "$out"
    render "$f" "$title" > "$out"
done

# Static assets copied verbatim (assets/img/x.png -> public/img/x.png).
[ -d assets ] && cp -R assets/. "$OUT"/

# Built resume PDF (optional: run `make resume` first to produce it).
if [ -f resume/resume.pdf ]; then
    cp resume/resume.pdf "$OUT"/resume.pdf
else
    printf 'WARN: resume/resume.pdf missing — run `make resume` to build it\n' >&2
fi

# Custom domain for GitHub Pages.
[ -f CNAME ] && cp CNAME "$OUT"/

printf 'done -> %s/\n' "$OUT"
