## 2020-11
* initial config: 
    - rework nova launcher layout
    - auth apps...
* SimpleSSHD config
    - add device DHCP to router
    - add to .ssh/config
    - add key: `cat ~/.ssh/id_rsa.pub | ssh pixel5 "cat >> /data/data/org.galexander.sshd/files/authorized_keys"`
    - change home dir: /storage/emulated/0
* SMS backup/restore
    - use dir DCIM/backup
    - restore one month calls/texts
    - Textra resync
* Verizon
    - tried esim through website, app: total shitshow
    - swapped physical sim, no issues

## 2021-11-14
* OpenWRT trouble with static routes, disable dynamic MAC
