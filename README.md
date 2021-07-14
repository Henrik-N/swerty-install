# Swerty Installation Script
This is an install script for installing the Swerty keyboard layout on Linux.

The Swerty keyboard layout was created by Johan E. Gustavsson, http://johanegustafsson.net/.

Note that this script is setting up the keybindings with XKB/Xorg, I'm not sure if it will work on Wayland. If you don't know what those things are you're most likely using Xorg.


## Install Instructions

You'll need to run the script as sudo as it's modifying protected files.

### Curl
```bash
bash <(curl https://raw.githubusercontent.com/Henrik-N/swerty-install/main/install.sh)
```
### Git
```bash
git clone https://github.com/Henrik-N/swerty-install/
sudo sh ./install.sh
```
