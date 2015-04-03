#!/bin/bash
# is there a way to exec a whole script as root?
# To avoid repeating sudo, or is that a non-problem
version_component() {
  printf "%s" "$1" |
    sed -e "s/\./"$'\t'"/g" -e "s/-/"$'\t'"/" |
    cut -f "$2"
}

MAC_OS_VERSION="$(sw_vers -productVersion)"
MAC_OS_MINOR_VERSION="$(version_component "$MAC_OS_VERSION" 2)"

sudo launchctl stop com.boot2plex.plexserverd
sudo launchctl unload /Library/LaunchDaemons/com.boot2plex.plexserverd.plist

cp -f com.boot2plex.plexserverd.plist /Library/LaunchDaemons
chown root:wheel /Library/LaunchDaemons/com.boot2plex.plexserverd.plist
chmod 644 /Library/LaunchDaemons/com.boot2plex.plexserverd.plist

if [ "$MAC_OS_MINOR_VERSION" -ge 10 ]; then
	sudo launchctl bootstrap system /Library/LaunchDaemons/com.boot2plex.plexserverd.plist
	sudo launchctl enable system/com.boot2plex.plexserverd
	sudo launchctl kickstart -k system/com.boot2plex.plexserverd
else
	sudo launchctl load -w /Library/LaunchDaemons/com.boot2plex.plexserverd.plist
	sudo launchctl start com.boot2plex.plexserverd
fi
