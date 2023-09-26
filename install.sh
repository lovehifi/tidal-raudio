#!/bin/bash

if ls /root/*.tgz 1> /dev/null 2>&1; then
  for file in /root/*.tgz; do
    rm -f "$file"
  done
fi

if ls /root/*.tar.gz 1> /dev/null 2>&1; then
  for file in /root/*.tar.gz; do
    rm -f "$file"
  done
fi

echo "Download"
wget https://raw.githubusercontent.com/lovehifi/tidal-raudio/main/tidalconnect.tar.gz
wget https://raw.githubusercontent.com/lovehifi/pacman-smpd_1.x/main/lib03.tgz
wget https://raw.githubusercontent.com/lovehifi/pacman-smpd_1.x/main/lib04.tgz
wget https://raw.githubusercontent.com/lovehifi/tidal-raudio/main/lib01.tgz
wget https://raw.githubusercontent.com/lovehifi/pacman-smpd_1.x/main/lib02.tgz
echo "Install"
mkdir -p /usr/ifi/ifi-tidal/Tidal-Connect-Armv7/lib
tar -xzvf tidalconnect.tar.gz -C /
tar -xzvf lib01.tgz -C /usr/ifi/ifi-tidal/Tidal-Connect-Armv7/lib/
tar -xzvf lib02.tgz -C /usr/ifi/ifi-tidal/Tidal-Connect-Armv7/lib/
tar -xzvf lib03.tgz -C /usr/ifi/ifi-tidal/Tidal-Connect-Armv7/lib/
tar -xzvf lib04.tgz -C /usr/ifi/ifi-tidal/Tidal-Connect-Armv7/lib/

cp -f /usr/ifi/ifi-tidal/Tidal-Connect-Armv7/tc.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable tc.service
systemctl restart tc.service

echo "Install Finished"
if ls /root/*.tgz 1> /dev/null 2>&1; then
  for file in /root/*.tgz; do
    rm -f "$file"
  done
fi

systemctl status tc.service

#wget -O - https://raw.githubusercontent.com/lovehifi/tidal-raudio/main/install.sh | sh