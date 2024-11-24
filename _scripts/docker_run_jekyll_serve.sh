# https://github.com/github/pages-gem
SITE=. docker run --rm -p 4000:4000 -v `realpath ${SITE}`:/src/site gh-pages