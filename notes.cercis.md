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

## 2019-07-26
* libinput palm detection
    - ref: https://wayland.freedesktop.org/libinput/doc/latest/touchpad-pressure-debugging.html#touchpad-pressure-hwdb
    - Edit `/etc/libinput/local-overrides.quirks`
    - set AttrPalmSizeThreshold=200

## 2020-01-03
* Aspen accidental logout
    - pointer movement and scroll issues
    - reboot and upgrade (buster to stable)
    - apt dist-upgrade and reboot

## 2020-01-22
* Install audiveris music software 
    - handbook: https://bacchushlg.gitbooks.io/audiveris-5-1/content/
    - Remove openjdk-11: `sudo apt remove openjdk-11-jre-headless:amd64`
    - Install adoptopenjdk-8, see https://adoptopenjdk.net/installation.html#linux-pkg
    - HiDPI doesn't work with jdk8?
    - OCR requires tesseract 3? (not working with 4)
    - Install musescore, fluidsynth
## 2021-02-20
* update/upgrade
* Backups
    - backup personal/gopro/vid to diospyros/media/vid
    - Add backblaze app key b2-media, add remote to rclone
    - see also notes.diosypros
    - backup pixel2: 
        - `time  rsync -auv --progress  'pixel2:/storage/emulated/0DCCIM/Camera/VID*' ~/personal/pixel2/dcim-2020-01-15/vid/`
        - organize on cercis, transfer to diospyros: canvio/media/vid
* Vid compress, campark 
    - `mediainfo`
    - test codecs: x265 (slow, good), libaom-av1 (experimental, not working), vp9 (slow)
    - look at shotwell vid editor (need dist upgrade?)
    - x265 crf 24 approx lossless? (x264=18+6)
## 2021-10-29
* setup rsnapshot backups
* upgrade system to bullseye
    - change in /etc/sudoers?
```
-# See sudoers(5) for more information on "#include" directives:
+# See sudoers(5) for more information on "@include" directives:
-#includedir /etc/sudoers.d
+@includedir /etc/sudoers.d
```
    - postgresql13
```                                                            │
 │ The PostgreSQL version 11 is obsolete, but the server or client packages are still installed. Please install the   │
 │ latest packages (postgresql-13 and postgresql-client-13) and upgrade the existing  clusters with                   │
 │ pg_upgradecluster (see manpage).                                                                                   │
 │                                                                                                                    │
 │ Please be aware that the installation of postgresql-13 will automatically create a default cluster 13/main. If     │
 │ you want to upgrade the 11/main cluster, you need to remove the already existing 13 cluster (pg_dropcluster        │
 │ --stop 13 main, see manpage for details).                                                                          │
 │                                                                                                                    │
 │ The old server and client packages are no longer supported. After the existing clusters are upgraded, the          │
 │ postgresql-11 and postgresql-client-11 packages should be removed.                                                 │
 │                                                                                                                    │
 │ Please see /usr/share/doc/postgresql-common/README.Debian.gz for details.                                          │
```
    - /etc/ssh/sshd_config:
    `+Include /etc/ssh/sshd_config.d/*.conf`
* apt full-upgrade change notes: 
    - Diodon replaces clipit

## 2021-10-29,30
* debian upgrade borked due to locked xscreensave, fresh reinstall debian 11
    - LightDM display manager, add LXDE
    - add contrib/non-free, install firmware-linux, firmware-iwlwifi 
* initial setup:
    - install zsh, vim-gtk3, fbpanel, git, r-base-dev, lxdm, sysstat, locate, xclip, rsync, cups, rclone
    - add printer: 
        -- fbpanel settings, 
        -- Brother ipp connect
        -- install printer-driver-brlaser?
    - install zoom, skype, uga anyconnect
    - others: lm-sensors/conky
    - R package depends: libcurl4-gnutls-dev, libssl-dev, libxlm2-dev, libfontconfig1-dev
    - system: install postgres, postgis; add user xian
    - run chsh
    - Power: edit /etc/systemd/logind.conf
    - Fn-keys not working: 
        - confirm keys with xev
        - edit .config/openbox/lxde-rc.xml
        -- brightnessctl, pactl 
        - `openbox --restart` 
        - ref: https://forum.puppylinux.com/viewtopic.php?t=645&i=1
* themes
    -- download (not gtk3): https://www.ubuntupit.com/best-openbox-themes-for-linux/
    -- gtk3 themes: https://www.xfce-look.org/browse?cat=135&page=2&ord=latest
    -- gtk3 themes: https://www.opendesktop.org/
    -- download to ~/.themes
    -- GTK theme: run obconf (decorators), 
    -- lxappearance (gtk3 / within window): widget, window borders

## 2021-11-14
* Borked openwrt router dhcp with duplicate static IPs
    - Reset router into failsafe mode
    -- Ref: https://openwrt.org/docs/guide-user/troubleshooting/failsafe_and_factory_reset
    - manually edit /etc/network/interfaces:
```
auto enp0s31f6
    iface enp0s31f6 inet static
        address 192.168.1.10/24
        gateway 192.168.1.1
```
    -- `ip addr; ifup enp0s31f6`
    -- Ref: https://wiki.debian.org/NetworkConfiguration#Starting_and_Stopping_Interfaces
    - on router, mount root and edit /etc/config/dhcp
