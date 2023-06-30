#!/bin/env bash

execute()
{
  mkdir -p /usr/share/fnaf1
  chmod +x scripts/fnaf1
  cp -r src /usr/share/fnaf1/
  cp -r data/icons /usr/share/fnaf1
  check
  install -m 0755 scripts/fnaf1 /usr/bin
  install -m 0755 data/fnaf.desktop /usr/share/applications  
  install -m 0755 package-lock.json /usr/share/fnaf1/
  install -m 0755 main.js /usr/share/fnaf1/
  install -m 0755 package.json /usr/share/fnaf1/
  install -m 0755 preload.js /usr/share/fnaf1/
  check
  echo "[!S]: success"
  return 0
}

check()
{
  if [ $? -eq 0 ]; then
    return 0 
  else
    echo "[!E]: error during install process."
    exit 1 
  fi 
}

if [ $(whoami) == "root" ]
then
  execute
else
  echo "[!E]: not root"
  exit 1
fi
