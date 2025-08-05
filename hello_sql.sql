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
INSERT INTO users (user_id, name, surname, age, init_date, email) VALUE (1, 'Anna', 'Leon', 32, 2022-12-03, 'souleynu@gmail.com');
INSERT INTO users (user_id, name, surname, age, init_date, email) VALUE (2, 'Sara', 'Ferrera', 2023-10-12, 'sara@gmail.com');
INSERT INTO users (name, surname, age) VALUE ('Carlos', 'Azaustre', 15);
INSERT INTO users (user_id, name, surname, age, email) VALUE (5, 'Miriam', 'Gonzales', 15, 'miriam@gmail.com');

-- Filtro para ver datos sin que estos se repitan
SELECT DISTINCT age FROM users;

-- Ver registros
SELECT * FROM users WHERE id = 3;
SELECT * FROM users WHERE age = 15 AND name = 'Carlos';

-- Actualizar datos dentro de la tabla
UPDATE users SET name = 'Samantha' WHERE id = 2;