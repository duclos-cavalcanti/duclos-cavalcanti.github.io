#!/bin/sh -e
#
# Build: assemble each page in src/pages/ from the shared layout fragments
# (src/layout/header.html + footer.html) into public/, then copy assets,
# the resume PDF, and CNAME. Pure sh + sed, no dependencies.

ROOT=$(cd "$(dirname "$0")" && pwd)
cd "$ROOT"

rm -rf public
mkdir -p public

# assets
cp src/style.css public/style.css
cp -R src/img public/img

# pages: header (title substituted) + body (directive stripped) + footer
find src/pages -name 'index.html' | while IFS= read -r src; do
    rel=${src#src/pages/}
    dst=public/$rel
    mkdir -p "$(dirname "$dst")"

    title=$(sed -n 's/^<!-- title: \(.*\) -->$/\1/p' "$src" | head -1)
    # escape sed replacement metacharacters (& \ /) in the title
    esc=$(printf '%s' "$title" | sed 's/[&/\\]/\\&/g')

    sed "s/{{TITLE}}/$esc/" src/layout/header.html  > "$dst"
    sed '/^<!-- title: /d'  "$src"                  >> "$dst"
    cat src/layout/footer.html                      >> "$dst"
done

if [ -f resume/resume.pdf ]; then
    cp resume/resume.pdf public/resume.pdf
else
    printf 'WARN: resume/resume.pdf missing — run `make resume` to build it\n' >&2
fi

[ -f CNAME ] && cp CNAME public/

printf 'done -> public/\n'
