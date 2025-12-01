#!/bin/bash

set -ouex pipefail

### Remove KDE plasma and waydroid
dnf5 -y remove		\
       	plasma-* 	\
	kde*		\
       	konsole 	\
	steamdeck-kde-presets-desktop	\
	waydroid

### Install packages

dnf5 -y copr enable solopasha/hyprland
dnf5 -y copr enable erikreider/SwayNotificationCenter

### Installing hyprland specific packages
dnf5 -y install		\
	hyprland	\
	hyprlock	\
	hypridle	\
	hyprpaper	\
	hyprcursor	\
	hyprsunset	\
	xdg-desktop-portal-hyprland	\
	xdg-desktop-portal-gtk		\
	hyprpolkitagent		\
	SwayNotificationCenter

dnf5 -y copr disable solopasha/hyprland
dnf5 -y copr disable erikreider/SwayNotificationCenter

### Installing system utilities
# Is pre-enabled
# dnf5 -y copr enable che/nerd-fonts
dnf5 -y install		\
	nerd-fonts	\
	waybar		\
	rofi		\
	qt5-qtwayland	\
	qt6-qtwayland	\
	wl-clipboard	\
	wlogout		\
	pipewire	\
	wireplumber	\
	playerctl	\
	ddcutil		\
	network-manager-applet \
	sddm		\
	grim		\
	slurp		\
	swappy		\
	gnome-keyring	\
	udiskie		\
	wob

### Installing user apps 
dnf5 copr enable atim/starship

dnf5 -y install 	\
	timg		\
	btop		\
	kitty		\
	fish		\
	starship	\
	nautilus	\
	fastfetch	\
	Kvantum

dnf5 copr disable atim/starship

### Add binaries of zed/code, superfile, brave browser, yadm? directly to image using their binaries
