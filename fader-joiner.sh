#!/bin/bash
IFS=$'\n'
FADE_LENGTH=30
LIST="$(ls *.mkv)"
x=""

mkdir output
cd output
rm *
cd ..
j=0
for i in $LIST
do
	if [ "$j" -eq 0 ]; then
		x="\"$i\" "
		let j=j+1
		echo $j	
	else
		let j=j+1
		echo $j
		x="$x "\"$i\"" -mix $FADE_LENGTH -mixer luma"
	fi
done
x="melt $x -consumer avformat:./output/output.mp4 vcodec=libx264 b=10000k acodec=aac ab=192k preset=fast"
echo $x
eval $x
