#!/bin/bash

CURRDIR=`pwd`

if [ $# -lt 1 ]; then
    echo "USAGE $0 zip_file"
    exit
fi

## Stage 1: Unzip.
ZIPFILE="$1"
WORKDIR=`pwd`/_work
mkdir -p "$WORKDIR"
(
    cd $WORKDIR 
    mkdir -p __unzipped__
    echo "Unzipping to $WORKDIR/__unzipped__"
    unzip "$ZIPFILE" -d __unzipped__
)
mkdir -p $WORKDIR/__students__

# Stage 2. break files at _ so that each student have its own directory.
./helpers/split_file_at_underscore.sh $WORKDIR/__unzipped__ $WORKDIR/__students__
echo "Total : `ls $WORKDIR/__students__ | wc -l` students"
ls -l

# Stage 3: Unarchive files in each student directory.
while IFS= read -r -d '' line; do
    echo "Processing directory $line"
    (
        cd $line
        find . -type f -print0 | xargs -0 -I file $CURRDIR/helpers/unarchive.sh file
    )
done < <(find $WORKDIR/__students__ -maxdepth 1 -type d -not -name ".git" -print0)
