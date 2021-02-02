## Source: https://linuxhint.com/install_zoom_arch_linux/
## Step 1: Install git and base-devel
sudo pacman -S git base-devel


## Step 2: Install Zoom package
git clone https://aur.archlinux.org/zoom.git

## Step 3: Formation of Repository
cd zoom

## Step 4: Install Zoom on Arch Linux
makepkg -si
