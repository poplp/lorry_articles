#!/usr/bin/env bash
BASEDIR=`dirname $0`
BASEDIR=`(cd "$BASEDIR"; pwd)`

echo "Start to deploy articles onto github page..."
MSG=$1
echo "- mkdocs build"
mkdocs build --clean
echo "- mkdocs gh-deploy"
mkdocs gh-deploy
echo "update source code"
git add -A
git commit -m "$MSG"
git push

echo "Done"