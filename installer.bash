#!/bin/bash

curl -LOk https://github.com/darwingr/ServiceAccountMaker/archive/master.zip && unzip master.zip
chmod +x ServiceAccountMaker-master/mk_service_user.sh
./ServiceAccountMaker-master/mk_service_user.sh plex

curl -LOk https://downloads.plex.tv/plex-media-server/0.9.11.7.803-87d0708/PlexMediaServer-0.9.11.7.803-87d0708-OSX.zip 