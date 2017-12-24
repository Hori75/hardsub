#!/bin/bash

if [ -z "$*" ]; then
   echo "Usage:";
   echo "./hardsub.sh <video path> <srt path> [OPTIONS]";
   echo "OPTIONS:";
   echo " --size=     : Configures the font size";
   echo " --colour=   : Configures the font colour (hexadecimal in Blue Green Red order)";
   echo " --font=     : Configures the type of font used";
   exit 0;
elif [ -z "$2" ]; then
   echo "It needs two argument";
   echo "./hardsub.sh <video path> <srt path> [FOPTIONS]";
   echo "OPTIONS:";
   echo " --size=     : Configures the font size";
   echo " --colour=   : Configures the font colour (hexadecimal in Blue Green Red order)";
   echo " --font=     : Configures the type of font used";
   exit 0;
fi

VIDEO="$1"
SUBTITLE="$2"

if [ -z "$3" ]; then
   ffmpeg -i $VIDEO -vf subtitles=$SUBTITLE out.avi || { echo 'ffmpeg failed' ; exit 1; }
   exit 0;
fi

case "$3" in
   "--size="*)
      SIZE=${3:7}
    ;;
    "--colour="*)
      COLOUR=${3:9}
    ;;
    "--font="*)
      FONT=${3:7}
    ;;
esac

case "$4" in
   "--size="*)
      SIZE=${4:7}
    ;;
    "--colour="*)
      COLOUR=${4:9}
    ;;
    "--font="*)
      FONT=${4:7}
    ;;
esac

case "$5" in
   "--size="*)
      SIZE=${5:7}
    ;;
    "--colour="*)
      COLOUR=${5:10}
    ;;
    "--font="*)
      FONT=${5:8}
    ;;
esac

if [  -z "$SIZE" ] && [ -z "$COLOUR"  ]; then
   ffmpeg -i $VIDEO -vf "subtitles=$SUBTITLE:'force_style=FontName="$FONT"'" out.avi || { echo 'ffmpeg failed' ; exit 1; }
elif [  -z "$SIZE" ] && [ -z "$FONT"  ]; then
   ffmpeg -i $VIDEO -vf "subtitles=$SUBTITLE:'force_style=PrimaryColour="$COLOUR"'" out.avi || { echo 'ffmpeg failed' ; exit 1; }
elif [  -z "$FONT" ] && [ -z "$COLOR"  ]; then
   ffmpeg -i $VIDEO -vf "subtitles=$SUBTITLE:'force_style=Fontsize="$SIZE"'" out.avi || { echo 'ffmpeg failed' ; exit 1; }
elif [ -z "$SIZE" ]; then
   ffmpeg -i $VIDEO -vf "subtitles=$SUBTITLE:'force_style=FontName="$FONT",PrimaryColour="$COLOUR"'" out.avi || { echo 'ffmpeg failed' ; exit 1; } 
elif [ -z "$FONT" ]; then
   ffmpeg -i $VIDEO -vf "subtitles=$SUBTITLE:'force_style=Fontsize="$SIZE",PrimaryColour="$COLOUR"'" out.avi || { echo 'ffmpeg failed' ; exit 1; }
elif [ -z "$COLOUR" ]; then
   ffmpeg -i $VIDEO -vf "subtitles=$SUBTITLE:'force_style=Fontsize="$SIZE",FontName="$FONT"'" out.avi || { echo 'ffmpeg failed' ; exit 1; }
else
   ffmpeg -i $VIDEO -vf "subtitles=$SUBTITLE:'force_style=Fontsize="$SIZE",FontName="$FONT",PrimaryColour="$COLOUR"'" out.avi || { echo 'ffmpeg failed' ; exit 1; }
fi

exit 0;
