#!/bin/bash

if [ $# -ne 2 ]
then 
	echo " ERROR: Invalid number of arguements"

	exit 1
fi

writefile=$1
writestr=$2


# Create parent directory if it doesn't exist
mkdir -p "$(dirname "$writefile")"

# touch "$writefile" 

echo "$writestr" > "$writefile"

