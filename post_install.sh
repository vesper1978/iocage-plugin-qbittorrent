#!/bin/sh


# Remove a conflict file
rm /usr/local/share/doc/qbittorrent/AUTHORS

#Install flavor port
pkg install qbittorrent-nox

#auto start after jail reboot
echo /usr/local/bin/qbittorrent-nox -d > /etc/rc.local

echo "Please open the URL and Login with Username: admin, Password: adminadmin"
