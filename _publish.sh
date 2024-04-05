#!/usr/bin/env bash

read -p "Have you updated the language links with fix_links? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo " you are ready to update to gh-pages"
  git checkout gh-pages
  #git checkout main .gitignore
  git rm -r .
  cp -r _book/. .
  git add .
  git commit -a -m "update pages"
  git push
  git checkout main
  echo "done"
else
  echo "run _fix-links.r then run _publish.sh again"
fi

