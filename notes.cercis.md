## cercis.x14n.org 
* Thinkpad T480s 

# Initial Setup (2018-12-28 - )
* Add nvme drive + memory
* BIOS config 
    - research re power
    - disable safe boot
    - enable thunderbolt autoconfig setting (safe for this model)
* Install
    - Started with Debian stretch + mate
    - Manual partition, GPT boot as first, btrfs for /, /home (noatime), swap
    - Wrong size for swap
    - Had issues with HiDPI, upgraded to debian buster, back to LXDE 
    - Added non-free for iwlwifi firmware
* Desktop environment
    - Startup: gnome-terminal, keepass, fbpanel
    - Setup font sizes, themes, etc.
    - Auto
* ssh / passwords
    - ssh-copyid from diospyros (add id_kenyon)
    - Config sshd 
    - create new key (add to bitbucket, gitlab, github)
    - clone admin repo into ~
    - Create new copy of keepass db
* Raw file copy
    - diospyros:~/projects (minus admin)
    - diospyros:~/archive/sync (placed in ~)
* Setup fbpanel
    - rework `.config/fbpanel/default`
    - Change icon theme

## Resize swap (2018-12-29)
* btrfs: shrink /home
* parted: shrink home partition
* btrfs: resize max /home
* Delete old swap part
* Add new swap
* `mkswap /dev/...`, update /etc/fstab
* Refs/Notes:
    - single-user mode target: `systemctl rescue` 
    - resize: https://www.kubuntuforums.net/showthread.php/72472-Resizing-a-btrfs-partition

## 2018-12-30: Login / power management
* mate power management in tray
    - disable all but...? 
* remove light-locker
    - fixed problem with double-lock requiring user login and unlock
* remove lightdm, replace with lxdm
    - fixes blank unlock screen, hidpi
    - locks on screen close (with popup error on unlock)
* Ignore lid events
    - Remove from `/etc/systemd/logind.conf`
* Suspend script
    - Lock with xscreensaver
    - TODO: still waking up from lid open 
* Tested acpid
    - breaks mouse / pointer functionality
    - requires additional config to honor mate power manager settings
    - possibly breaks screen brightness keys?
