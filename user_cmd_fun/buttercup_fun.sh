#!/usr/bin/bash

function buttercup() {
	# AppImage name Buttercup
	local buttercup_appimage='Buttercup-linux-x86_64.AppImage'
	# Application path
	local buttercup_path="${HOME}/buttercup/${buttercup_appimage}"
	# Command to execute
	local buttercup_cmd="${buttercup_path} --no-sandbox --silent --fail &"

	# Check if the file exists
	if [[ -f "${buttercup_path}" ]]; then
		# Try to execute the command and check if it fails
		if eval "${buttercup_cmd}" > /dev/null 2>&1; then
			echo "Buttercup started successfully"
		else
			echo "Error running Buttercup."
			return 1
		fi
	else
		echo "${buttercup_path} not found"
		return 1
	fi

	# Returns 0 if everything went well 
	return 0
}

