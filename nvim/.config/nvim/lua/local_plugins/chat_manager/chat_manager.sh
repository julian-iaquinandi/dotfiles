#!/bin/bash

action=$1
file=$2

if [ -z "$file" ]; then
	echo "No file specified."
	exit 1
fi

case $action in
load)
	echo "Loading file '$file'..."
	# Add your load logic here
	echo "File '$file' loaded."
	;;
save)
	echo "Saving file '$file'..."
	# Add your save logic here
	;;
delete)
	echo "Deleting file '$file'..."
	# rm "$file"
	echo "File '$file' deleted."
	;;
*)
	echo "Invalid action."
	exit 1
	;;
esac
