CREATE DATABASE OODB; 

/*python3
import os
os.chdir("/home/data/Desktop/Python files")
print("current: {0}".format(os.getcwd()))
current: /home/data/Desktop/Python files
exec(open('ODBExtension.py').read())
exec(open('ODBQueries.py').read())

********** List of Books **********
Fundamentals of Database Systems
Introduction to Probability and Statistics
Fundamentals of Python: First Programs
Currently there are 3 books in the database and 2 of them start with letter 'F'.
*/

SHOW DATABASES;
USE OODB;
DESCRIBE BOOK;
DESCRIBE PUBLISHER;
DESCRIBE book_publisher;
SELECT * FROM BOOK;
SELECT * FROM PUBLISHER;
SELECT * FROM book_publisher;

/*exec(open('ODBInheritanceST.py').read())*/
DESCRIBE STBOOK; 
SELECT * FROM STBOOK;


/*
2021-11-04 11:41:17,251 INFO sqlalchemy.engine.Engine SHOW VARIABLES LIKE 'sql_mode'
2021-11-04 11:41:17,251 INFO sqlalchemy.engine.Engine [raw sql] {}
2021-11-04 11:41:17,262 INFO sqlalchemy.engine.Engine SHOW VARIABLES LIKE 'lower_case_table_names'
2021-11-04 11:41:17,262 INFO sqlalchemy.engine.Engine [generated in 0.00018s] {}
2021-11-04 11:41:17,265 INFO sqlalchemy.engine.Engine SELECT DATABASE()
2021-11-04 11:41:17,265 INFO sqlalchemy.engine.Engine [raw sql] {}
2021-11-04 11:41:17,267 INFO sqlalchemy.engine.Engine BEGIN (implicit)
2021-11-04 11:41:17,268 INFO sqlalchemy.engine.Engine SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = %(table_schema)s AND table_name = %(table_name)s
2021-11-04 11:41:17,268 INFO sqlalchemy.engine.Engine [generated in 0.00034s] {'table_schema': 'OODB', 'table_name': 'book_publisher'}
2021-11-04 11:41:17,271 INFO sqlalchemy.engine.Engine SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = %(table_schema)s AND table_name = %(table_name)s
2021-11-04 11:41:17,271 INFO sqlalchemy.engine.Engine [cached since 0.003128s ago] {'table_schema': 'OODB', 'table_name': 'BOOK'}
2021-11-04 11:41:17,275 INFO sqlalchemy.engine.Engine SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = %(table_schema)s AND table_name = %(table_name)s
2021-11-04 11:41:17,275 INFO sqlalchemy.engine.Engine [cached since 0.006969s ago] {'table_schema': 'OODB', 'table_name': 'PUBLISHER'}
2021-11-04 11:41:17,286 INFO sqlalchemy.engine.Engine 
CREATE TABLE `BOOK` (
	`Book_id` INTEGER NOT NULL AUTO_INCREMENT, 
	`Title` VARCHAR(80), 
	`Publisher_name` VARCHAR(80), 
	PRIMARY KEY (`Book_id`)
)


2021-11-04 11:41:17,286 INFO sqlalchemy.engine.Engine [no key 0.00016s] {}
2021-11-04 11:41:17,447 INFO sqlalchemy.engine.Engine 
CREATE TABLE `PUBLISHER` (
	`Publisher_name` VARCHAR(80) NOT NULL, 
	`Address` VARCHAR(80), 
	`Phone` VARCHAR(80), 
	PRIMARY KEY (`Publisher_name`)
)


2021-11-04 11:41:17,447 INFO sqlalchemy.engine.Engine [no key 0.00024s] {}
2021-11-04 11:41:17,571 INFO sqlalchemy.engine.Engine 
CREATE TABLE book_publisher (
	`Book_id` INTEGER, 
	`Publisher_name` VARCHAR(80), 
	FOREIGN KEY(`Book_id`) REFERENCES `BOOK` (`Book_id`), 
	FOREIGN KEY(`Publisher_name`) REFERENCES `PUBLISHER` (`Publisher_name`)
)


2021-11-04 11:41:17,571 INFO sqlalchemy.engine.Engine [no key 0.00021s] {}
2021-11-04 11:41:17,828 INFO sqlalchemy.engine.Engine COMMIT
2021-11-04 11:41:17,846 INFO sqlalchemy.engine.Engine BEGIN (implicit)
2021-11-04 11:41:17,847 INFO sqlalchemy.engine.Engine INSERT INTO `BOOK` (`Title`, `Publisher_name`) VALUES (%(Title)s, %(Publisher_name)s)
2021-11-04 11:41:17,848 INFO sqlalchemy.engine.Engine [generated in 0.00018s] {'Title': 'Fundamentals of Database Systems', 'Publisher_name': None}
2021-11-04 11:41:17,858 INFO sqlalchemy.engine.Engine INSERT INTO `BOOK` (`Title`, `Publisher_name`) VALUES (%(Title)s, %(Publisher_name)s)
2021-11-04 11:41:17,858 INFO sqlalchemy.engine.Engine [cached since 0.01046s ago] {'Title': 'Introduction to Probability and Statistics', 'Publisher_name': None}
2021-11-04 11:41:17,859 INFO sqlalchemy.engine.Engine INSERT INTO `BOOK` (`Title`, `Publisher_name`) VALUES (%(Title)s, %(Publisher_name)s)
2021-11-04 11:41:17,859 INFO sqlalchemy.engine.Engine [cached since 0.01136s ago] {'Title': 'Fundamentals of Python: First Programs', 'Publisher_name': None}
2021-11-04 11:41:17,865 INFO sqlalchemy.engine.Engine INSERT INTO `PUBLISHER` (`Publisher_name`, `Address`, `Phone`) VALUES (%(Publisher_name)s, %(Address)s, %(Phone)s)
2021-11-04 11:41:17,866 INFO sqlalchemy.engine.Engine [generated in 0.00018s] ({'Publisher_name': 'Pearson', 'Address': None, 'Phone': None}, {'Publisher_name': 'Cengage', 'Address': None, 'Phone': None})
2021-11-04 11:41:17,867 INFO sqlalchemy.engine.Engine INSERT INTO book_publisher (`Book_id`, `Publisher_name`) VALUES (%(Book_id)s, %(Publisher_name)s)
2021-11-04 11:41:17,867 INFO sqlalchemy.engine.Engine [generated in 0.00017s] ({'Book_id': 1, 'Publisher_name': 'Pearson'}, {'Book_id': 2, 'Publisher_name': 'Cengage'}, {'Book_id': 3, 'Publisher_name': 'Cengage'})
2021-11-04 11:41:17,875 INFO sqlalchemy.engine.Engine COMMIT

>>> exec(open('ODBQueries.py').read())
2021-11-04 11:52:53,190 INFO sqlalchemy.engine.Engine BEGIN (implicit)
2021-11-04 11:52:53,191 INFO sqlalchemy.engine.Engine SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = %(table_schema)s AND table_name = %(table_name)s
2021-11-04 11:52:53,191 INFO sqlalchemy.engine.Engine [cached since 695.9s ago] {'table_schema': 'OODB', 'table_name': 'book_publisher'}
2021-11-04 11:52:53,193 INFO sqlalchemy.engine.Engine SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = %(table_schema)s AND table_name = %(table_name)s
2021-11-04 11:52:53,193 INFO sqlalchemy.engine.Engine [cached since 695.9s ago] {'table_schema': 'OODB', 'table_name': 'BOOK'}
2021-11-04 11:52:53,195 INFO sqlalchemy.engine.Engine SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = %(table_schema)s AND table_name = %(table_name)s
2021-11-04 11:52:53,195 INFO sqlalchemy.engine.Engine [cached since 695.9s ago] {'table_schema': 'OODB', 'table_name': 'PUBLISHER'}
2021-11-04 11:52:53,197 INFO sqlalchemy.engine.Engine COMMIT
2021-11-04 11:52:53,200 INFO sqlalchemy.engine.Engine BEGIN (implicit)
2021-11-04 11:52:53,203 INFO sqlalchemy.engine.Engine SELECT `BOOK`.`Book_id` AS `BOOK_Book_id`, `BOOK`.`Title` AS `BOOK_Title`, `BOOK`.`Publisher_name` AS `BOOK_Publisher_name` 
FROM `BOOK`
2021-11-04 11:52:53,203 INFO sqlalchemy.engine.Engine [generated in 0.00018s] {}
2021-11-04 11:52:53,211 INFO sqlalchemy.engine.Engine SELECT count(*) AS count_1 
FROM (SELECT `BOOK`.`Book_id` AS `BOOK_Book_id`, `BOOK`.`Title` AS `BOOK_Title`, `BOOK`.`Publisher_name` AS `BOOK_Publisher_name` 
FROM `BOOK`) AS anon_1
2021-11-04 11:52:53,212 INFO sqlalchemy.engine.Engine [generated in 0.00022s] {}
2021-11-04 11:52:53,220 INFO sqlalchemy.engine.Engine SELECT `BOOK`.`Book_id` AS `BOOK_Book_id`, `BOOK`.`Title` AS `BOOK_Title`, `BOOK`.`Publisher_name` AS `BOOK_Publisher_name` 
FROM `BOOK` 
WHERE lower(`BOOK`.`Title`) LIKE lower(%(Title_1)s)
2021-11-04 11:52:53,220 INFO sqlalchemy.engine.Engine [generated in 0.00038s] {'Title_1': 'F%'}
********** List of Books **********
Fundamentals of Database Systems
Introduction to Probability and Statistics
Fundamentals of Python: First Programs
Currently there are 3 books in the database and 2 of them start with letter 'F'.
********** ************* **********
2021-11-04 11:52:53,244 INFO sqlalchemy.engine.Engine COMMIT

>>> exec(open('ODBInheritanceST.py').read())
2021-11-04 11:58:05,060 INFO sqlalchemy.engine.Engine BEGIN (implicit)
2021-11-04 11:58:05,061 INFO sqlalchemy.engine.Engine SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = %(table_schema)s AND table_name = %(table_name)s
2021-11-04 11:58:05,061 INFO sqlalchemy.engine.Engine [cached since 1008s ago] {'table_schema': 'OODB', 'table_name': 'book_publisher'}
2021-11-04 11:58:05,063 INFO sqlalchemy.engine.Engine SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = %(table_schema)s AND table_name = %(table_name)s
2021-11-04 11:58:05,063 INFO sqlalchemy.engine.Engine [cached since 1008s ago] {'table_schema': 'OODB', 'table_name': 'BOOK'}
2021-11-04 11:58:05,065 INFO sqlalchemy.engine.Engine SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = %(table_schema)s AND table_name = %(table_name)s
2021-11-04 11:58:05,065 INFO sqlalchemy.engine.Engine [cached since 1008s ago] {'table_schema': 'OODB', 'table_name': 'PUBLISHER'}
2021-11-04 11:58:05,070 INFO sqlalchemy.engine.Engine SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = %(table_schema)s AND table_name = %(table_name)s
2021-11-04 11:58:05,070 INFO sqlalchemy.engine.Engine [cached since 1008s ago] {'table_schema': 'OODB', 'table_name': 'STBOOK'}
2021-11-04 11:58:05,072 INFO sqlalchemy.engine.Engine 
CREATE TABLE `STBOOK` (
	book_id INTEGER NOT NULL AUTO_INCREMENT, 
	author_id INTEGER, 
	title VARCHAR(80), 
	type VARCHAR(80), 
	PRIMARY KEY (book_id)
)
2021-11-04 11:58:05,073 INFO sqlalchemy.engine.Engine [no key 0.00018s] {}
2021-11-04 11:58:05,273 INFO sqlalchemy.engine.Engine COMMIT
2021-11-04 11:58:05,274 INFO sqlalchemy.engine.Engine BEGIN (implicit)
2021-11-04 11:58:05,276 INFO sqlalchemy.engine.Engine INSERT INTO `STBOOK` (author_id, title, type) VALUES (%(author_id)s, %(title)s, %(type)s)
2021-11-04 11:58:05,276 INFO sqlalchemy.engine.Engine [generated in 0.00019s] {'author_id': None, 'title': 'Fundamentals of Database Systems', 'type': 'STBook'}
2021-11-04 11:58:05,282 INFO sqlalchemy.engine.Engine INSERT INTO `STBOOK` (author_id, title, type) VALUES (%(author_id)s, %(title)s, %(type)s)
2021-11-04 11:58:05,282 INFO sqlalchemy.engine.Engine [cached since 0.006387s ago] {'author_id': None, 'title': 'Introduction to Probability and Statistics', 'type': 'epubSTBook'}
2021-11-04 11:58:05,283 INFO sqlalchemy.engine.Engine INSERT INTO `STBOOK` (author_id, title, type) VALUES (%(author_id)s, %(title)s, %(type)s)
2021-11-04 11:58:05,283 INFO sqlalchemy.engine.Engine [cached since 0.007182s ago] {'author_id': None, 'title': 'Fundamentals of Python: First Programs', 'type': 'pdfSTBook'}
2021-11-04 11:58:05,284 INFO sqlalchemy.engine.Engine COMMIT
*/
 