#!/bin/bash
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

yay -S cronie picom-git awesome-git acpid git mpd ncmpcpp wmctrl \
firefox lxappearance gucharmap thunar alacritty neovim polkit-gnome \
xdotool xclip scrot brightnessctl alsa-utils pulseaudio jq acpi rofi \
inotify-tools zsh mpDris2 bluez bluez-utils bluez-plugins acpi acpi_call \
playerctl redshift cutefish-cursor-themes-git cutefish-icons upower xorg tar \
feh imagemagick maim gpick gcalculator neofetch discord steam heroic-games-launcher-bin \
betterdiscordctl python-mutagen libnotify python ruby-git lua ly rofi lxappearance\

cd 
mkdir .backup_config
cp -r ~/.config/* .backup_config/
cp -r ~/.mpd .backup_config/
cp -r ~/.ncmpcpp .backup_config/
cp -r ~/.themes .backup_config/

cd
git clone --recurse-submodules https://github.com/d-solis/dotfiles/tree/awesome
cd dotfiles

cp -rf .config/* ~/.config/
cp -rf extras/mpd ~/.mpd
cp -rf extras/ncmpcpp ~/.ncmpcpp
cp -rf extras/fonts ~/.fonts
cp -rf extras/scripts ~/.scripts
cp -rf extras/oh-my-zsh ~/.oh-my-zsh

mkdir ~/.themes
cp ./themes/* ~/.themes
cd ~/.themes
tar -xf Awesthetic.tar
tar -xf Cutefish-light-modified.tar
rm Awesthetic.tar Cutefish-light-modified.tar

cd ~/.config/awesome/misc
sudo chmod -R +x *

systemctl --user enable mpd
systemctl --user enable mpDris2
sudo systemctl enable cronie
sudo systemctl enable bluetooth
sudo systemctl enable wpa_supplicant

sudo reboot --reboot -f
#This bash script reboots your system at the end of its installation, make sure to always close and save all applications beforehand, i am not responsible for any lost data.
