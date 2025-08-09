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

-- MIN and MAX
SELECT MAX(age) FROM users;
SELECT MIN(age) FROM users;

-- COUNT (cuenta cantidad de datos en dicha columna)
SELECT COUNT(age) FROM users;

-- AVG (sacar la media)
SELECT AVG(age) FROM users;

-- IN (traer datos estando seguros del criterio de busqueda)
SELECT * FROM users WHERE name IN ('monica', 'sara');

-- BETWEEN (encontrar resultados que se comprenden entre 2 valores)
SELECT * FROM users WHERE age BETWEEN 20 AND 35; 

-- ALIAS ('AS')
SELECT name, age, init_date AS 'init date' FROM users WHERE age BETWEEN 20 AND 35; 

-- CONCAT (concatenamos cadenas)
SELECT CONCAT(name, ' ', surname) AS 'Nombre completo', age, email FROM users;

-- GROUP BY (agrupa filas que tienen mismos valores, trabaja con filas-resumen)
SELECT MAX(age) FROM users GROUP BY age;
SELECT COUNT(age) AS 'Cantidad', age FROM users GROUP BY age;
SELECT COUNT(age) AS 'Cantidad', age FROM users GROUP BY age ORDER BY age ASC;
SELECT COUNT(age) AS 'Cantidad', age FROM users WHERE age > 15 GROUP BY age ORDER BY age DESC;

-- HAVING (limitamos una propia columna agregada)
SELECT COUNT(age) FROM users HAVING COUNT(age) > 6;

-- CASE (decidir en función de un resultado lo que va a pasar)
SELECT *,
CASE
	WHEN age >= 18 THEN 'Es mayor de edad'
  ELSE 'Es menor de edad'
END AS 'Verificador'
FROM users;

SELECT *,
CASE
	WHEN age >= 18 THEN TRUE
    ELSE FALSE
END AS '¿Es mayor de edad?'
FROM users;

SELECT *,
CASE
	WHEN age > 18 THEN 'Es mayor de edad'
    WHEN age = 18 THEN 'Acaba de cumplir la mayoria de edad'
    ELSE 'Es menor de edad'
END AS '¿Es mayor de edad?'
FROM users;

-- IFNULL
SELECT name, surname, IFNULL(init_date, 0) AS 'Fecha de inicio' FROM users;

-- CRUD BASICO
-- INSERT
INSERT INTO users (user_id, name, surname) VALUES (9,'Maria','Lopez');

-- UPDATE
UPDATE users SET age = 21 WHERE user_id = 9;
UPDATE users SET age = 25, init_date = '2020-08-11' WHERE user_id = 9;

-- DELETE
DELETE FROM users WHERE user_id = 7;

-- DROP (eliminar la base de datos)
DROP DATABASE test;

-- MANEJO DE TABLAS
-- RELACIÖN 1:1 CON LA TABLA 'users'
CREATE TABLE dni (
  dni_id int NOT NULL AUTO_INCREMENT,
  dni_number int NOT NULL,
  user_id int,
  UNIQUE (dni_id),
  PRIMARY KEY(dni_id),
  FOREIGN KEY(user_id) REFERENCES users(user_id)
);

-- RELACIÖN 1:N CON LA TABLA 'users'
CREATE TABLE companies (
	id_companies int NOT NULL AUTO_INCREMENT,
  name_companies varchar(50) NOT NULL,
  PRIMARY KEY (id_companies)
);

-- AGREGAMOS LA COLUMNA 'id_companies' PARA QUE DESPUES SE VISUALICE EN QUE COMPAÑIA TRABAJA CADA USER 
ALTER TABLE users
ADD id_companies int

-- DEFINIMOS QUE LA COLUMNA AÑADIDA TAMBIEN SERA LA CLAVE FORANEA
ALTER TABLE users
ADD FOREIGN KEY(id_companies) REFERENCES companies(id_companies);

-- RELACION N:N CON LA TABLA 'USERS'
CREATE TABLE languages (
  language_id int NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  UNIQUE (language_id),
  PRIMARY KEY(language_id)
);

-- COMO DEFINIMOS, AL SER RELACIONES N:N ES NECESARIO CREAR TABLAS INTERMEDIAS, ESTAS SUELEN LLEVAR EL NOMBRE DE LAS DOS TABLAS A UTILIZAR
CREATE TABLE users_languages (
  users_language_id int NOT NULL AUTO_INCREMENT,
  user_id int,
  language_id int,
  UNIQUE (users_language_id, user_id, language_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id),
  FOREIGN KEY (language_id) REFERENCES languages (language_id)
);