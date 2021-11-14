#Page 3
SHOW DATABASES;
SHOW TABLES FROM LibraryDB;
SELECT * 
FROM information_schema.columns
WHERE table_schema = 'LibraryDB';

#-------------------------------------------------------------------
#Page 4
USE LibraryDB;
SELECT *
FROM BORROWER
WHERE Phone IS NULL;

#USE LibraryDB;
#SELECT *
#FROM BORROWER
#WHERE Phone = NULL;

#-------------------------------------------------------------------
SELECT * FROM BOOK;
SELECT * FROM PUBLISHER;
SELECT Phone FROM PUBLISHER;


SELECT * FROM BOOK;

SELECT * FROM PUBLISHER; 


#Page 5
SELECT B.Title
FROM BOOK AS B
WHERE B.Publisher_name IN ( SELECT P.Name
													FROM PUBLISHER AS P
													WHERE P.Name LIKE 'J%' OR P.Phone  NOT LIKE '333%');
                                        
SELECT BA.Author_name
FROM BOOK_AUTHORS AS BA
WHERE BA.Author_name IN ( SELECT BR.Name
												 FROM BORROWER AS BR
												 WHERE BA.Author_name = BR.Name); 
SELECT BA.Author_name
FROM BOOK_AUTHORS AS BA, BORROWER AS BR
WHERE BA.Author_name = BR.Name;  


SELECT * FROM BOOK_AUTHORS;
SELECT * FROM BORROWER; 

#-------------------------------------------------------------------
#Page 6
SELECT P.Name
FROM PUBLISHER AS P
WHERE NOT EXISTS(SELECT * FROM BOOK AS B
                 WHERE P.Name = B.Publisher_name);   
                 
SELECT * FROM PUBLISHER;
SELECT * FROM BOOK; 
                 
SELECT P.Name
FROM PUBLISHER AS P
WHERE  EXISTS( SELECT * FROM BOOK as B WHERE P.Name = B.Publisher_name); 

#ASK DIFFERENCE
SELECT P.Name AS `Publisher's Name`
FROM PUBLISHER AS P;

USE LibraryDB;
DESCRIBE PUBLISHER;         



#-------------------------------------------------------------------
#Page 7

SELECT DISTINCT BL.Branch_id, BL.Card_no
FROM BOOK_LOANS AS BL 
	 JOIN
     BOOK_COPIES AS BC 
     ON BL.Branch_id = BC.Branch_id
WHERE BC.No_of_copies > 10;

SELECT * FROM BOOK_COPIES;
SELECT * FROM BOOK_LOANS;

#ASK DIFFERENCE
USE LibraryDB;
SELECT DISTINCT BL.Branch_id, BL.Card_no
FROM BOOK_LOANS AS BL
			NATURAL JOIN
			BOOK_COPIES AS BC
WHERE BC.No_of_copies > 10;              

SELECT * FROM BOOK_COPIES;
SELECT * FROM BOOK_LOANS;

#AS BL (b_id, d_d, d_o, br_id, crd_no)

SELECT DISTINCT BL.Branch_id, BL.Card_no
FROM BOOK_LOANS AS BL
			JOIN
			BOOK_COPIES AS BC
            USING (Branch_id, Book_id)
WHERE BC.No_of_copies > 10;


#-------------------------------------------------------------------
#Page 8
SELECT BA.Author_name, BR.Name AS Borrower_name
FROM BOOK_AUTHORS AS BA
			JOIN
            BORROWER AS BR
			ON
            BA.Author_name = BR.Name;       

SELECT BA.Author_name, BR.Name AS Borrower_name
FROM BOOK_AUTHORS AS BA
			LEFT OUTER JOIN
			BORROWER AS BR
            ON
            BA.Author_name = BR.Name;       
            
 SELECT BA.Author_name, BR.Name AS Borrower_name
FROM BOOK_AUTHORS AS BA
     RIGHT OUTER JOIN
     BORROWER AS BR
     ON
     BA.Author_name = BR.Name;             
            
            
SELECT  BA.Author_name, BR.Name AS Borrower_name
FROM BOOK_AUTHORS AS BA
			CROSS  JOIN
			BORROWER  AS BR;       

#-------------------------------------------------------------------
#Page 9
            
SELECT * FROM BORROWER;
SELECT * FROM BOOK_AUTHORS; 

SELECT Branch_id, SUM(No_of_copies) AS `Total Number of Copies`
FROM BOOK_COPIES
GROUP BY Branch_id;  

SELECT * FROM BOOK_COPIES;

SELECT Branch_id, AVG(No_of_copies) AS `Average Number of Copies`
FROM BOOK_COPIES
GROUP BY Branch_id
HAVING `Average Number of Copies` < 30;


SELECT Branch_id, SUM(No_of_copies)
FROM BOOK_COPIES
WHERE No_of_copies > 20
#GROUP BY Branch_id;
      AND 
      Branch_id IN
                (SELECT Branch_id
                 FROM LIBRARY_BRANCH
                 WHERE Address LIKE '%ON%' )
GROUP BY Branch_id;


SELECT * FROM LIBRARY_BRANCH;

#All of them has the same pattern 

#-------------------------------------------------------------------
#Page 10
#ASK
CREATE TRIGGER COPIES_VIOLATION
       BEFORE INSERT ON BOOK_COPIES
       FOR EACH ROW
       SET NEW.no_of_copies = IF(NEW.No_of_copies < 5,
                                 NULL, 
                                 NEW.No_of_copies);
                                 
#INSERT INTO Book_COPIES VALUES(7, 3025, 4);
INSERT INTO BOOK_COPIES VALUES(5, 3211, 5);

SELECT * FROM BOOK_COPIES;
SHOW TRIGGERS;

CREATE VIEW AVAILABLE_COPIES AS 
	   SELECT *
	   FROM BOOK_COPIES
	   WHERE No_of_copies BETWEEN 20 AND 80
	   ORDER BY No_of_copies DESC;

#-------------------------------------------------------------------
#Page 11


SHOW CREATE VIEW AVAILABLE_COPIES;

#DROP VIEW AVAILABLE_COPIES;