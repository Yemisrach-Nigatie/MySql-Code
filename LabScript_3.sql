DROP DATABASE RookeryDB;

CREATE DATABASE RookeryDB;
SHOW databases;
USE RookeryDB;
#UNIQUE key scientific_name?
CREATE TABLE Bird(bird_id INT AUTO_INCREMENT PRIMARY KEY,
									  scientific_name VARCHAR(255) UNIQUE,
									  common_name VARCHAR(50) ,
									  family_sci_name VARCHAR(255),
									  brief_description TEXT,
									  bird_image BLOB)
                                      DEFAULT CHARSET=UTF8MB4;
                             
USE RookeryDB;
INSERT INTO Bird(common_name, scientific_name)
VALUES('Purple finch', 'Haemorhous purpureus'),
			   ('Dark-eyed junco' , 'Junco hyemalis'),
			   ( 'Killdeer', 'Charadrius vociferus'),
			   ('Northern saw-whet owl', 'Aegolius acadicus'),
			   ('Tree swallow', 'Tachycineta bicolor'),
			   ('Eastern bluebird', 'Sialia sialis'),
			   ('Mute swan', 'Cygnus olor');
SELECT * FROM Bird;
#do we have to use this code always when we update without where clause- question does it have any side effect?
SET SQL_SAFE_UPDATES = 0;
#SELECT * FROM RookeryDB.Bird;
DELETE FROM RookeryDB.Bird WHERE common_name LIKE '%-%';
SELECT * FROM RookeryDB.Bird;

USE RookeryDB;
CREATE TABLE Bird_family (family_id INT AUTO_INCREMENT PRIMARY KEY,
												   scientific_name VARCHAR(255) UNIQUE,
												   brief_description TEXT,
                                                   order_sci_name VARCHAR(255))
												   DEFAULT CHARSET=UTF8MB4;
#DESCRIBE Bird_family;                                                   
CREATE TABLE Bird_Order (order_id INT AUTO_INCREMENT PRIMARY KEY,
												 scientific_name VARCHAR(255) UNIQUE ,
                                                 brief_description TEXT)
												DEFAULT CHARSET=UTF8MB4;
#DESCRIBE Bird_Order;                                                  


USE RookeryDB;
ALTER TABLE Bird ADD COLUMN last_seen_dt DATETIME
							 AFTER brief_description;    
#DESCRIBE Bird;  

USE RookeryDB;
ALTER TABLE Bird ADD COLUMN body_id CHAR(2) AFTER last_seen_dt, 
								  ADD COLUMN nail_beak BOOLEAN DEFAULT 0 AFTER body_id,
                                  ADD COLUMN bird_status ENUM('Accidental', 'Breeding',  'Extinct') ,
                                  CHANGE COLUMN common_name common_name VARCHAR(255);         
DESCRIBE Bird; 
SELECT * FROM Bird; 

USE RookeryDB;
#SELECT * FROM Bird; 
UPDATE Bird SET bird_status = 'Breeding' WHERE bird_id IN(1,2,4,5);
#SELECT * FROM Bird;    

#USE RookeryDB;
#UPDATE Bird SET bird_id = 8 WHERE bird_status = 'Breeding'; #not possible to use two identical PK 

USE RookeryDB;
ALTER TABLE Bird MODIFY COLUMN bird_status ENUM('Accidental', 'Breeding',  'Extinct', 'Extirpated', 'Introduced'); 
SHOW COLUMNS FROM Bird LIKE '%status' ;

#to clear the session or refresh the update we make like the drop default code - question it's refreshed starting from the new insertion. why? no auto create user deprecated. it will be removed in the future release 
set session sql_mode = '';
USE RookeryDB;
#DESCRIBE Bird; 
ALTER TABLE Bird ALTER nail_beak DROP DEFAULT;
#DESCRIBE Bird; 
INSERT INTO Bird(common_name, bird_status) VALUES('Canada goose', 'Breeding');
SELECT * FROM Bird; 

USE RookeryDB;
CREATE TABLE Bird_Copy LIKE  Bird;
SHOW TABLES;
#SELECT * FROM Bird_Copy;
#DESCRIBE Bird_Copy;

USE RookeryDB;
CREATE TABLE Bird_Deep_Copy SELECT * FROM Bird;
SHOW TABLES;
SELECT * FROM Bird_Deep_Copy;

#difference between thier result key and extra is not available on bird_deep_copy - question
#DESCRIBE Bird_Copy;
#DESCRIBE Bird_Deep_Copy;
set foreign_key_checks=0;
USE RookeryDB;
ALTER TABLE Bird
ADD CONSTRAINT fk_family_sci_name FOREIGN KEY (family_sci_name) 
REFERENCES Bird_family(scientific_name);
#SHOW CREATE TABLE Bird;
DESCRIBE Bird;
#what does MUL means?

DESCRIBE Bird_family; 
DESCRIBE Bird_Order;
USE RookeryDB;
ALTER TABLE Bird_family 
ADD CONSTRAINT fk_order_sci_name FOREIGN KEY (order_sci_name)
REFERENCES Bird_Order(scientific_name);
SHOW CREATE TABLE Bird_family;
