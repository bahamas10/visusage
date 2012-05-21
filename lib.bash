#!/usr/bin/env bash
#
# Author: Dave Eddy <dave@daveeddy.com>
# Date: 5/22/12

# Default number of columns to display
columns=80
# The character to use in the bar graphs
bar_character='|'
# Color output or not
color=true

#
# Load colors into variables
#
load_colors() {
	black=$(tput setaf 0)
	red=$(tput setaf 1)
	green=$(tput setaf 2)
	yellow=$(tput setaf 3)
	blue=$(tput setaf 4)
	magenta=$(tput setaf 5)
	cyan=$(tput setaf 6)
	white=$(tput setaf 7)
	bold=$(tput bold)
	reset=$(tput sgr0)
}

#
# Check if a zone exists
#
# $1 = zoneid
#
zone_exists() {
	while IFS=: read zoneid zonename state zonepath uuid brand ip_type; do
		if [[ "$1" == "$zoneid" ]]; then
			return 0
		fi
	done < <(zoneadm list -p)
	return 1
}

# Display bars for a given percent
#
# $1 = percentage
#
print_bars() {
	local perc=${1//%/}
	local decimal=$(bc <<< "scale=2; $perc / 100.0")
	local num_bars_dec=$(bc <<< "$columns * $decimal")
	local num_bars=${num_bars_dec%%.*}

	for ((i=1; i<=columns; i++)); do
		((i <= num_bars)) && echo -n "$bar_character" || echo -n " "
	done
	echo
}

# Start the main loop of a program
#
# Assumes the function to call is `main`
start() {
	# Check if an interval was given
	if [[ -n "$1" ]]; then
		interval=$1
		# Check if a count was given
		if [[ -n "$2" ]]; then
			i=0
			count=$2
		fi

		# Clear the screen and run the loop
		while true; do
			output=$(main; date)
			clear
			echo "$output"
			# If counting, inecrement the counter and exit if over $count
			if [[ -n "$count" ]]; then
				((i++))
				if ((i >= count)); then
					exit 0
				fi
			fi
			sleep "$interval"
		done
	fi
	main
}
