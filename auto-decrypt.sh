#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <Encrypted Folder>"
    exit 1
fi
encrypted_folder="$1"
chuck_prefix="chuck"
if [ ! -d "mount" ]; then
    mkdir "mount"
fi
gocryptfs "$encrypted_folder" mount
for file in mount/${chuck_prefix}_*; do
    mv "$file" "$(basename "$file")"
done
cat ${chuck_prefix}_* > "${chuck_prefix}.tar.gz"
rm ${chuck_prefix}_*
tar -xzvf "${chuck_prefix}.tar.gz"
rm "${chuck_prefix}.tar.gz"
fusermount -u mount
