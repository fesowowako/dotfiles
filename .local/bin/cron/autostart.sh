#!/bin/sh

POLKIT_AGENT=/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
WALLPAPER_SCRIPT=$HOME/.local/bin/cron/change_wallpaper.sh
STATUS_SCRIPT=/usr/local/bin/slstatus
FLAMESHOT=/usr/bin/flameshot
REMAPD=$HOME/.local/bin/remapd

# Start Polkit Authentication Agent
if [ -x $POLKIT_AGENT ]; then
    $POLKIT_AGENT &
fi

if [ -x $WALLPAPER_SCRIPT ]; then
    $WALLPAPER_SCRIPT &
fi

if [ -x $STATUS_SCRIPT ]; then
    $STATUS_SCRIPT &
fi

if [ -x $FLAMESHOT ]; then
    $FLAMESHOT &
fi

if [ -x $REMAPD ]; then
    $REMAPD &
fi

# Stop if starting via Xephyr
if [ "$DISPLAY" = ":3" ]; then
    exit
fi

if [ -f ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi
