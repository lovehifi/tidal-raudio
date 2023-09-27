# Tidal Connect for rAudio 

A potential solution to breathe new life into your aging Pi 2 or Pi 3.
>


>
Install
> wget -O - https://raw.githubusercontent.com/lovehifi/tidal-raudio/main/install.sh | sh
>
>
We need to remove ipv6.disable=1 in cmdline.txt for Tidal Connect to work. Command:
>
> cp /boot/cmdline.txt /boot/cmdline.txt.backup && sed -i '0,/ipv6.disable=1/{s/ipv6.disable=1//}' /boot/cmdline.txt
>
------------------
At times, if you encounter a successful Tidal Connect connection but there is no sound, try restarting. The command to restart Tidal Connect is
> systemctl restart tc

>
You may not need to install Docker for this version (32 bit).
>
This version is not compatible with 64-bit OS. To run it on a 64-bit OS, you need to use Tidal Connect Docker at here: 
>
[GioF71/tidal-connect](https://github.com/GioF71/tidal-connect)
and
[rern/rAudio Discussions](https://github.com/rern/rAudio/discussions/830#discussioncomment-7105887)


