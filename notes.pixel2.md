## 2018-01-04
* Tried mtp transfer with cercis
    - debian gives popup, 
    - fails with msg `The name :1.105 was not provided by any .service files`
* Install simplesshd
    - http://www.galexander.org/software/simplesshd/
    - Add `authorized_keys` to home dir
    - Port 2222, works over wifi base station
* Download pics 
    - /mnt/sdcard/DCIM/Camera/

## 2020-01-15
* Download pics & vid to cercis:personal/pixel2

## 2020-02-16
* Download podkicker listened: 
    - DropBear SSH: 
    - `scp 'pixel2:/storage/emulated/0/Android/data/com.podkicker/files/PodkickerDownloads/*' .`

## 2020-06-06
* Backup podcasts using Podcast Addict
    - `time rsync -aupP pixel2:/storage/emulated/0/Android/data/com.bambuna.podcastaddict/files/podcast .`
    - on diospyros: my.pixel2.pods.sh
