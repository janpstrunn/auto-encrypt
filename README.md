# Auto Encrypt

A really simple way to easily compress, hash, split and encrypt files and folders by just giving it's path.

## auto-encrypt.sh

Simply compresses, hashes, split and encrypt a given file or folder, using:

``tar``  ``sha512sum``  ``split``  ``gocryptfs``

This script have been configured to only accept one file/folder at once! 

It's recommended to throw everything you need to encrypt in a folder if you need to encrypt multiple files.

The compressed file/folder is shreded and the split files are moved to the mounted 'mount' folder and then unmounted.

By default, after chosing a folder it's compressed and split in fifteen chunks.

## auto-decrypt.sh

This script does the exact opposite, just for convenience, and also checks the stored hash.sha512 automatically to make sure it wasn't tampered.

The compressed and split files are shreded, and the file/folder is moved to the working directory.

## Step-by-Step

### Executing the Encrypt Script

```./auto-encrypt.sh path/to/file or path/to/folder```

If there is no folder called: 'mount' and 'Encrypted_Vault' in the working directory, it's automatically created.

After that, the file/folder is compressed into a .tar.gz file, and it's hashed using sha512 and stored in a 'hash.sha512' file in the working directory.

Then, the compressed file is split in fifteen chunks (by default) of same size. The compressed file is shreded and deleted.

The command 'gocryptfs -init' is ran to generate the encrypted folder and mount it to the 'mount' folder, and move all the split files to it, and finally it unmounts.

### Executing the Decrypt Script

```./auto-decrypt.sh path/to/folder```

Again, if there is no 'mount' folder in the working directory, it's automatically created.

The encrypted folder is unlocked and mounted to the 'mount' folder.

Now the split files are moved to the working directory and are concatenated generating a .tar.gz file. The split files are shreded and delete, and the compressed file is extracted, hashed and shreded as well.

The file/folder is unencrypted in the working directory, and the stored hashes and previous generated hash are compared, if they are identical or different you are warned.

## Dependencies:
- tar
- gocryptfs
