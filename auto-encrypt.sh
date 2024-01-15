#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <File to Encrypt>"
    exit 1
fi
file2enc="$1"
chuck_prefix="chuck"
encrypted_folder="enc_folder"
if [ ! -d "mount" ]; then
    mkdir "mount"
fi
if [ -d "$encrypted_folder" ]; then
    if [ ! -f "$encrypted_folder/gocryptfs.conf" ]; then
        gocryptfs -init "$encrypted_folder"
    fi
fi
tar -czvf "${chuck_prefix}.tar.gz" "$file2enc"
split -n l/15 "${chuck_prefix}.tar.gz" "${chuck_prefix}_"
rm "${chuck_prefix}.tar.gz"
gocryptfs "$encrypted_folder" mount
for file in "${chuck_prefix}"_*; do
    mv "$file" "mount/$(basename "$file")"
done
sleep 1
fusermount -u mount
