#!/bin/bash

code=$1

if [ -z $code ]; then
  echo "Give a site to generate the password for."
  exit 1
else
  printf "33nSiger95$code" | sha1sum | xxd -r -p | base64 | cut -c1-16 | xclip -selection clipboard
  exit 0
fi

