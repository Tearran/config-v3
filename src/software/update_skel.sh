#!/usr/bin/env bash


#
# check dpkg status of $1 -- currently only 'not installed at all' case caught
#
function update_skel() {

	getent passwd |
		while IFS=: read -r username x uid gid gecos home shell; do
			if [ ! -d "$home" ] || [ "$username" == 'root' ] || [ "$uid" -lt 1000 ]; then
				continue
			fi
			tar -C /etc/skel/ -cf - . | su - "$username" -c "tar --skip-old-files -xf -"
		done

}

