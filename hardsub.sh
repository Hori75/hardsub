#!/bin/bash

if [ -z "$*" ]; then
   echo "Usage:";
   echo "./hardsub.sh <video path> <srt path>";
   exit 0;
elif [ -z "$2" ]; then
   echo "It needs two argument";
   echo "./hardsub.sh <video path> <srt path>";
   exit 0;
else
VIDEO="$1"
SUBTITLE="$2"
ffmpeg -i $VIDEO -vf subtitles=$SUBTITLE out.avi || { echo 'ffmpeg failed' ; exit 1; }
exit 0
fi
