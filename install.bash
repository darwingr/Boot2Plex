#!/bin/bash

launchctl unload /Library/LaunchDaemons/com.boot2plex.plexserverd.plist

cp -f com.boot2plex.plexserverd.plist /Library/LaunchDaemons
cd /Library/LaunchDaemons
chown root:wheel com.boot2plex.plexserverd.plist
chmod 644 com.boot2plex.plexserverd.plist

launchctl load -w com.boot2plex.plexserverd.plist
launchctl start com.boot2plex.plexserverd
