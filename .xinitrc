#!/bin/sh

# Change window manager name ot fix Java GUI problems. 
/usr/local/bin/wmname LG3D

# Set keyboard layout. 
setxkbmap gb

# Source key remapping. 
if [ -s ~/.Xmodmap  ]; then
	xmodmap ~/.Xmodmap
fi

# Start conky loop. 
conky | while true; read line; do xsetroot -name "$line"; done &

# Start dunst notifications. 
/usr/bin/dunst &

# Start urxvt server. 
/usr/bin/urxvtd -q -o -f &

# Start parcellite
/usr/bin/parcellite -n &

# Suspend on idle. 
/usr/bin/xautolock -time 5 -locker "/usr/bin/systemctl suspend" -detectsleep -notify 30 -notifier "/usr/bin/notify-send -u critical 'Suspend' 'System will suspend in 30 seconds'" &

# TODO: Start tmux session. 

# Start dwm in loop to allow reloads. 
while true; do /usr/local/bin/dwm; done