## 2021-11-16
* New usb3 hub
* Config USB wireless keyboard: swap ctrl:
    - `setxkbmap -layout us -option ctrl:nocaps`
* Printer text quality
    - `sudo apt install printer-driver-brlaser`
    - Disable shrink-to-fit

## 2022-02-05
* Install curl, keybase

## 2022-03-25
* package install for R gis dependencies
- libgdal-dev, libgeos-dev

## 2022-11-11
* apt install sshfs
* Cleanup ~/admin
    - Add ~/admin/mnt for sshfs to carya
* Image viewer
    - qView? .deb: https://interversehq.com/qview/download/
    - tried to install nomacs image viewer, not in bullseye (in sid but not backports)
    - backports tutorial: https://www.how2shout.com/linux/how-to-install-and-use-backports-in-debian-11-bullseye/
* HiDPI console setup:
    - http://www.ateijelo.com/blog/2017/02/01/linux-console-high-dpi-display
    - see /usr/share/consolefonts for options
    - edit /etc/default/console-setup 
    - run `setupcon`

## 2022-11-22
* laptop screen not receiving input?
    - use Alt-L-click to drag windows
* Openbox shortcut: redecorate window 
    - https://askubuntu.com/questions/453953/how-to-redecorate-windows 
    - `cd .config/openbox; ln -s ~/admin/dotfiles/lxde-rc.xml .`
    - `openbox --reconfigure`
* Openbox shortcut: MoveResizeTo
    - `<keybind key="A-W-2"> <action name="MoveResizeTo"> <monitor>2</monitor> </action> </keybind>`

## 2023-01-10
* add xfer-gacrc to .ssh/.config

## 2023-01-16
* Volume, default device
    - in .config/openbox/lxde-rc.xml, use `pactl ... @DEFAULT_SINK@`

## 2023-02-12
* Backup DVD archive to carya:media
* Audio: install audacity, moc (mocp), musikcube
    - config theme: .moc/config
    - https://github.com/clangen/musikcube/wiki/user-guide
* install parallel

## 2023-03-29
* Install quarto from deb
    - qurto config: `cd ~/local/bin; ln -s /opt/quarto/bin/* .`
    - Vim plugin, clone into .vim/bundle: https://github.com/quarto-dev/quarto-vim

## 2023-04-12
* Debian mirror expired, change to https://deb.debian.org (redirector)
* Install blocking on quarto
    - create /usr/local/bin, upgrade via dpkg -a
* Install android-file-transfer, adb, android-sdk-platform-tools-common
    - phone won't connect, error "Unable to open MTP device “001,094"

## 2023-05-01
* apt upgrade, reinstall cisco anyconnect - still not working
* Install openconnect, works fine for remote.uga.edu

## 2023-05-08
* Add .pgpass for postgres to carya covid
* Postgres access to carya
    - Add alias my.pg.carya: tunnel
    - Add .zshrc env vars
    - Port forwarding & pw Ref: https://stackoverflow.com/questions/16835761/postgresql-via-ssh-tunnel
    - TODO: autossh? https://www.harding.motd.ca/autossh/

## 2023-05-09
* add mount.xfer.sh in ~/mnt
    - `sshfs xfer:/work/prlab/xian ./xfer.work`

## 2023-05-11
* zoom annotate: 
    - Fix black screen bug:
    - https://support.zoom.us/hc/en-us/articles/202082128-Black-Screen-During-Screen-Sharing
    - `apt install xcompmgr`
    - `xcompmgr -c -l0 -t0 -r0 -o.00 &`

## 2023-10-24
* symlink bin/g++: compiling R package (which?)

## 2023-10-31
* install vim-airline and themes :
    - https://github.com/vim-airline/vim-airline

## 2023-11-15
* Fix screen blank:
    - check status: `xset -q`
    - Disable DPMS: `sudo xset -dpms`
    - Tested for each of standby, suspend, off; none works (screens come back): `xset dpms 20 0 0`
    - works: `sudo xset dpms force off`
    - https://shallowsky.com/linux/x-screen-blanking.html
    - https://forums.debian.net/viewtopic.php?t=146063

## 2024-07-16
* Upgrade to bookworm:
    - follow instructions here: https://linuxize.com/post/how-to-upgrade-debian-11-to-debian-12/
    - need to cleanup postgresql, upgrade cluster (see pic)
    - reinstall lots of R packages for 4.2

## 2024-08-06
* Upgrade cleanup, issues with polkit
    - adduser, add group: https://answers.launchpad.net/ubuntu/+question/709594
    - `dpkg --configure -a`

## 2024-11-07
* R package install stuck on Matrix
    - See issue https://github.com/microsoft/LightGBM/pull/6434
    -  `install.packages('https://cran.r-project.org/src/contrib/Archive/Matrix/Matrix_1.6-5.tar.gz')`

## 2024-12-26
* Move to Gainesville, large monitor stays behind
    - xrandr: was DP-2 (hub hdmi), 3840x2160+0+0
    - update ~/local/bin/my.mirror.sh

## 2024-12-28
* Upgrade pgcluster
    - `sudo pg_lsclusters`
    - `pg_dropcluster --stop 15 main`
    - `sudo pg_upgradecluster  13 main`
    - disable .zshrc PG*=
