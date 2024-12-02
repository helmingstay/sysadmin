## 2020-01-11
* / full from ssh login attempts
    - firewall was directing all ports to 7722 (local ssh)
    - removed /var/log/btmp.1
    - remove auth.log.1
* reconfigure firewall: 22 (remote) to 7722 (local)
## 2021-02-20
* update/upgrade system (major)
    - change release from testing to buster
    - remove sources: chrome, spotify
    - apt upgrade; root fs filled up
    - apt clean; apt autoremove
    - install nload
    - reboot (at end)
* backup 
    - rsync vids from cercis
    - rclone: add remove b2-media (app key)
    - add ~/local/bin/my.media-backup.sh
    - backup canvio/media to backblaze: my.media-backup.sh
## 2021-02-22
* Checking canvio drives
    - btrfs errors:
 BTRFS warning (device sdc2): checksum/header error at logical 701833216 on dev /dev/sdc2, physical 701833216: metadata leaf (level 0) in tree 2
    - clean fs: `sudo btrfs scrub start ./canvio`
    - check drives: `sudo smartctl -d sat -a /dev/sdc | less`
    - underpowered drives? 12.
    - USB port offers 1.5A / 7.5W, needs 8+W? 
    -- https://forums.lenovo.com/t5/ThinkPad-X-Series-Laptops/X1-Carbon-USB-Power-Output/m-p/1637944
    -- https://superuser.com/questions/1171866/what-is-typical-power-consumption-of-2-5-laptop-external-hard-drive-connected-t
* Upgraded to powered hub
## 2021-10-29
* system upgrade
* canvio errors check:
    - `sudo btrfs dev stat canvio`
    - `sudo btrfs dev stat -z canvio`
```
[/dev/sdc2].write_io_errs    0
[/dev/sdc2].read_io_errs     0
[/dev/sdc2].flush_io_errs    0
[/dev/sdc2].corruption_errs  2048
[/dev/sdc2].generation_errs  213
[/dev/sdb2].write_io_errs    0
[/dev/sdb2].read_io_errs     0
[/dev/sdb2].flush_io_errs    0
[/dev/sdb2].corruption_errs  4746
[/dev/sdb2].generation_errs  77
```
    - scrub?  https://superuser.com/questions/789303/how-to-monitor-btrfs-filesystem-raid-for-errors
* rsnapshot setup: only works with sync_first off?
    - https://www.cyberciti.biz/faq/linux-rsnapshot-backup-howto/
    - https://wiki.centos.org/HowTos/RsnapshotBackups


