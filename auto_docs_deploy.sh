#!/usr/bin/env bash
BASEDIR=`dirname $0`
BASEDIR=`(cd "$BASEDIR"; pwd)`

echo "Start to deploy articles onto github page..."
MSG=$1
mkdocs build
mkdocs gh-deploy
git add -A
git commit -m "$MSG"
git push

echo "Done"