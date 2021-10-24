#!/bin/bash

battery_stat="$(acpi --battery)"
battery_greped_status="$(echo $battery_stat | grep -Pio 'remaining|charged')"
battery_percentage_v="$(echo $battery_stat | grep -Po '(\d+%)' | grep -Po '\d+')"


if [ "$battery_greped_status" == "remaining" ]; then
        runtime="$(echo $battery_stat | grep -Po '[0-9]+:[0-9]+:[0-9]+')"

        if [ "$battery_percentage_v" > 22 ] && [ "$battery_pexrcentage_v" < 26 ]; then
                dunstify -a system -i "/usr/share/icons/Adwaita/48x48/status/battery-level-20-symbolic.symbolic.png" -t 9000 -r 9990 -u normal "Battery Running Low" "${battery_percentage_v}% Remaining\nRuntime $runtime"

        elif [ "$battery_percentage_v" > 12 ] && [ "$battery_percentage_v" < 16 ]; then
                echo "> 12 && <16"
                dunstify -a system -i "/usr/share/icons/Adwaita/48x48/status/battery-level-10-symbolic.symbolic.png" -t 9000 -r 9990 -u critical "Low Battery: ${battery_percentage_v}%" "Connect charger\nWill Hibernate soon"


        elif [ "$battery_percentage_v" < 11 ]; then
                dunstify -a system -i "/usr/share/icons/Adwaita/48x48/status/battery-level-0-symbolic.symbolic.png" -t 0 -r 9990 -u critical "Battery Critically Low" "${battery_percentage_v}% Remaining.\nRuntime: $runtime"
        fi

# Remind to disconnect charger if battery >=85%
elif [ "$battery_greped_status" == "charged" ]; then

    if [ "$battery_percentage_v" > 85 ]; then
        dunstify -a system -i "/usr/share/icons/elementary/status/48/battery-full-charged.svg" -t 9000 -r 9990 -u normal "Battery ${battery_percentage_v}%" "Disconnect Charger please."
    fi
fi
