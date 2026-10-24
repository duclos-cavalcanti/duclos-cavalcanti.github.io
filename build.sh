#!/bin/sh -e
#
# Build: copies src/ to public/, then adds the resume PDF and CNAME.

ROOT=$(cd "$(dirname "$0")" && pwd)
cd "$ROOT"

rm -rf public
cp -R src/ public/

if [ -f resume/resume.pdf ]; then
    cp resume/resume.pdf public/resume.pdf
else
    printf 'WARN: resume/resume.pdf missing — run `make resume` to build it\n' >&2
fi

[ -f CNAME ] && cp CNAME public/

printf 'done -> public/\n'
