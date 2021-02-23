#!/bin/bash
## b2-sync only has app permissions for xian-sync bucket
rclone -v copy ~/sync b2-sync:xian-sync
