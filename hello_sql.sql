-- Visualizamos las DB creadas
SHOW databases;

-- Creamos una DB
CREATE DATABASE hello_sql;

-- Utilizamos dicha DB
USE hello_sql;

-- Creamos una table
CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `age` int DEFAULT NULL,
  `init_date` date DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
);

-- Modificamos una columna dentro de la tabla
ALTER TABLE users MODIFY COLUMN user_id int NOT NULL AUTO_INCREMENT;

-- Insertamos un dato en la Table 'users'
INSERT INTO users (user_id, name, surname, age, init_date, email) VALUE (1, 'Anna', 'Leon', 32, 2022-12-03, 'anna@gmail.com');
INSERT INTO users (user_id, name, surname, age, init_date, email) VALUE (2, 'Sara', 'Ferrera', 2023-10-12, 'sara@gmail.com');
INSERT INTO users (name, surname, age) VALUE ('Carlos', 'Azaustre', 15);
INSERT INTO users (user_id, name, surname, age, email) VALUE (5, 'Miriam', 'Gonzales', 15, 'miriam@gmail.com');
INSERT INTO users (user_id, name, surname, age) VALUE (8, 'Fernando', 'Azaustre', 45);
INSERT INTO users (name, surname, age) VALUE ('Valentina', 'Azaustre', 28);

-- Filtro para ver datos sin que estos se repitan
SELECT DISTINCT age FROM users;

-- Ver registros mediante limitaciones concretas
SELECT * FROM users WHERE id = 3;
SELECT * FROM users WHERE age = 15 AND name = 'Carlos';

-- Actualizar datos dentro de la tabla
UPDATE users SET name = 'Samantha' WHERE id = 2;
UPDATE users SET email = 'sara@gmail.com' WHERE id = 8;

-- Ordenamos los datos de menor a mayor en base a un criterio, puede ser ASC o DESC
SELECT * FROM users ORDER BY age;
SELECT * FROM users ORDER BY age ASC;
SELECT * FROM users ORDER BY age DESC;

SELECT * FROM users WHERE email = 'sara@gmail.com' ORDER BY age DESC;

-- Criterio de busqueda LIKE
SELECT * FROM users WHERE email LIKE '%.com';
SELECT * FROM users WHERE name LIKE '%ar%';
SELECT * FROM users WHERE email LIKE 'sara%';

-- NOT
SELECT * FROM users WHERE NOT age = 28;

-- AND
SELECT * FROM users WHERE NOT email = 'sara@gmail.com' AND age = 28;

-- OR
SELECT * FROM users WHERE email = 'miriam@gmail.com' OR age = 28;

-- Restringimos el numero de resultados
SELECT * FROM users LIMIT 3;

-- NULL
SELECT * FROM users WHERE email IS NULL;
SELECT * FROM users WHERE email IS NOT NULL;
SELECT * FROM users WHERE email IS NOT NULL AND age = 15;