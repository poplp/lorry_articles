#!/usr/bin/env bash
BASEDIR=`dirname $0`
BASEDIR=`(cd "$BASEDIR"; pwd)`
HTML_PROJECT=poplp.github.io
HTML_SOURCE_FILES=$BASEDIR/site/
HTML_TARGET=$BASEDIR/../$HTML_PROJECT/

echo $HTML_SOURCE_FILES
echo $HTML_TARGET

echo "# Start to upload mk format files to github ..."
MSG=$1
echo "- mkdocs build"
mkdocs build --clean
echo "# update source code"
git add -A && git commit -m "$MSG" && git push
echo "# mk format files are uploaded..."
echo "# End of uploading mk format files."

echo "# Start to deploy HTML files into aliyun"