#!/usr/bin/env bash
BASEDIR=`dirname $0`
BASEDIR=`(cd "$BASEDIR"; pwd)`

echo "# Start to upload mk format files to github ..."
MSG=$1
echo "- mkdocs build"
mkdocs build --clean
echo "- mkdocs gh-deploy"
mkdocs gh-deploy
echo "# update source code"
git add -A
git commit -m "$MSG"
git push
echo "# mk format files are uploaded..."
echo "# End of uploading mk format files."

echo "# Start to deploy HTML files into poplp.github.io"
echo "# Check poplp.github.io project is cloned or not."

cd ../../
pwd

echo "# End of deploy HTML files."