#!/bin/bash
SEPARATOR='_'
WORKDIR="${1:-`pwd`}"
DESTDIR="${2:-`pwd`}"
(
cd $WORKDIR
find . -maxdepth 1 -type f -print0 | while read -d $'\0' file
do
    IFS=$SEPARATOR read -a _file <<< "$file"
    STUDENTDIR="${_file[0]}"
    STUDENTDIR="$DESTDIR/${STUDENTDIR// /_}"
    mkdir -p $STUDENTDIR
    echo "Moving $file to $STUDENTDIR"
    mv "$file" $STUDENTDIR
done
)
