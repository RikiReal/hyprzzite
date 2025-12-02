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
dnf5 -y install 	\
	timg		\
	btop		\
	kitty		\
	fish		\
	nautilus	\
	fastfetch	\
	kvantum

dnf5 -y config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
### Remove this directory so brave can install, otherwise it cannot unpack the rpm
rm -rf /opt/brave.com
dnf5 -y install brave-browser

### Installing more apps that are not in the repository
curl -fsSL https://starship.rs/install.sh | sh
curl -fsSL https://superfile.dev/install.sh | sh
curl -fsSL https://zed.dev/install.sh | sh
curl -fsSLo /usr/local/bin/yadm https://github.com/yadm-dev/yadm/raw/master/yadm && chmod a+x /usr/local/bin/yadm
