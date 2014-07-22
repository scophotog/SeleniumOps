#!/bin/sh
# setupSelenium.sh
# Written by Scott Argenziano <scott.arg@gmail.com>
#
# Description: Downloads and symlinks the selenium jar

VERSION=2.40
JAR_NAME=selenium-server-standalone-"$VERSION".0.jar
CURL=`which curl`
SELENIUM_URL=http://selenium-release.storage.googleapis.com/$VERSION/$JAR_NAME
SELENIUM_SYM=selenium-server.jar

if [ -e $JAR_NAME ];
then
  echo "$JAR_NAME already exists"
  if [ ! -e $SELENIUM_SYM ];
  then
    echo "Link missing, creating..."
    ln -s ./$JAR_NAME $SELENIUM_SYM
    if [ -L $SELENIUM_SYM ];
    then
      echo "Success!"
      exit 0
    fi
  else
    echo "$JAR_NAME is already linked to $SELENIUM_SYM"
    exit 1
  fi
fi

if [ -f $CURL ];
then
  echo "Downloading $SELENIUM_URL"
  echo
  $CURL -O $SELENIUM_URL
else
  echo "'curl' is required"
  exit 1
fi

if [ -s $JAR_NAME ];
then
  echo "Linking $JAR_NAME"
  ln -s ./$JAR_NAME $SELENIUM_SYM
else
  echo "Download may have failed"
  exit 1
fi

