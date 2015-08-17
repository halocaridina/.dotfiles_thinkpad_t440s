#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Merging .Xresources
# See https://wiki.archlinux.org/index.php/X_resources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Source xprofile options
[ -f /etc/xprofile ] && source /etc/xprofile
[ -f ~/.xprofile ] && source ~/.xprofile

# Load custom keymapping for X
if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

# Finally start a WM of your choice

# start herbstluftwm and its panel
# exec herbstluftwm --locked

# start i3 with log file (adjust config via -c as needed)
# exec i3 -c /home/srsantos/.i3/bling.conf -V >> /tmp/i3log-$(date +'%F-%k-%M-%S') 2>&1

# start i3 with "minimal" set up (minimal bar, no update notifications, etc)
# exec i3 -c /home/srsantos/.i3/bones.conf

# start i3 with "default" set-up
exec i3 -c /home/srsantos/.i3/bling.conf
