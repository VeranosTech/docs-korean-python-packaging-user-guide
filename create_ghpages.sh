#!/usr/bin/env bash

python -m venv env
env/bin/python -m pip install -r requirements.txt

git add . -A
git commit -m "automatic commit"
git push origin korean

git checkout -B gh-pages
git rebase korean

touch .nojekyll

echo '!build/' >> .gitignore
echo '!env/' >> .gitignore

cd source
../env/bin/sphinx-build -b html -D language='ko' . ../build/html
cd ..

git add . -A
git commit -m "build"
git push -f origin gh-pages
git reset --hard HEAD
git clean -f
git checkout korean
