#!/bin/bash

dir=${1-.}

find $dir -maxdepth 1 -mindepth 1 -type d -exec sh -c "test -d \"{}/.git\" && (echo \"--------------------------------\" && echo \"{}\" && cd \"{}\" && git status -sb && echo && echo \"Branches:\" && git branch -vv && echo && echo)" \;
