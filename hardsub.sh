#!/bin/bash

if [ -z "$*" ]; then
   echo "Usage:";
   echo "./hardsub.sh <video path> <srt path> [Font size]";
   exit 0;
elif [ -z "$2" ]; then
   echo "It needs two argument";
   echo "./hardsub.sh <video path> <srt path> [Font size]";
   exit 0;
fi

VIDEO="$1"
SUBTITLE="$2"

if [ -z "$3" ]; then
   ffmpeg -i $VIDEO -vf subtitles=$SUBTITLE out.avi || { echo 'ffmpeg failed' ; exit 1; }
   exit 0;
fi

SIZE="$3"

ffmpeg -i $VIDEO -vf subtitles=$SUBTITLE:force_style=Fontsize="$SIZE" out.avi || { echo 'ffmpeg failed' ; exit 1; }
exit 0;
