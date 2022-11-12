## 2022-10-13: initial install
* carya
    - Beelink SER5 AMD 4800U, 500GB HD (slow-ish)
    - Debian 11 USB install
    - partition: 50G root,  40GB swap, 400GB /home (ext4)
    - plugin canvio usb btrfs array here
    - leave /boot/efi partition
    - setup boot order in bios
# Initial setup
* user xian
    - usermod -G sudo 
* sshd config: keys
* apt install git tmux htop
    - clone git repo admin
    - add static dhcp lease
* fix ctrl on usb keyboard: add to /etc/profile:
    /usr/bin/setxkbmap -option "ctrl:nocaps"


## 2022-11-11
* sudo apt install btrfs-progs rsync vim-gtk3 fbpanel git r-base-dev lxdm sysstat locate xclip cups rclone
* sudo apt install postgresql postgis libgdal-dev libgeos-dev 
* setup ~/.ssh: simlink config, .config
* Files backup: move cercis/personal to carya
* R: 
* Ignore power key
    - edit /etc/systemd/logind.conf
    - `sudo systemctl restart systemd-logind.service`
* setup canvio mount (from diospyros)
    - Add to /etc/fstab:
    - `LABEL=canvio.raid /home/xian/mnt/canvio btrfs defaults,user,noatime`
    - user can mount but not unmount?
