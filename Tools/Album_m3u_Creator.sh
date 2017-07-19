# Creates M3U's for each album in you music collection!
# 
# Change MUSIC_DIR to where your music is, and PLAYLIST_DIR to where you want the 
#  playlists exported to. The default is a config for macOS with beets and mpd.
# 
# By Reid Sox-Harris
# 

#!/bin/bash
export IFS=$'\n'

MUSIC_DIR=~/Music/beets/
PLAYLIST_DIR=~/.mpd/playlists/

cd "$MUSIC_DIR"

for file in "$PLAYLIST_DIR"/_*.m3u
do
	rm $file
done

for h in $(find "$(pwd)" -type d -mindepth 2)
do
	cd $(echo $h | tr -d '\r')
	touch "_${PWD##*/}.m3u"

	for i in $(find "$(pwd)" -name "*.m4a" -o -name "*.mp3" -o -name "*.aiff" -o -name "*.flac" -type f)
	do 
		echo "$i" >> "_${PWD##*/}.m3u"
	done
	mv "_${PWD##*/}.m3u" "$PLAYLIST_DIR"
done

echo M3Us created from "$MUSIC_DIR" and put into "$PLAYLIST_DIR"!

cd "$MUSIC_DIR"