#! /bin/bash
theme_dir="$HOME/.config/colorschemes"

colorscheme=$(echo -e "Catppuccin\nNord\nGruvbox\nGruvbox Light" | rofi -dmenu -i -p "Select theme:")

case "$colorscheme" in
  "Catppuccin")
    colorscheme="catppuccin";;
  "Nord")
    colorscheme="nord";;
  "Gruvbox")
    colorscheme="gruvbox";;
  "Gruvbox Light")
    colorscheme="gruvbox_light";;
esac

if [ -z "$colorscheme" ]; then
  exit 1
fi

theme="$theme_dir/$colorscheme"

#Wallpaper
swww img "$theme/wallpaper.png" --transition-type any --transition-fps 60

#Waybar
ln -sf ~/.config/colorschemes/$colorscheme/waybar/colors.css ~/.config/waybar/curap/colors.css
killall -SIGUSR2 waybar

#Kitty
ln -sf ~/.config/colorschemes/$colorscheme/kitty/theme.conf ~/.config/kitty/theme.conf 
killall -USR1 kitty

#Hyprland
ln -sf ~/.config/colorschemes/$colorscheme/hyprland/look.conf ~/.config/hypr/look.conf 

#GTK
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
  "gruvbox_light")
    gtk_theme="gruvbox-dark-gtk"
    icon_theme="gruvbox-dark-icons-gtk";;
esac

gsettings set org.gnome.desktop.interface gtk-theme "$gtk_theme" > /dev/null 2>&1
gsettings set org.gnome.desktop.interface icon-theme "$icon_theme" > /dev/null 2>&1

#Neovim
ln -sf ~/.config/colorschemes/$colorscheme/nvim/theme.lua ~/.config/nvim/lua/plugins/theme.lua 

#Rofi
ln -sf ~/.config/colorschemes/$colorscheme/rofi/config.rasi ~/.config/rofi/config.rasi
