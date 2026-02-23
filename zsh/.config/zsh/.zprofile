if test "$XDG_SESSION_TYPE" = "x11" && [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec startx
fi
xset -b
