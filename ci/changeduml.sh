#!/bin/bash

r=$(git rev-parse --show-toplevel)
$r/tools/generateuml.sh > /dev/null

git status --porcelain=v1

[[ -z $(git status -s) ]]