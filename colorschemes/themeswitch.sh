#! /bin/bash
ERROR="\033[0;31m"
SUCCES="\033[1;32m"
RESET="\033[0m"
theme_dir="$HOME/.config/colorschemes"

colorscheme="$1"
theme="$theme_dir/$colorscheme"

#if the user doesn't enter a valid theme name
if [ ! -d $theme ]; then
  echo ""
  echo -e "${ERROR}Not a valid theme name!${RESET}"
  echo ""
  echo -e "${SUCCES}Available themes:${RESET}"
  echo ""
  ls $theme_dir
  echo ""
  exit 1
fi

#if the user doesn't enter a theme name
if [ -z "$colorscheme" ]; then
  echo ""
  echo -e "${ERROR}No theme selected!${RESET}"
  echo ""
  echo -e "${SUCCES}Usage: ts <themename>${RESET}"
  echo ""
  exit 1
fi

echo ""
echo -e "${SUCCES}Applying theme: ${RESET}"

#Wallpaper
echo ""
echo "Updating wallpaper..."
echo ""
swww img "$theme/wallpaper.png" --transition-type any --transition-fps 60

#Waybar
echo "Updating Waybar configuration..."
echo ""
ln -sf ~/.config/colorschemes/$colorscheme/waybar/colors.css ~/.config/waybar/curap/colors.css
killall -SIGUSR2 waybar > /dev/null 2>&1

#Kitty
echo "Updating Kitty configuration..."
echo ""
ln -sf ~/.config/colorschemes/$colorscheme/kitty/theme.conf ~/.config/kitty/theme.conf 
killall -USR1 kitty

#Hyprland
echo "Updating Hyprland configuration..."
echo ""
ln -sf ~/.config/colorschemes/$colorscheme/hyprland/look.conf ~/.config/hypr/look.conf 

#GTK
echo "Updating GTK configuration..."
echo ""
ln -sf ~/.config/colorschemes/$colorscheme/gtk/settings.ini ~/.config/gtk-4.0/settings.ini 
ln -sf ~/.config/colorschemes/$colorscheme/gtk/settings.ini ~/.config/gtk-3.0/settings.ini 

case $colorscheme in
  "catppuccin")
    gtk_theme="catppuccin-mocha-mauve-standard+default"
    icon_theme="Catppuccin-Mocha";;
  "nord")
    gtk_theme="Nordic-darker"
    icon_theme="NordArc-Icons";;
  "gruvbox")
    gtk_theme="gruvbox-dark-gtk"
    icon_theme="gruvbox-dark-icons-gtk";;
esac

gsettings set org.gnome.desktop.interface gtk-theme "$gtk_theme" > /dev/null 2>&1
gsettings set org.gnome.desktop.interface icon-theme "$icon_theme" > /dev/null 2>&1

#Neovim
echo "Updating Neovim configuration..."
echo ""
ln -sf ~/.config/colorschemes/$colorscheme/nvim/theme.lua ~/.config/nvim/lua/plugins/theme.lua 

#Rofi
echo "Updating Rofi configuration..."
echo ""
ln -sf ~/.config/colorschemes/$colorscheme/rofi/config.rasi ~/.config/rofi/config.rasi

echo -e "${SUCCES}Theme $colorscheme succesfully applied!${RESET}"
echo ""

