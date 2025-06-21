#/usr/bin/env bash
# SCRIPT: download-or-update-w3s.sh 
# AUTHOR: efn
# DATE: 2025-06-21T13:41:49
# REV: 1.0
# ARGUMENTS: [1:        ][2:		][3:		][4:        ]
#
# PURPOSE: It downloads the w3school using the `httrace` command. 
#
 set -x # Uncomment to debug
# set -n # Uncomment to check script syntax without execution
# set -e # Break on the first failure

# Check if the config exists
if [ ! -f config.sh ]; then
	echo "Config does not exists" >&2
	exit 1
fi

source config.sh
echo ${downloadpath}
echo ${targetdomain}


if [ -d "${downloadpath}" ]; then
	httrack "${targetdomain}" -c8 -O "${downloadpath}" --update
else
	httrack "${targetdomain}" -c8 -O "${downloadpath}"
fi

chmod -R 755 ${downloadpath}/
