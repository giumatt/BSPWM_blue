#!/bin/bash

# Colours and settings

insidecolor=00000000
ringcolor=ffffffff
keyhlcolor=63c1b3
bshlcolor=d23c3dff
separatorcolor=00000000
insidevercolor=00000000
insidewrongcolor=d23c3dff
ringvercolor=ffffffff
ringwrongcolor=ffffffff
verifcolor=ffffffff
timecolor=ffffffff
datecolor=ffffffff
loginbox=00000066
font="SFPro Display"
locktext='Type password to unlock'
wallpaper_cmd='feh --bg-fill --no-fehbg'
time_format='%H:%M:%S'

# Pre-lock instructions
prelock() {
  #if [ -n "$lock_timeout" ]; then
	#	xset dpms "$lock_timeout"
	#fi
	if [ -n "$(pidof dunst)" ]; then
		pkill -u "$USER" -USR1 dunst
	fi
	#if [[ "$runsuspend" = "true" ]]; then
	#	lockargs="$lockargs -n"
	#fi
}

# Locking function
lock() {
  i3lock \
  -S 1 \
  -c 00000000 \
  -F -i $HOME/Immagini/Sfondi/Sfondo_SS_rid.png \
  --time-pos='x+1200:h+400' \
  --date-pos='x+1137:h+420' \
  --clock --date-align 1 --date-str "$locktext" --time-str "$time_format" \
  --inside-color=$insidecolor --ring-color=$ringcolor --line-uses-inside \
  --keyhl-color=$keyhlcolor --bshl-color=$bshlcolor --separator-color=$separatorcolor \
  --insidever-color=$insidevercolor --insidewrong-color=$insidewrongcolor \
  --ringver-color=$ringvercolor --ringwrong-color=$ringwrongcolor --ind-pos='x+1290:h+390' \
  --radius=15 --ring-width=2 --verif-text='' --wrong-text='' \
  --verif-color="$verifcolor" --time-color="$timecolor" --date-color="$datecolor" \
  --time-font="$font" --date-font="$font" --layout-font="$font" --verif-font="$font" --wrong-font="$font" \
  --noinput-text='' --force-clock --pass-media-keys "$lockargs"
}

# Post-lock instructions
postlock() {
  if [ -n "$(pidof dunst)" ] ; then
		pkill -u "$USER" -USR2 dunst
	fi
}

prelock
lock
postlock
