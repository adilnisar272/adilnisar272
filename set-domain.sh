#!/bin/sh
# Point canonical URLs, the sitemap, and robots.txt at a new origin.
# Current live site: https://adilnisar272.github.io/adil-dev-portfolio
# Usage: ./set-domain.sh https://yourdomain.com
OLD="https://adilnisar272.github.io/adil-dev-portfolio"
[ -z "$1" ] && { echo "usage: $0 https://yourdomain.com"; exit 1; }
D="${1%/}"
sed -i.bak "s#$OLD#$D#g" index.html legal.html projects.html robots.txt sitemap.xml README.md SEO-NOTES.md && rm -f *.bak
echo "Domain set to $D"
grep -c "$OLD" index.html robots.txt sitemap.xml README.md || true
