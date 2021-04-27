#!/bin/bash

git clone https://github.com/RodrigoATorres/rony_a3_modules.git
cd rony_a3_modules
git remote rm origin
git filter-branch --subdirectory-filter rony_a3_modules/module_templates/$1 -- --all
mkdir -p rony/module_templates/$1
git mv -k * rony/module_templates/$1
git add .
git commit -m 'Adding module'

cd ..
git clone https://github.com/A3Data/rony.git
cd rony
git remote add $1 ../rony_a3_modules
git fetch $1
git branch $1 remotes/$1/main
git merge $1 --allow-unrelated-histories
git remote rm $1
