# Hyprland + Bazzite == Hyprzzite

This is my personal, custom image of [Bazzite](https://github.com/ublue-os/bazzite) (`bazzite:stable`) based on the [image template](https://github.com/ublue-os/image-template).

Batteries __not__ included. Bring Your Own Dotfiles.

# Changes

## Window Manager

Currently I'm relying on a COPR to install Hyprland on Fedora, but according to upstream they'll ship Fedora packages relatively soon. 

- Removed plasma, KDE workspace and waydroid
- Added [Hyprland](https://hypr.land/) and associated [tools](https://wiki.hypr.land/Hypr-Ecosystem/)
    - [x] hyprpaper
    - [x] hypridle
    - [x] hyprlock
    - [x] xdg-desktop-portal-hyprland (alongside xdg-desktop-portal-gtk)
    - [x] hyprsunset
    - [x] hyprpolkitagent
    - [x] hyprcursor
    - [x] hyprland-qt-support
    - [x] hyprutils
    - [ ] ~~hyprland-guiutils~~ (Waiting on upstream for fedora packages)
    - [ ] hyprpicker
    - [ ] hyprlauncher
    - [ ] hyprsysteminfo
    - [ ] hyprqt6engine
    - [ ] hyprpwcenter
    - [ ] hyprshutdown
    
## System utilities and user apps
    
- [Rofi](https://github.com/davatorium/rofi)
- [Sway Notification Center](https://github.com/ErikReider/SwayNotificationCenter)
- [Waybar](https://github.com/Alexays/Waybar)
- [udiskie](https://github.com/coldfix/udiskie)
- [Superfile](https://superfile.dev/)
- [Wayland Overview Bar (WOB)](https://github.com/francma/wob)
- Modified [SDDM Astronaut theme](https://github.com/Keyitdev/sddm-astronaut-theme)
- [Wlogout](https://github.com/ArtsyMacaw/wlogout)
- [Network Manager Applet](https://github.com/GNOME/network-manager-applet)
- GNOME Keyring
- [Grim](https://gitlab.freedesktop.org/emersion/grim)+[Slurp](https://github.com/emersion/slurp)+[Swappy](https://github.com/jtheoof/swappy) for screenshots
- [Kvantum Manager](https://github.com/tsujan/Kvantum)
- [Terminal Image Viewer (timg)](https://github.com/hzeller/timg)
- [btop](https://github.com/aristocratos/btop)
- [kitty](https://github.com/kovidgoyal/kitty)
- [fish](https://github.com/fish-shell/fish-shell)
- [fastfetch](https://github.com/fastfetch-cli/fastfetch)
- [Zed code editor](https://github.com/zed-industries/zed)
- [Starship](https://github.com/starship/starship)
- [Nautilus](https://apps.gnome.org/en-GB/Nautilus/)
- [Brave Browser](https://brave.com/)

# Installation

Installation should theoretically work from any OS based on Fedora Atomic, but it is recommended to start from a similar OS. 

1. Install Bazzite first
2. Run the following command:

```bash
sudo bootc switch ghcr.io/rikireal/hyprzzite:latest
```
3. To uninstall you simply run the above command with a different image, e.g. Bazzite
```bash
sudo bootc switch ghcr.io/ublue-os/bazzite:stable
```