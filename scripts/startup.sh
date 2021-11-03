#! /bin/bash

# Startup applications

setxkbmap it &
$HOME/.screenlayout/ciao.sh
nitrogen --restore &
xsetroot -cursor_name left_ptr &
#xsetwacom set "Wacom Intuos S 2 Pen stylus" Area 0 0 15200 8550 &
#xsetwacom set "Wacom Intuos S 2 Pen stylus" MapToOutput 1920x1080+0+0 &
picom -f &
$HOME/.config/polybar/launch.sh &
/usr/bin/dunst &
pgrep -f bitwarden > /dev/null || bitwarden-desktop &   # To launch one time Bitwarden and opensnitch
pgrep -x opensnitch-ui > /dev/null || opensnitch-ui &
#redshift &
numlockx &
