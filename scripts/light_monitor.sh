#!/bin/bash

# This script check if the monitor is plugged and change the settings on LightDM
# conf file to match the screens configuration.

if [ "$1" = "monitor" ]; then
  sed -i '/display-setup-script=xrandr --output HDMI-A-0 --primary --mode 1920x1080/s/^/#/g' /etc/lightdm/lightdm.conf
  sed -i '/active-monitor = eDP/s/^#//g' /etc/lightdm/lightdm-gtk-greeter.conf
  sed -i '/active-monitor = HDMI-A-0/s/^/#/g' /etc/lightdm/lightdm-gtk-greeter.conf
  systemctl restart lightdm
elif [ "$1" = "HDMI" || $1 = "hdmi" ]; then
  sed -i '/display-setup-script=xrandr --output HDMI-A-0 --primary --mode 1920x1080/s/^#//g' /etc/lightdm/lightdm.conf
  sed -i '/active-monitor = eDP/s/^/#/g' /etc/lightdm/lightdm-gtk-greeter.conf
  sed -i '/active-monitor = HDMI-A-0/s/^#//g' /etc/lightdm/lightdm-gtk-greeter.conf
  systemctl restart lightdm
fi
