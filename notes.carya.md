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
* setup R (imports deps)
    - apt install r-cran-emmeans
* Ignore power key
    - edit /etc/systemd/logind.conf
    - `sudo systemctl restart systemd-logind.service`
* setup canvio mount (from diospyros)
    - Add to /etc/fstab:
    - `LABEL=canvio.raid /home/xian/mnt/canvio btrfs defaults,user,noatime`
    - user can mount but not unmount?
    - status: `btrfs fi usage <mountpoint>`
* vim config
    - remote mouse paste: `set mouse=r`
    - install vim-pathogen: https://github.com/tpope/vim-pathogen
    - git clone git@github.com:altercation/vim-colors-solarized.git

## 2022-11-12
* config vim: `set mouse=`
* setup home assistant hass
    - apt install virt-manager bridge-utils
    - tutorial: https://community.home-assistant.io/t/install-home-assistant-os-with-kvm-on-ubuntu-headless-cli-only/254941
* network bridge: 
    - better: https://wiki.debian.org/BridgeNetworkConnections
        - `sudo brctl addbr br0`
        - edit /etc/network/interfaces
        - `sudo ifup br0`
        - add bridge dhcp to openwrt (not needed?)

    - dhcp bridge on iface enp1s0
* hass vm:
    - see ~/local/hass, ~local/hass/hass-vm
    - download qcow2 image
    - Create pool: `virsh pool-create-as --name hassos --type dir --target ~/local/hass/hass-vm`
    - `sudo virt-install --import --name hass --memory 4096 --vcpus 4 --cpu host --disk haos_ova-9.3.qcow2,format=qcow2,bus=virtio --network bridge=br0,model=virtio --graphics=none --noautoconsole --boot uefi`
    - `sudo virsh list`
    - `sudo virsh autostart hass`
    - add hass dhcp to openwrt 
    - `sudo virsh restart hass`

### background/refs
* network
    - debian, systemd versus networkmanager: https://www.reddit.com/r/debian/comments/malrrr/cleanly_switch_to_systemdnetworkd_or/
    - See `nmtui`: gui network editor?

## 2022-11-12
* weird bridge dhcp issues
    - edit /etc/network/interfaces, set br0 auto
    - https://wiki.debian.org/BridgeNetworkConnections
    - issues w/dhcp in openwrt
* bluetooth
    - ref: https://somedudesays.com/2019/10/bluetooth-on-debian-or-ubuntu/
    - ref: https://linuxhint.com/configure-bluetooth-debian/
    - `sudo apt install lshw bluetooth rfkill bluez bluez-tools pulseaudio-module-bluetooth`
    - Not needed? `sudo apt install firmware-iwlwifi`
    - `sudo rfkill unblock all`

## 2022-12-19
Drives: 
* Old 60G S60 SATA drive (labeled UGA 2010):
    * Check contents: reformat from Kenyon arrival office? 
    - wipe, add to ~/mount/spare
* New SanDisk SSD Plus 1TB (Sata3)
    - add to inside bay
    - fdisk: fill drive
    - mkfs.ext4
    - e2label partition
    - add to /etc/fstab: mount by partition in ~/work

## 2023-01-15
* canvio raid: one drive disconnected, loose cable? (sdc)
* Moving music DVDs to archive: 4x ontono minidisc recordings from albuquerque
    - compress wavs to ogg (very fast)
    - `time parallel --progress -j 8 ffmpeg -i {} -c:a libvorbis -q 6 {}.ogg ::: *.wav`

## 2023-01-19
* R setup: 
    - `time sudo apt install r-cran-sp r-cran-dplyr r-cran-ggplot2 r-cran-rpostgresql r-cran-rgdal r-cran-knitr r-cran-rlang r-cran-data.table r-cran-sf`

## 2023-05-04
* ssh to remotes not working
    - disable routes on enp1s0 (set to manual), use br0 (use dhcp): edit /etc/network/interfaces
    - see https://superuser.com/questions/1601712/network-link-becomes-dead-when-using-bridge-interface-in-debian
    - Bridge logic ref: https://superuser.com/questions/1219223/linux-bridge-network-influenced-by-route-table

## 2023-05-08
* ssh still not working 
    - (intermittently? tried reboot)
* install net-tools
    - `netstat -anl`
* Add postgres password for role xian

## 2023-08-13
* Home assistant: install ssh community add-on: 
    - https://github.com/hassio-addons/addon-ssh/tree/v15.0.6
    - configure: port 2222, user xian, add cercis key
* Upgrade OS, restart
    - re-enter Esp32 API keys
* Install HACS via terminal
    - https://hacs.xyz/docs/setup/download/
* Install History Explorer card
    - https://github.com/alexarch21/history-explorer-card
* Install history-explorer-card
    - https://github.com/alexarch22/history-explorer-card

## 2023-11-23
* fix network bridge 
    - no internet access due to superceding default route to enp1s0 
    - add to br0: `post-up route add default gw 192.168.1.1 dev br0`: see .zshrc
