#!/bin/sh

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
