FROM armv7/armhf-debian:jessie

MAINTAINER Andreas Mahnke <mahnkong@gmx.de>

COPY qemu-arm-static /usr/bin/qemu-arm-static

COPY asound.conf /etc/asound.conf
COPY mpd.conf /etc/mpd.conf
COPY mpd-entrypoint.sh /opt/mpd-entrypoint.sh

EXPOSE 6600

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y mpd mpc \
    && apt-get autoremove -y && rm -f /usr/bin/qemu-arm-static

ENTRYPOINT ["/opt/mpd-entrypoint.sh"]
