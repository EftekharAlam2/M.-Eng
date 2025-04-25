def encrypt_sms(text):
    encrypted = ""
    for char in text:
        if char.isalpha():
            base = ord('A') if char.isupper() else ord('a')
            shifted = (ord(char) - base + 2) % 26 + base
            encrypted += chr(shifted)
        else:
            encrypted += char
    return encrypted

def decrypt_sms(text):
    decrypted = ""
    for char in text:
        if char.isalpha():
            base = ord('A') if char.isupper() else ord('a')
            shifted = (ord(char) - base - 2) % 26 + base
            decrypted += chr(shifted)
        else:
            decrypted += char
    return decrypted

sms = input("Enter your SMS: ")
encrypted_sms = encrypt_sms(sms)
print("Encrypted SMS:", encrypted_sms)

decrypted_sms = decrypt_sms(encrypted_sms);
print("Decrypted SMS:", decrypted_sms)
