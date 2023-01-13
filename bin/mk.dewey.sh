#!/bin/bash
## xian 2023-01-11
## Input dewey password, return bearer token
dewey_user="xian@uga.edu"
>&2 echo -n "Dewey Password: "
read -s  dewey_pw
DEWEY_BASIC=$(echo -n "$dewey_user:$dewey_pw" | openssl base64)
DEWEY_TOKEN=$(curl -X POST "https://marketplace.deweydata.io/api/auth/tks/get_token" -H "Authorization: Basic $DEWEY_BASIC")
## just the token
echo $DEWEY_TOKEN | sed 's/.*access_token":"\([^"]*\)".*/\1/;'
