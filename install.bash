#!/bin/bash

launchctl unload /Library/LaunchDaemons/com.boot2plex.plexserverd.plist

cp -f com.boot2plex.plexserverd.plist /Library/LaunchDaemons
chown root:wheel /Library/LaunchDaemons/com.boot2plex.plexserverd.plist
chmod 644 /Library/LaunchDaemons/com.boot2plex.plexserverd.plist

launchctl load -w /Library/LaunchDaemons/com.boot2plex.plexserverd.plist
launchctl start com.boot2plex.plexserverd
