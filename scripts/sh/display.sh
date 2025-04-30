#!/bin/zsh

if [[ $# -lt 3 || $# -gt 4 ]]; then
    echo "Usage: $0 <main_monitor> <second_monitor> <position> <underscan>"
    exit 1
fi

main="$1"
display="$2"
position="$3"
underscan="$4"

case "$position" in
    mirror) option="--same-as" ;;
    left) option="--left-of" ;;
    right) option="--right-of" ;;
    above) option="--above" ;;
    bellow) option="--below" ;;
    *) 
        echo "Invalid position. Use: mirror, left, right, above, bellow."
        exit 1
    ;;
esac


xrandr --fb 1920x1080 --output "$main" --mode 1366x768 --scale-from 1920x1080 --output "$display" --mode 1920x1080 --scale 1x1 "$option" "$main"
# xrandr --output "$display" $option "$main" --scale 1x1

if [[ "$underscan" == "underscan" ]]; then
    xrandr --output "$display" --set underscan on
fi
