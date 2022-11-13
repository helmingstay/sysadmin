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
