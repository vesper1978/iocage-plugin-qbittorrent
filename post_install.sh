#!/bin/sh

# Prepare the system
pw useradd -n qbt -u 8675309 -m -c "qbittorrent Client" -s /usr/sbin/nologin -w no

mkdir -p /home/qbt/.config/qbt
chown -R qbt:qbt /home/qbt/

mkdir /Downloads
chown qbt:qbt /Downloads

#Install flavor port
pkg install qbittorrent-nox

sysrc -f /etc/rc.conf qbittorrent_enable="YES"
sysrc -f /etc/rc.conf qbittorrent_user="qbt"

sed -i '' 's|/var/db/qbittorrent/conf|/home/qbt/.config/qbt|g' /usr/local/etc/rc.d/qbittorrent
sed -i '' 's|/var/db/qbittorrent/Downloads|/Downloads|g' /usr/local/etc/rc.d/qbittorrent

service qbittorrent start

echo "Please open the URL and Login with Username: admin, Password: adminadmin" > /root/PLUGIN_INFO
