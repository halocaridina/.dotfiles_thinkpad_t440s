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
#if [ -s ~/.Xmodmap ]; then
#    xmodmap ~/.Xmodmap
#fi

# Start gnome-keyring-daemon
#eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets)
#export SSH_AUTH_SOCK

# Finally start a WM of your choice, with i3 bling being the default
#case $WM in
#herb)
#	exec /usr/bin/herbstluftwm --locked
#	;;
#i3)
#	exec /usr/bin/i3 -c /home/srsantos/.i3/bling.conf
#	;;
#i3-bones)
#	exec /usr/bin/i3 -c /home/srsantos/.i3/bones.conf
#	;;
#i3-debug)
#	exec /usr/bin/i3 -c /home/srsantos/.i3/bling.conf -V >> /tmp/i3log-$(date +'%F-%k-%M-%S') 2>&1
#	;;
#*)
#	exec /usr/bin/i3 -c /home/srsantos/.i3/bling.conf
#	;;
#esac

##exec /usr/bin/urxvtc
