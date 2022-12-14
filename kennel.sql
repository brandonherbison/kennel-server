CREATE TABLE `Location` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	TEXT NOT NULL,
	`address`	TEXT NOT NULL
);

CREATE TABLE `Customer` (
    `id`    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `name`    TEXT NOT NULL,
    `address`    TEXT NOT NULL,
    `email`    TEXT NOT NULL,
    `password`    TEXT NOT NULL
);

CREATE TABLE `Animal` (
	`id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`  TEXT NOT NULL,
	`status` TEXT NOT NULL,
	`breed` TEXT NOT NULL,
	`customer_id` INTEGER NOT NULL,
	`location_id` INTEGER,
	FOREIGN KEY(`customer_id`) REFERENCES `Customer`(`id`),
	FOREIGN KEY(`location_id`) REFERENCES `Location`(`id`)
);


CREATE TABLE `Employee` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	TEXT NOT NULL,
	`address`	TEXT NOT NULL,
	`location_id` INTEGER NOT NULL,
	FOREIGN KEY(`location_id`) REFERENCES `Location`(`id`)

);

INSERT INTO `Location` VALUES (null, 'Nashville North', "64 Washington Heights");
INSERT INTO `Location` VALUES (null, 'Nashville South', "101 Penn Ave");


INSERT INTO `Employee` VALUES (null, "Madi Peper", "35498 Madison Ave", 1);
INSERT INTO `Employee` VALUES (null, "Kristen Norris", "100 Main St", 1);
INSERT INTO `Employee` VALUES (null, "Meg Ducharme", "404 Unknown Ct", 2);
INSERT INTO `Employee` VALUES (null, "Hannah Hall", "204 Empty Ave", 1);
INSERT INTO `Employee` VALUES (null, "Leah Hoefling", "200 Success Way", 2);


INSERT INTO `Customer` VALUES (null, "Mo Silvera", "201 Created St", "mo@silvera.com", "password");
INSERT INTO `Customer` VALUES (null, "Bryan Nilsen", "500 Internal Error Blvd", "bryan@nilsen.com", "password");
INSERT INTO `Customer` VALUES (null, "Jenna Solis", "301 Redirect Ave", "jenna@solis.com", "password");
INSERT INTO `Customer` VALUES (null, "Emily Lemmon", "454 Mulberry Way", "emily@lemmon.com", "password");



INSERT INTO `Animal` VALUES (null, "Snickers", "Recreation", "Dalmation", 4, 1);
INSERT INTO `Animal` VALUES (null, "Jax", "Treatment", "Beagle", 1, 1);
INSERT INTO `Animal` VALUES (null, "Falafel", "Treatment", "Siamese", 4, 2);
INSERT INTO `Animal` VALUES (null, "Doodles", "Kennel", "Poodle", 3, 1);
INSERT INTO `Animal` VALUES (null, "Daps", "Kennel", "Boxer", 2, 2);
INSERT INTO `Animal` VALUES (null, "Cleo", "Kennel", "Poodle", 2, 2);
INSERT INTO `Animal` VALUES (null, "Popcorn", "Kennel", "Beagle", 3, 2);
INSERT INTO `Animal` VALUES (null, "Curly", "Treatment", "Poodle", 4, 2);

SELECT
    a.id,
    a.name,
    a.breed,
    a.status,
    a.location_id,
    a.customer_id
FROM animal a
WHERE a.id = 2

SELECT
   	a.id,
	a.name,
	a.address,
	a.email,
	a.password
FROM customer a
WHERE a.id = 2

SELECT * FROM customer
WHERE email = "emily@lemmon.com"

INSERT INTO `Animal` VALUES (null, "Daps", "Kennel", "Boxer", 2, 2);

SELECT
    a.id,
    a.name,
    a.breed,
    a.status,
    a.location_id,
    a.customer_id,
    l.name location_name,
    l.address location_address,
	c.name customer_name,
	c.address customer_address,
	c.email customer_email,
	c.password customer_password
FROM Animal a
JOIN Location l
    ON l.id = a.location_id
JOIN Customer c
	ON c.id = a.customer_id

DELETE FROM EmployeeAnimals WHERE id > 3;

CREATE TABLE `EmployeeAnimals` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`animal_id`	INTEGER NOT NULL,
	`employee_id`	INTEGER NOT NULL,
	FOREIGN KEY(`animal_id`) REFERENCES `Animal`(`id`),
	FOREIGN KEY(`employee_id`) REFERENCES `Employee`(`id`)
);

INSERT INTO `EmployeeAnimals` VALUES (null, 1, 2);
INSERT INTO `EmployeeAnimals` VALUES (null, 3, 5);
INSERT INTO `EmployeeAnimals` VALUES (null, 34, 3);
INSERT INTO `EmployeeAnimals` VALUES (null, 7, 1);

SELECT
	a.id,
	a.name,
	a.breed,
	a.status,
	a.location_id,
	a.customer_id,
	l.name location_name,
	l.address location_address,
	c.name customer_name,
	c.address customer_address,
	c.email customer_email,
	c.password customer_password,
	m.name animal_name
FROM animal a
JOIN Location l
	ON l.id = a.location_id
JOIN Customer c
	ON c.id = a.customer_id
WHERE a.id = 3


SELECT 
	e.id,
	e.name, 
	e.address, 
	e.location_id,
	l.name location_name, 
	l.address location_address,
	a.name animal_name,
	a.breed,
	a.status,
	a.location_id,
	a.customer_id
FROM Employee e
JOIN Location l
	ON l.id = e.location_id
JOIN EmployeeAnimals ea
	ON  e.id = ea.employee_id
JOIN Animal a
	ON ea.animal_id = a.id
WHERE e.id = ?
