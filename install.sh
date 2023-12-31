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
wget https://raw.githubusercontent.com/lovehifi/tidal-raudio/main/tc.tgz
wget https://raw.githubusercontent.com/lovehifi/tidal-raudio/main/tidal.tgz
echo "Install"
mkdir -p /usr/ifi/ifi-tidal/Tidal-Connect-Armv7/lib
tar -xzvf tidalconnect.tar.gz -C /
tar -xzvf lib01.tgz -C /usr/ifi/ifi-tidal/Tidal-Connect-Armv7/lib/
tar -xzvf lib02.tgz -C /usr/ifi/ifi-tidal/Tidal-Connect-Armv7/lib/
tar -xzvf lib03.tgz -C /usr/ifi/ifi-tidal/Tidal-Connect-Armv7/lib/
tar -xzvf lib04.tgz -C /usr/ifi/ifi-tidal/Tidal-Connect-Armv7/lib/
tar -xzvf tc.tgz -C /etc/systemd/system/
tar -xzvf tidal.tgz -C /opt/

systemctl daemon-reload
systemctl enable tc.service
systemctl restart tc.service

cp /boot/cmdline.txt /boot/cmdline.txt.backup && sed -i '0,/ipv6.disable=1/{s/ipv6.disable=1//}' /boot/cmdline.txt
sleep 1
echo "Off the sound onboard"
grep -q "dtparam=audio=off" /boot/config.txt
if [ $? -eq 0 ]; then
echo "onboard off"
else
echo "dtparam=audio=off" | sudo tee -a /boot/config.txt
echo "onboard to off"
fi
sleep 1
if grep -q "dtparam=audio=on" /boot/config.txt; then
sudo sed -i '/dtparam=audio=on/d' /boot/config.txt
else
echo "No dtparam=audio=on"
fi
sleep 1
echo "Install Finished, system will reboot now"
if ls /root/*.tgz 1> /dev/null 2>&1; then
  for file in /root/*.tgz; do
    rm -f "$file"
  done
fi
sudo localectl set-locale LANG=en_US.UTF-8
sleep 5
# systemctl status tc.service
reboot

#wget -O - https://raw.githubusercontent.com/lovehifi/tidal-raudio/main/install.sh | sh
