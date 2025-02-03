import hashlib

def decrypt(encrypted_text):
    decrypted = []
    
    # Reverse the transformation (char_code - shift - 67) % 256
    for i, char in enumerate(encrypted_text):
        char_code = ord(char)
        shift = (i + 1) * 3
        original = (char_code - shift - 67) % 256
        decrypted.append(chr(original))
    
    decrypted_text = ''.join(decrypted)
    
    # Recover the secret key sum
    ascii_sum = sum(ord(c) for c in decrypted_text)
    secret_key = str(ascii_sum)[::-1]  # Reverse back
    hashed_key = hashlib.sha256(secret_key.encode()).hexdigest()
    seed = int(hashed_key[:16], 16)
    
    print(f"Recovered Secret Key Sum: {ascii_sum}")
    print(f"Recovered Seed: {seed}")
    
    return decrypted_text

# Paste the encrypted text here
encrypted_key = "P ±»¾u¼ÊÌÆ³ÒØêõî÷¬úð®øüûÀÉ&æÛ&6,ñ@ðLENNÿHQIRVl^ay=&noxI}xX\¥hp¯v¶ÀÎ^"

decrypted_key = decrypt(encrypted_key)
print("Decrypted Key:", decrypted_key)
