import mysql.connector

def get_db_connection():
    return mysql.connector.connect(
        host='localhost',         # Change if your DB is remote
        user='root',   # Your MySQL username
        password='Test@123', # Your MySQL password
        database='inventory_docs'  # Your database name
    ) 