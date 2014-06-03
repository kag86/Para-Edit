#!/bin/bash
# 
# Description: invokes high quality video conversion with FFMPEG to move video out of Apple Intermediate Content.
IFS=$'\n'
LIST="$(ls *.mov)"
j=0
for i in $LIST; do
	echo $j
	((j++))
	NEWNAME=$(ls ""$i"" | sed -e 's/mov/mkv/')
	
	echo "./ffmpeg/ffmpeg -i  ""$i"" ""$NEWNAME"""

	./ffmpeg/ffmpeg -i  ""$i"" -vcodec libx264 -preset ultrafast -qp 0 -acodec copy ""$NEWNAME""
done
