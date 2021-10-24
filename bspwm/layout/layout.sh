#!/bin/sh

i="$(bspc wm -d)"
./extract_canvas <<<"$i" > layout.layout.internal
./induce_rules <<<"$i" > layout.rules.internal
