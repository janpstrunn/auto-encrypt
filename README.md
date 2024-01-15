# Auto Encrypt

A really simple way to easily compress, hash, split and encrypt files and folders by just giving it's path.

## auto-encrypt.sh

Simply compresses, hashes, split and encrypt a given file or folder, using:

``tar``  ``sha512sum``  ``split``  ``gocryptfs``

This script have been configured to only accept one file/folder at once! 

It's recommended to throw everything you need to encrypt in a folder if you need to encrypt multiple files.

By default, after chosing a folder it's compressed and split in fifteen chunks.

## auto-decrypt.sh

This script does the exact opposite, just for convenience, and also checks the stored hash.sha512 automatically to make sure it wasn't tampered.

## Dependencies:
- tar
- gocryptfs
