# Se puede hacer con cualquier lenguaje de programación, no necesariamente python
# En caso de montar un backend con javascript, java, php y querramos traernos los datos
# para devolverlos al frontend

import mysql.connector

config = {
    "host": "localhost",
    "port": "3306",
    "database": "hello_mysql",
    "user": "root",
    "password": "6269455"
}

connection = mysql.connector.connect(**config)
cursor = connection.cursor()

query = "SELECT * FROM users"
cursor.execute(query)
result = cursor.fetchall()

for row in result:
    print(row)
    
cursor.close()
connection.close()