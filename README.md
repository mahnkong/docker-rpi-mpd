# docker-rpi-mpd - Docker image for MPD on a raspberrypi
![Travis build status](https://api.travis-ci.org/mahnkong/docker-rpi-mpd.svg?branch=master)

## Usage

A typical invocation of the container would be:
```
docker run --privileged -v /path/to/music:/mnt/music -v /path/to/mpddata:/mnt/mpd -p 6600:6600 mahnkong/docker-rpi-mpd
```

## Environment Variables

The following environment variables can be set to configure the instance:

```
ASOUND_PCM_CARD_ID: ID of the sound card for the asound.conf file (Defaults to: "hw:1,0")
MUSIC_ROOTDIR: Mount point of the music dir inside the container (Defaults to: "/mnt/music")
MPD_ROOTDIR: Mount point of the mpd data (music db, state, ...) dir inside the container (Defaults to: "/mnt/mpd")
```
