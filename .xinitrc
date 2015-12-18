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

# TODO: Start tmux session. 

# Start dwm in loop to allow reloads. 
while true; do /usr/local/bin/dwm; done
