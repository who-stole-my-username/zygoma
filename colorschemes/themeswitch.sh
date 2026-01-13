#! /bin/bash
ERROR="\033[0;31m"
SUCCES="\033[1;32m"
RESET="\033[0m"
theme_dir="$HOME/.config/colorschemes"

#if the user doesn't enter a theme name
if [ -z "$1" ]; then
  echo -e "${ERROR}No theme selected!${RESET}"
  echo "Usage: ts <themename>"
  exit 1
fi

theme="$theme_dir/$1"

#if file doesn't exist
if [ ! -e "$theme" ]; then
  echo -e "${ERROR}No theme found with that name!${RESET}"
  exit 1
fi

#Wallpaper
echo ""
echo "Switching the wallpaper..."
echo ""
swww img "$HOME/.config/colorschemes/$1/wallpaper.png" --transition-type center

#Waybar
echo "Switching waybar theme..."
echo ""
cp "$theme/waybar/"* "$HOME/.config/waybar/curap/"
killall waybar
waybar -c "$HOME/.config/waybar/curap/config.jsonc" -s "$HOME/.config/waybar/curap/style.css" > /dev/null 2>&1 & disown

#Foot
echo "Switching terminal theme..."
echo ""
cp "$theme/foot/foot.ini" "$HOME/.config/foot/"
killall foot
foot --server > /dev/null 2>&1 & disown

#Hyprland
echo "Switching hyprland theme..."
echo ""
cp "$theme/hyprland/look.conf" "$HOME/.config/hypr/"

#gtk
echo "Switching gtk theme..."
echo ""
cp "$theme/gtk/settings.ini" "$HOME/.config/gtk-4.0/"
cp "$theme/gtk/settings.ini" "$HOME/.config/gtk-3.0/"

if [ $1 = "nord" ]; then
  gsettings set org.gnome.desktop.interface gtk-theme "Nordic-darker"
elif [ $1 = "catppuccin" ]; then
  gsettings set org.gnome.desktop.interface gtk-theme "catppuccin-mocha-mauve-standard+default"
fi

#nvim
echo "Switching nvim theme..."
echo ""
cp "$theme/nvim/theme.lua" "$HOME/.config/nvim/lua/plugins/"

echo -e "${SUCCES}Theme $1 succesfully applyed!${RESET}"
echo ""
