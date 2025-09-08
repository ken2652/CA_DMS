from werkzeug.security import generate_password_hash

# Generate hash for admin password
password = "admin123"  # You can change this password
password_hash = generate_password_hash(password)
 
print(f"Password: {password}")
print(f"Hash: {password_hash}")
print("\nCopy the hash above and replace the placeholder in db_setup.sql") 