#!/bin/bash
echo "## Sending"
rclone -v copy ~/cloud/dropbox.kenyon dropbox:
echo "## Receiving"
rclone -v copy dropbox: ~/cloud/dropbox.kenyon 

