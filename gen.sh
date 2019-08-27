#!/bin/sh

# NOTE: this file is a modified version of gist:
# https://gist.github.com/bmaupin/6e3649af73120fac2b6907169632be2c

# Clean up redundant headings that end up getting split into separate chapters by themselves
find . -iname "*.md" -exec sed -i '/# You Don'\''t Know JS.*/d' {} \;
# Fix <br> tags which pandoc won't convert to <br />
find . -iname "*.md" -exec sed -i 's#<br>#<br />#' {} \;
# Close img tags
find . -iname "*.md" -exec sed -i -r 's#(<img.*[^/])>#\1 />#' {} \;

cd getting\ started
pandoc -S -o ../"You Don't Know JS: Getting Started.epub" \
  --epub-cover-image=cover.jpg \
  --epub-embed-font=/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf \
  --epub-stylesheet=../epub.css \
  -M author="Kyle Simpson" \
  -M title="You Don't Know JS: Getting Started" \
  foreword.md \
  ../preface.md \
  ch1.md \
  ch2.md \
  ch3.md \
  apA.md
cd ..

cd scope\ \&\ closures
pandoc -S -o ../"You Don't Know JS: Scope & Closures.epub" \
  --epub-cover-image=cover.jpg \
  --epub-embed-font=/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf \
  --epub-stylesheet=../epub.css \
  -M author="Kyle Simpson" \
  -M title="You Don't Know JS: Scope & Closures" \
  foreword.md \
  ../preface.md \
  ch1.md \
  ch2.md \
  ch3.md \
  ch4.md \
  ch5.md \
  apA.md \
  apB.md \
  apC.md \
  apD.md
cd ..

cd this\ \&\ object\ prototypes
pandoc -S -o ../"You Don't Know JS: this & Object Prototypes.epub" \
  --epub-cover-image=cover.jpg \
  --epub-embed-font=/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf \
  --epub-stylesheet=../epub.css \
  -M author="Kyle Simpson" \
  -M title="You Don't Know JS: this & Object Prototypes" \
  foreword.md \
  ../preface.md \
  ch1.md \
  ch2.md \
  ch3.md \
  ch4.md \
  ch5.md \
  ch6.md \
  apA.md \
  apB.md
cd ..

cd types\ \&\ grammar
pandoc -S -o ../"You Don't Know JS: Types & Grammar.epub" \
  --epub-cover-image=cover.jpg \
  --epub-embed-font=/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf \
  --epub-stylesheet=../epub.css \
  -M author="Kyle Simpson" \
  -M title="You Don't Know JS: Types & Grammar" \
  foreword.md \
  ../preface.md \
  ch1.md \
  ch2.md \
  ch3.md \
  ch4.md \
  ch5.md \
  apA.md \
  apB.md
cd ..

cd async\ \&\ performance
pandoc -S -o ../"You Don't Know JS: Async & Performance.epub" \
  --epub-cover-image=cover.jpg \
  --epub-embed-font=/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf \
  --epub-stylesheet=../epub.css \
  -M author="Kyle Simpson" \
  -M title="You Don't Know JS: Async & Performance" \
  foreword.md \
  ../preface.md \
  ch1.md \
  ch2.md \
  ch3.md \
  ch4.md \
  ch5.md \
  ch6.md \
  apA.md \
  apB.md \
  apC.md
cd ..

cd es\:next\ \&\ beyond
pandoc -S -o ../"You Don't Know JS: ES: Next & Beyond.epub" \
  --epub-cover-image=cover.jpg \
  --epub-embed-font=/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf \
  --epub-stylesheet=../epub.css \
  -M author="Kyle Simpson" \
  -M title="You Don't Know JS: ES: Next & Beyond" \
  foreword.md \
  ../preface.md \
  ch1.md \
  ch2.md \
  ch3.md \
  ch4.md \
  ch5.md \
  ch6.md \
  ch7.md \
  ch8.md \
  apA.md
cd ..

# Workaround for https://github.com/jgm/pandoc/issues/3792
for epubfile in *.epub; do
    mkdir tmp-epub
    cd tmp-epub
    unzip ../"$epubfile"
    sed -i 's/ & / \&amp; /' title_page.xhtml
    zip -X ../"$epubfile" mimetype
    zip -rX ../"$epubfile" * -x mimetype
    cd ..
    rm -rf tmp-epub
done
