#!/bin/sh

i="$(bspc wm -d)"
./extract_canvas <<<"$i" > layout.layout.internal   # To extract the layout of the wanted windows in each workspace
./induce_rules <<<"$i" > layout.rules.internal      # To extract bspc rules from the layout
