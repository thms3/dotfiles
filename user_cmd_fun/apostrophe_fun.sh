#!/usr/bin/bash

function apostrophe(){

	# Command to execute
	local apo_cmd="flatpak run org.gnome.gitlab.somas.Apostrophe &"

	# Try to execute the command and check if it fails
	if eval ${apo_cmd}>/dev/null 2>&1; then
		echo "Apostrophe started succefully"
	else
		echo "Error running Apostrophe"
		return 1
	fi

	return 0
}
