#!/bin/sh
echo connect 00:18:00:3D:24:A4 | bluetoothctl
sleep 2
xmodmap ~/.dotfiles/misc/.xmodmap 
