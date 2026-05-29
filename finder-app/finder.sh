#!/bin/bash

# Check number of arguments
if [ $# -ne 2 ]
then
    echo "Error: Invalid number of arguments"
    echo "Usage: ./finder.sh <filesdir> <searchstr>"
    exit 1
fi

filesdir=$1
searchstr=$2

# Check if filesdir exists and is a directory
if [ ! -d "$filesdir" ]
then
    echo "Error: $filesdir is not a directory"
    exit 1
fi

# Count number of files
file_count=$(find "$filesdir" -type f | wc -l)

# Count matching lines
matching_lines=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)

# Print result
echo "The number of files are $file_count and the number of matching lines are $matching_lines"