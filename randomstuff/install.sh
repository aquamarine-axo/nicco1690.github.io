#!/bin/bash
yay -S picom-git awesome-git acpid git mpd ncmpcpp wmctrl \
firefox lxappearance gucharmap thunar alacritty neovim polkit-gnome \
xdotool xclip scrot brightnessctl alsa-utils pulseaudio jq acpi rofi \
inotify-tools zsh mpdris2 bluez bluez-utils bluez-plugins acpi acpi_call \
playerctl redshift cutefish-cursor-themes-git cutefish-icons upower xorg xorg-init tar

cd 
mkdir .backup_config
cp -r ~/.config/* .backup_config/
cp -r ~/.mpd .backup_config/
cp -r ~/.ncmpcpp .backup_config/
cp -r ~/.themes .backup_config/

cd
git clone --recurse-submodules https://github.com/saimoomedits/dotfiles.git
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
sudo systemctl enable bluetooth
reboot -t 0