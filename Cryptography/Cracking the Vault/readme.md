# Cracking the Vault

## Points :250 <br />
## Description : <br />
> The vault is locked with a key, but we've managed to access a security computer. Unfortunately, the key is encrypted, and the owner forgot to remove the file that encrypts it. It appears to be some sort of homemade encryption, but don’t worry this should be a piece of cake for you, right?

## File :	  <br />
> [VaultKey_encrypted.txt](VaultKey_encrypted.txt) <br />
[Encryption.py](Encryption.py)


## Solution : 	<br />
We were given a Python script to decrypt the encrypted key.
We should follows the reverse of the encryption steps:
1. Undo character shifts
2. Recover the original key sum
3. Undo XOR transformation
4. Remove padding

Here is my decryption [Script](decrypt.py)

`ectf{1t_W45_ju5T_4_m1nu5}`