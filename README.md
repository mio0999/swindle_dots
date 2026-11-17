# swindle_dots
dot files for swindle

Depencies:
swindle
waybar
wofi
foot
swaybg
grim
pipewire
wireplumber
pipewire pulse
dbus
dbus-openrc
xwayland
brightnessctl
fontconfig
Libertinus Mono font
Xanh Mono font

Instructions:
clone the repo with:
  git clone https://github.com/mio0999/swindle-dots

find the dots you want for example mountain-darkblue
you can check how each dots looks in the showcase folder

then move files from foot folder to /home/$USER/.config/foot/
from swindle folder to /home/$USER/.config/swindle/
from waybar folder to /home/$USER/.config/waybar
from wofi folder to /home/$USER/.config/wofi
also you can add fastfetch config.jsonc to /home/$USER/.config/fastfetch/

start swindle like this "dbus-run-session swindle"

and you should be done

to change wallpaper simply change the swaybg directory in config.lua in austart section
