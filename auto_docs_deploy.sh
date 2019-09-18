#!/usr/bin/env bash

while getopts ":m:p:" opt
do
    case $opt in 
        m)
        echo "git message: $OPTARG"
        MSG=$OPTARG
        ;;
        p)
        echo "aliyun ssh password: $OPTARG"
        PASSWORD=$OPTARG
        ;;
    esac
done
if [ ! -n "$MSG" -o "$MSG" = "" ] 
then
    echo "Please specify the option -m (submit message)"
    exit 0;
fi
if [ ! -n "$PASSWORD" -o "$PASSWORD" = "" ] 
then
    echo "Please specify the aliyun password option -p"
    exit 0;
fi

BASEDIR=`dirname $0`
BASEDIR=`(cd "$BASEDIR"; pwd)`
HTML_SOURCE_FILES=$BASEDIR/site

echo $HTML_SOURCE_FILES

echo "# Start to upload mk format files to github ..."

echo "- mkdocs build"
mkdocs build --clean
echo "# update source code"
git add -A && git commit -m "$MSG" && git push
echo "# mk format files are uploaded..."
echo "# End of uploading mk format files."

echo "# Start to deploy HTML files into aliyun"
./expect.sh $HTML_SOURCE_FILES $PASSWORD