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

## 2019-01-26 - ...
* Cursor size
    - .config/lxsession/LXDE/desktop.conf
* TinyTex install in R
    - `tinytex::install_tinytex()`
    - Update packages:
```
library(tinytex)
tlmgr_search('/times.sty')   # search for times.sty
tlmgr_install('psnfss')      # install the psnfss package
tlmgr_update()  
```

## 2019-02-04
* Firefox plugins
    - Adblock plus
    - Dark Reader
    - Open Tabs Next to Current
    - Tab Session Manager
    - Conex
    - Firefox Multi-Account containers (works with conex)
* Containers backup (for conex and friends)
    - Search for containers.json and storage.js
    - ref: https://www.reddit.com/r/firefox/comments/8qfxo7/firefox_containers_export/
* Upgrade Firefox:
    - Edit /etc/apt/preferences (pin unstable at 100)
* Firefox version / pinning refs:
    - https://mozilla.debian.net/
    - https://unix.stackexchange.com/questions/278003/how-can-i-use-unstable-repositories-and-install-only-packages-in-testing-by-defa 
    - https://www.binarytides.com/enable-testing-repo-debian/
* Add bin/ to repo
    - add dropbox.update.sh (kenyon gmail login)

## 2019-02-20 (and thereabouts)
* Disable printer autodiscover:
    - vi /etc/cups/cups-browsed.conf
* Reset Brother Driver: Generic PCL 6/PCL XL Printer Foomatic/hpijs-pcl5e

## 2019-03-10
* Attempt at trackpad config via libinput
    - installed xinput, libinput-tools
    - see, e.g., `xinput list-props "Elan Touchpad"`
    - no left/right edge options??
* Refs
    - https://wiki.debian.org/SynapticsTouchpad
    - https://wiki.archlinux.org/index.php/libinput
* Disable vim mouse scroll in insert mode
    - ref: https://stackoverflow.com/questions/32918794/how-to-disable-vim-mouse-wheel

## 2019-03-13
* Upgrade/config router
    - https://openwrt.org/toh/tp-link/tl-wdr3600
    - Add static lease for pixel2, 192.168.1.110
* Podkicker files organize
    - Export not working on pixel2
    - listened files from samsung5 missing?
    - Samsung 5 phone update
* Organizing 2017 pics from pixel2 backup
    - copy to diospyros
    
## 2019-04-13
* Trying to disable printer browsing
    - `sudo systemctl disable cups-browsed`
    - See comments re avahi-daemon here: https://askubuntu.com/questions/345083/how-do-i-disable-automatic-remote-printer-installation/556963
* Home printer stopped working
    - Error: 'Filter failed',
```
D [13/Apr/2019:01:45:00 -0400] [Job 104] GPL Ghostscript 9.27: Unrecoverable error, exit code 1
D [13/Apr/2019:01:45:00 -0400] [Job 104] Process is dying with \"Unable to determine number of pages, page count: -1
D [13/Apr/2019:01:45:00 -0400] [Job 104] \", exit stat 3
```
* Post-reboot, removed and re-added Brother HL-L2360D via DNS-SD driverless
    - Driverless (cups-filters 1.21.6), wrong flip?
    - Generic IPP Everywhere Printer: No duplex, **Set Printer Options Color Mode to Grayscale 8 bit SGray** 
GPL Ghostscript 9.27: Unrecoverable error, exit code 1
* Refs for known ghostscript/filter bug: 
    - https://bugs.archlinux.org/task/62251
    - https://github.com/OpenPrinting/cups-filters/releases

## 2019-04-24
* Printer: Brother HL-L2360DW
    - driverless printing fails at 2-sided
    - Appears to work: 'Generic PCL 6/PCL XL Printer Foomatic/pxlcolor (recommended)'

## 2019-05-17
* Allow suspend without password (uses PolicyKit)
    - Edit file `/var/lib/polkit-1/localauthority/50-local.d/50-enable-suspend-on-lockscreen.pkla`
    - Ref: https://askubuntu.com/questions/543921/authentication-required-before-suspend

## 2019-07-06
* Fix ssh-agent
    - add .ssh/config to admin repo
* Cleanup, archive, and nuke webfaction host
