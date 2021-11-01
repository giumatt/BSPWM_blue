#!/bin/sh

# Script to eval if the external monitor is plugged in and use one layout
# or another to create the windows frames and start the apps

x=$(xrandr)

if echo "$x" | grep "HDMI-A-0 connected"; then
	bspc wm -l $HOME/.config/bspwm/layout/layout.layout.internal
	sh $HOME/.config/bspwm/layout/layout.rules.internal
	sh $HOME/.config/bspwm/layout/layout.init
else
	bspc wm -l $HOME/.config/bspwm/layout/layout.layout.internal
	sh $HOME/.config/bspwm/layout/layout.rules.internal
	sh $HOME/.config/bspwm/layout/layout.init
fi
