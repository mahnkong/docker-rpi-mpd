#!/bin/bash

ASOUND_PCM_CARD_ID=${ASOUND_PCM_CARD_ID:="hw:1,0"}
MUSIC_ROOTDIR=${MUSIC_ROOTDIR:="/mnt/music"}
MPD_ROOTDIR=${MPD_ROOTDIR:="/mnt/mpd"}

if [ ! -d $MUSIC_ROOTDIR ]; then
    echo "Music Rootdir '${MUSIC_ROOTDIR}' does not exist!"
    exit 1
fi

if [ ! -d $MPD_ROOTDIR ]; then
    echo "MPD Rootdir '${MPD_ROOTDIR}' does not exist!"
    exit 1
else
    chown -R mpd:audio $MPD_ROOTDIR
fi

sed -i -e "s|%ASOUND_PCM_CARD_ID%|${ASOUND_PCM_CARD_ID}|g" /etc/asound.conf
sed -i -e "s|%MUSIC_ROOTDIR%|${MUSIC_ROOTDIR}|g; s|%MPD_ROOTDIR%|${MPD_ROOTDIR}|g" /etc/mpd.conf

echo "Starting mpd..."
mpd -v --no-daemon /etc/mpd.conf
