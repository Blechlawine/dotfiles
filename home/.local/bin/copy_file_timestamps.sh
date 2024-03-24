#!/bin/bash

print_usage() {
    echo "Usage: $0 [-a | -m | -c] <source> <destination>"
}

option="m"

while getopts ":amc" opt; do
    case $opt in
        a)
            option="a"
            ;;
        m)
            option="m"
            ;;
        c)
            option="c"
            ;;
        \?)
            echo "Invalid option: -$OPTARG"
            print_usage
            exit 1
            ;;
    esac
done

shift $((OPTIND-1))

# Check if two arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <source> <destination>"
    exit 1
fi

source_dir=$1
destination_dir=$2

find "$source_dir" -print0 | while IFS= read -r -d '' file; do
    # Extract the selected timestamp from the source file
    case $option in
        a)
            timestamp=$(stat -c %x "$file" | cut -d' ' -f1,2)
            ;;
        m)
            timestamp=$(stat -c %y "$file" | cut -d' ' -f1,2)
            ;;
        c)
            timestamp=$(stat -c %z "$file" | cut -d' ' -f1,2)
            ;;
    esac

    # Get the modification time of the source file
    # mtime=$(stat -c %y "$file" | cut -d' ' -f1,2)

    # Get the corresponding file in the destination directory
    dest_file="${file/$source_dir/$destination_dir}"

    # echo some debugging information
    echo "Copying timestamp from $file to $dest_file : $timestamp"

    # Update the modification time of the destination file
    touch -d "$timestamp" "$dest_file"
done
