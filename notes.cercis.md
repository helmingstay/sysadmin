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
