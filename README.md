# Tidal Connect for rAudio 

A potential solution to breathe new life into your aging Pi 2 or Pi 3.
>


>
Install
> wget -O - https://raw.githubusercontent.com/lovehifi/tidal-raudio/main/install.sh | sh
>
>

>
------------------
Tidal Connect operates based on it with the DAC configuration automatically set from rAudio's '/etc/asound.conf'.

At times, if you encounter a successful Tidal Connect connection but there is no sound, try restarting. The command to restart Tidal Connect is
> systemctl restart tc

>
Note:
>
If you are playing Squeezelite, please switch the Squeezelite status to Player Off before playing music from Tidal Connect.
>
This version is not compatible with 64-bit OS. To run it on a 64-bit OS, you need to use Tidal Connect Docker at here: 

## Tidal Connect for rAudio 64 bit (Pi 4)
https://github.com/lovehifi/tidal-raudio-pi4/
