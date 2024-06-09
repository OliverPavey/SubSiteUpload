#!/usr/bin/env bash
# Run (inc from GitBash on Windows) using: ./testupload.sh

mkdir -p testdata
mkdir -p testdata/img

INDEX_HTML="<html><body>"\
"<h1>Test Upload at "$(date)"</h1>"\
"<img src='img/pinkbox.svg' />"\
"</body></html>"
echo $INDEX_HTML  > testdata/index.html

PINK_BOX="<svg width='300' height='170' xmlns='http://www.w3.org/2000/svg'>"\
"<rect width='150' height='150' x='10' y='10' rx='20' ry='20' style='fill:red;stroke:black;stroke-width:5;opacity:0.5' />"\
"</svg>"
echo $PINK_BOX > testdata/img/pinkbox.svg

groovy ./subsite source=testdata target=testupload

if [ $? -ne 0 ]; then
    exit
fi

TEST_PAGE_URL=https://chezrevilo.com/testupload
echo "Please open page $TEST_PAGE_URL"
