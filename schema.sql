CREATE TABLE color (
	color_id SERIAL PRIMARY KEY,
	color VARCHAR (30) NOT NULL
);
	
CREATE TABLE breed (
	breed_id SERIAL PRIMARY KEY,
	breed VARCHAR (30) NOT NULL
);

CREATE TABLE pet_type (
	pet_type_id SERIAL PRIMARY KEY,
	pet_type VARCHAR (30) NOT NULL
);

CREATE TABLE shelter (
	shelter_id SERIAL PRIMARY KEY,
	shelter_name VARCHAR (30) NOT NULL
);

CREATE TABLE status (
	status_id SERIAL PRIMARY KEY,
	status VARCHAR (30) NOT NULL
);

CREATE TABLE adopter (
	adopter_id SERIAL PRIMARY KEY,
	first_name VARCHAR (30) NOT NULL,
	last_name VARCHAR (50) NOT NULL
);


CREATE TABLE phone (
	phone_id SERIAL PRIMARY KEY,
	phone VARCHAR (30) NOT NULL,
	adopter_id INT REFERENCES adopter (adopter_id),
	shelter_id INT REFERENCES shelter (shelter_id)
);


CREATE TABLE address (
	address_id SERIAL PRIMARY KEY,
	address VARCHAR (50) NOT NULL,
	adopter_id INT REFERENCES adopter (adopter_id),
	shelter_id INT REFERENCES shelter (shelter_id)
);


CREATE TABLE pet (
	pet_id SERIAL PRIMARY KEY,
	pet_name VARCHAR (30) NOT NULL,
	pet_age INT,
	registration_date DATE NOT NULL,
	color_id INT REFERENCES color (color_id) NOT NULL,
	breed_id INT REFERENCES breed (breed_id),
	pet_type_id INT REFERENCES pet_type (pet_type_id) NOT NULL,
	shelter_id INT REFERENCES shelter (shelter_id)
);
	

CREATE TABLE adopting_info (
	adopting_info_id SERIAL PRIMARY KEY,
	adopter_id INT NOT NULL,
	pet_id INT NOT NULL,
	status_id INT NOT NULL
);

--trying to add FK by different way

ALTER TABLE adopting_info ADD CONSTRAINT adopting_info_fk0 FOREIGN KEY (adopter_id) REFERENCES adopter (adopter_id);
ALTER TABLE adopting_info ADD CONSTRAINT adopting_info_fk1 FOREIGN KEY (pet_id) REFERENCES pet (pet_id);
ALTER TABLE adopting_info ADD CONSTRAINT adopting_info_fk2 FOREIGN KEY (status_id) REFERENCES status (status_id);


INSERT INTO color (color) VALUES ('коричневый');
INSERT INTO color (color) VALUES ('черный');
INSERT INTO color (color) VALUES ('белый');
INSERT INTO color (color) VALUES ('черно-белый');

INSERT INTO breed (breed) VALUES ('немецкая овчарка');
INSERT INTO breed (breed) VALUES ('шотланский фолд');
INSERT INTO breed (breed) VALUES ('беcпородный');

INSERT INTO pet_type (pet_type) VALUES ('собака');
INSERT INTO pet_type (pet_type) VALUES ('кот');
INSERT INTO pet_type (pet_type) VALUES ('хорек');

INSERT INTO shelter (shelter_name) VALUES ('Доброе сердце');
INSERT INTO shelter (shelter_name) VALUES ('Хвост');
INSERT INTO shelter (shelter_name) VALUES ('Питомец');


INSERT INTO status (status) VALUES ('Передержка');
INSERT INTO status (status) VALUES ('Возвращен в приют');
INSERT INTO status (status) VALUES ('Обрел семью');

INSERT INTO adopter (first_name, last_name) VALUES ('Роман','Феоктистов');
INSERT INTO adopter (first_name, last_name) VALUES ('Ирина','Смирнова');
INSERT INTO adopter (first_name, last_name) VALUES ('Петр','Караваев');
INSERT INTO adopter (first_name, last_name) VALUES ('Александра','Ларина');


INSERT INTO phone (phone, adopter_id) VALUES ('+7 981 324-12-25', 3);
INSERT INTO phone (phone, adopter_id) VALUES ('+7 911 542-12-63', 3);
INSERT INTO phone (phone, shelter_id) VALUES ('+7 912 543-43-12', 1);

INSERT INTO address (address, shelter_id) VALUES ('Ленина, 50, кв.7', 2);
INSERT INTO address (address, shelter_id) VALUES ('Авангардная, 52с1, кв. 1', 3);
INSERT INTO address (address, adopter_id) VALUES ('Никитская, 32к1, кв.67', 3);

INSERT INTO pet (pet_type_id, pet_name, breed_id, color_id, pet_age, registration_date, shelter_id) 
	VALUES (1, 'Рэкс', 1, 1, 10, TO_DATE('15.07.2020', 'DD.MM.YYYY'), 1);
INSERT INTO pet (pet_type_id, pet_name, breed_id, color_id, pet_age, registration_date, shelter_id) 
	VALUES (2, 'Муся', 2, 2, 3, TO_DATE('03.11.2021', 'DD.MM.YYYY'), 2);
INSERT INTO pet (pet_type_id, pet_name, breed_id, color_id, pet_age, registration_date, shelter_id) 
	VALUES (3, 'Иннокентий', 3, 3, 1, TO_DATE('23.01.2022', 'DD.MM.YYYY'), 3);

INSERT INTO adopting_info (adopter_id, pet_id, status_id) VALUES (1,1,2);
INSERT INTO adopting_info (adopter_id, pet_id, status_id) VALUES (2,2,3);
INSERT INTO adopting_info (adopter_id, pet_id, status_id) VALUES (3,3,1);


