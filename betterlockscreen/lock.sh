

x=$(xrandr)

if echo "$x" | grep "HDMI-A-0 disconnected"; then
	betterlockscreen -u Immagini/Sfondi/Sfondo_SS.jpg -r 1366x768 -l
else
	betterlockscreen -u Immagini/Sfondi/multi_Sfondo_SS.jpg -l
fi
