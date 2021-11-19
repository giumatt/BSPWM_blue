#!/bin/bash

i="$(bspc wm -d)"
./extract_canvas <<<"$i" > layout.layout.monitor   # To extract the layout of the wanted windows in each workspace
./induce_rules <<<"$i" > layout.rules.monitor      # To extract bspc rules from the layout
