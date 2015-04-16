GOAL

Be able to run plex media server on Mac OS X from system startup as an unpriviledged user.
Primarily avoids need to run as login item on personal account with autologin,
while accomodating power loss.

How I am Using This:

Make a service user-account using the script I have in my other repo: 
https://github.com/darwingr/ServiceAccountMaker
Run using "sudo .mk_service_user.sh plex"
PlexMediaServer.app should be in /Applications

IMPORTANT

The project still needs a bit of work and in fact FAILS to load on system startup.
This is due to the plex menubar item needing the "WindowServer" to be reachable,
which requires a user to be logged via gui in locally.
My workaround to this is below, following the installation.


INSTALLATION

1. 'cd' to the Boot2Plex project directory
2. Running the script:
	chmod +x install.bash
	sudo ./install.bash
Re-run anytime you make edits to the plist.


AFTER SYSTEM STARTUP (workaround):

1. Log in via gui with any user.
2.	10.10 +
		sudo launchctl kickstart -k system/com.boot2plex.plexserverd
	10.9 and older
		sudo launchctl stop com.boot2plex.plexserverd
		sudo launchctl start com.boot2plex.plexserverd
	