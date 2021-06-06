#!/bin/bash

r=$(git rev-parse --show-toplevel)

FILES="$r/docs/diagrams/src/*.puml"

#Remove all existing UMLs to ensure no old ones remain due to renaming.
rm -r $r/docs/diagrams/out/*

echo "Generating .png files from .puml files"
for f in $FILES
do
    echo "Processing $f file ..."
    NAME=$(basename $f .puml)
    TARGET="$r/docs/diagrams/out/$NAME.png"
    cat $f | docker run -i think/plantuml -tpng > $TARGET
    echo "... $TARGET generated"
    echo ""
done