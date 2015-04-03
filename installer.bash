#!/bin/bash

curl -LOk https://github.com/darwingr/ServiceAccountMaker/archive/master.zip && unzip master.zip
chmod +x ServiceAccountMaker-master/mk_service_user.sh
./ServiceAccountMaker-master/mk_service_user.sh plex

sudo ditto /Applications/Plex\ Media\ Server.app /usr/local/plex/Plex\ Media\ Server.app
chgrp _plex /usr/local/plex/Plex\ Media\ Server.app
chmod 775 /usr/local/plex/Plex\ Media\ Server.app

chmod +x install.bash
./install.bash