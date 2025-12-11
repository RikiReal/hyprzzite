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
	pavucontrol	\
	playerctl	\
	ddcutil		\
	network-manager-applet \
	sddm		\
	grim		\
	slurp		\
	swappy		\
	gnome-keyring	\
	gnome-keyring-pam \
	udiskie		\
	wob		\
	xwaylandvideobridge

### Installing user apps 
dnf5 -y install 	\
	timg		\
	btop		\
	kitty		\
	fish		\
	nautilus	\
	fastfetch	\
	kvantum		\
	lxappearance

dnf5 -y config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
dnf5 -y install brave-browser

### Installing more apps that are not in the repository
curl -fsSL https://starship.rs/install.sh | sh -s -- "--yes" "--bin-dir=/usr/bin"
curl -fsSLo /usr/bin/yadm https://github.com/yadm-dev/yadm/raw/master/yadm && chmod a+x /usr/bin/yadm

### Install zed
curl -fsSLo zed.tar.gz "https://cloud.zed.dev/releases/stable/latest/download?asset=zed&arch=x86_64&os=linux"
tar -xzf zed.tar.gz
rm -f zed.tar.gz
mv zed.app /opt/
ln -sf /opt/zed.app/bin/zed /usr/bin/zed
cp /opt/zed.app/share/applications/zed.desktop /usr/share/applications/dev.zed.Zed.desktop
sed -i "s|Icon=zed|Icon=/opt/zed.app/share/icons/hicolor/512x512/apps/zed.png|g" /usr/share/applications/dev.zed.Zed.desktop
sed -i "s|Exec=zed|Exec=/opt/zed.app/libexec/zed-editor|g" /usr/share/applications/dev.zed.Zed.desktop

# Install superfile 
# Because their install script requires interactive sudo, which I cant do in a container install
SUPERFILE_VERSION="$(curl -fsSL -H "Accept: application/vnd.github+json" https://api.github.com/repos/yorukot/superfile/releases/latest | grep '"tag_name"' | awk -F ":" '{ print $2 }' | tr -d '",[:blank:]')"
FILENAME="superfile-linux-${SUPERFILE_VERSION}-amd64"
curl -fsSLO "https://github.com/yorukot/superfile/releases/download/${SUPERFILE_VERSION}/${FILENAME}.tar.gz"
tar -xzf "${FILENAME}.tar.gz"
chmod a+x ./dist/${FILENAME}/spf
mv ./dist/${FILENAME}/spf /usr/bin/
rm -rf ./dist "${FILENAME}.tar.gz"
unset FILENAME SUPERFILE_VERSION
