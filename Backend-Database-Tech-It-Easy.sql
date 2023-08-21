git DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS television;
DROP TABLE IF EXISTS remote_controller;
DROP TABLE IF EXISTS ci_module;
DROP TABLE IF EXISTS wall_bracket;
DROP TABLE IF EXISTS television_wall_bracket;

CREATE TABLE users (
	username text,
	password text
);

CREATE TABLE remote_controller (
    id INT GENERATED ALWAYS AS IDENTITY,
    name TEXT NOT NULL UNIQUE,
	brand TEXT NOT NULL,
	price DOUBLE PRECISION NOT NULL,
	current_stock INT,
	sold INT,
	compatible_with TEXT NOT NULL,
	battery_type TEXT NOT NULL,	
    PRIMARY KEY (id)
);

CREATE TABLE ci_module (
	id INT GENERATED ALWAYS AS IDENTITY,
    name TEXT NOT NULL UNIQUE,
	brand TEXT NOT NULL,
	price DOUBLE PRECISION NOT NULL,
	current_stock INT,
	sold INT,
    PRIMARY KEY (id)
);

CREATE TABLE wall_bracket (
    id INT GENERATED ALWAYS AS IDENTITY,
    name TEXT NOT NULL UNIQUE,
	brand TEXT NOT NULL,
	price DOUBLE PRECISION NOT NULL,
	current_stock INT,
	sold INT,
	adjustable BOOLEAN NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE television (
    id INT GENERATED ALWAYS AS IDENTITY,
    name TEXT NOT NULL UNIQUE,
	brand TEXT NOT NULL,
	price DOUBLE PRECISION NOT NULL,
	current_stock INT,
	sold INT,
	type TEXT,
	available INT,
	refresh_rate DOUBLE PRECISION NOT NULL,
	screen_type TEXT NOT NULL,
	CONSTRAINT fk_remote_controller FOREIGN KEY (remote_controller_id) REFERENCES remote_controller(id),
	CONSTRAINT fk_ci_module FOREIGN KEY (ci_module_id) REFERENCES cimodule(id),
    PRIMARY KEY (id)
);

CREATE TABLE television_wall_bracket (
	television_id INT,
	wall_bracket_id INT,
	CONSTRAINT fk_television FOREIGN KEY (television_id) REFERENCES television(id),
    CONSTRAINT fk_wall_bracket FOREIGN KEY (wall_bracket_id) REFERENCES wall_bracket(id)
);

INSERT INTO users (username, password)
	VALUES ('Tamara', '1234');
INSERT INTO users (username, password)
	VALUES ('Frans', '5678');
INSERT INTO users (username, password)
	VALUES ('Nicole', 'ABCD');
INSERT INTO users (username, password)
	VALUES ('Rob', 'abcd');

INSERT INTO remote_controller (name, brand, price, compatible_with, battery_type)
	VALUES ('Aiwa', 'AEG', 22, 'unknown', 'AA');
INSERT INTO remote_controller (name, brand, price, compatible_with, battery_type)
	VALUES ('RC-10', 'Dreambox', 27.95, 'unknown', 'AA');
INSERT INTO remote_controller (name, brand, price, compatible_with, battery_type)
	VALUES ('RED360', 'Vector', 9.95, 'unknown', 'AAA');
INSERT INTO remote_controller (name, brand, price, compatible_with, battery_type)
	VALUES ('UI869', 'Samsung', 84.99, 'unknown', 'AAA');

INSERT INTO ci_module (name, brand, price)
	VALUES ('Quantis', 'Ziggo', 50);
INSERT INTO ci_module (name, brand, price)
	VALUES ('Cl+', 'SMiT', 80);
INSERT INTO ci_module (name, brand, price)
	VALUES ('CI+ Mediaguard', 'Canal Digitaal', 69);

INSERT INTO wall_bracket (name, brand, price, adjustable)
	VALUES('Hercules', 'DQ', 139, true);
INSERT INTO wall_bracket (name, brand, price, adjustable)
	VALUES('Tantel', 'XTRARM', 149, true);
INSERT INTO wall_bracket (name, brand, price, adjustable)
	VALUES('Newstar', 'Neomounts', 45, false);
INSERT INTO wall_bracket (name, brand, price, adjustable)
	VALUES('Leto', 'DQ', 24.95, false);

INSERT INTO television (name, brand, price, refresh_rate, screen_type)
	VALUES('32PHS6808', 'Philips', 329, 249, 'LED-LCD');
INSERT INTO television (name, brand, price, refresh_rate, screen_type)
	VALUES('Neo QLED 55QN85B', 'Samsung', 1099, 999, 'LED-LCD');
INSERT INTO television (name, brand, price, refresh_rate, screen_type)
	VALUES('OLED55C34LA', 'LG', 2964, 2609, 'OLED');
INSERT INTO television (name, brand, price, refresh_rate, screen_type)
	VALUES('KD-43X75WL', 'Sony', 929, 764, 'LED-LCD');

SELECT television.name AS TV, remote_controller.name AS RC
FROM television JOIN remote_controller
 ON remote_controller.name = television.name;			 
