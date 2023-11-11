/*

					SQL Project Name : Stock Management System (SMS)
							Trainee Name : Abdur Razzak Rayhan  
						    	  Trainee ID : 1278824     
							  Batch ID : WADA/PNTL-A/56/01 

 --------------------------------------------------------------------------------
Table of Contents: DML
			=> SECTION 01: INSERT DATA USING INSERT INTO KEYWORD
			=> SECTION 02: INSERT DATA THROUGH STORED PROCEDURE
				SUB SECTION => 2.1 : INSERT DATA THROUGH STORED PROCEDURE WITH AN OUTPUT PARAMETER 
				SUB SECTION => 2.2 : INSERT DATA USING SEQUENCE VALUE
			=> SECTION 03: UPDATE DELETE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.1 : UPDATE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.2 : DELETE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.3 : STORED PROCEDURE WITH TRY CATCH AND RAISE ERROR
			=> SECTION 04: INSERT UPDATE DELETE DATA THROUGH VIEW
				SUB SECTION => 4.1 : INSERT DATA through view
				SUB SECTION => 4.2 : UPDATE DATA through view
				SUB SECTION => 4.3 : DELETE DATA through view
			=> SECTION 05: RETREIVE DATA USING FUNCTION(SCALAR, SIMPLE TABLE VALUED, MULTISTATEMENT TABLE VALUED)
			=> SECTION 06: TEST TRIGGER (FOR/AFTER TRIGGER ON TABLE, INSTEAD OF TRIGGER ON TABLE & VIEW)
			=> SECTION 07: QUERY
				SUB SECTION => 7.01 : SELECT FROM TABLE
				SUB SECTION => 7.02 : SELECT FROM VIEW
				SUB SECTION => 7.03 : SELECT INTO
				SUB SECTION => 7.04 : IMPLICIT JOIN WITH WHERE BY CLAUSE, ORDER BY CLAUSE
				SUB SECTION => 7.05 : INNER JOIN WITH GROUP BY CLAUSE
				SUB SECTION => 7.06 : OUTER JOIN
				SUB SECTION => 7.07 : CROSS JOIN
				SUB SECTION => 7.08 : TOP CLAUSE WITH TIES
				SUB SECTION => 7.09 : DISTINCT
				SUB SECTION => 7.10 : COMPARISON, LOGICAL(AND OR NOT) & BETWEEN OPERATOR
				SUB SECTION => 7.11 : LIKE, IN, NOT IN, OPERATOR & IS NULL CLAUSE
				SUB SECTION => 7.12 : OFFSET FETCH
				SUB SECTION => 7.13 : UNION
				SUB SECTION => 7.14 : EXCEPT INTERSECT
				SUB SECTION => 7.15 : AGGREGATE FUNCTIONS
				SUB SECTION => 7.16 : GROUP BY & HAVING CLAUSE
				SUB SECTION => 7.17 : ROLLUP & CUBE OPERATOR
				SUB SECTION => 7.18 : GROUPING SETS
				SUB SECTION => 7.19 : SUB-QUERIES (INNER, CORRELATED)
				SUB SECTION => 7.20 : EXISTS
				SUB SECTION => 7.21 : CTE
				SUB SECTION => 7.22 : MERGE
				SUB SECTION => 7.23 : BUILT IN FUNCTION
				SUB SECTION => 7.24 : CASE
				SUB SECTION => 7.25 : IIF
				SUB SECTION => 7.26 : COALESCE & ISNULL
				SUB SECTION => 7.27 : WHILE
				SUB SECTION => 7.28 : GROPING FUNCTION
				SUB SECTION => 7.29 : RANKING FUNCTION
				SUB SECTION => 7.30 : IF ELSE & PRINT
				SUB SECTION => 7.31 : TRY CATCH
				SUB SECTION => 7.32 : GOTO
				SUB SECTION => 7.33 : WAITFOR
				SUB SECTION => 7.34 : sp_helptext
				SUB SECTION => 7.35 : TRANSACTION WITH SAVE POINT
*/


/*
								 SECTION 01 
					INSERT DATA USING INSERT INTO KEYWORD

*/

USE SMS 
GO

INSERT INTO gender VALUES('Male'),('Female')
GO
SELECT * FROM gender
GO
INSERT INTO religion VALUES ('Islam'), ('Hinduism'), ('Buddhism'), ('Christianity')
GO
SELECT * FROM religion
GO
INSERT INTO country VALUES('Bangladesh'),('India'),('Pakistan'),('China'),('Japan'),('Indonesia'),('Malaysia'),('Qatar')
GO
SELECT * FROM country
GO
INSERT INTO city VALUES('Dhaka'),('Delhi'),('Islamabad'),('Beijing'),('Tokyo'),('Zakarta'),('Kualalampur'),('Doha')
GO
SELECT * FROM city
GO
INSERT INTO maritalStatus VALUES ('Single'), ('Married'), ('Divorced')
GO
SELECT * FROM maritalStatus
GO
INSERT INTO productCategory VALUES ('INPUT DEVICES'),('Processing DEVICES'),('Storage DEVICES'),('Communication DEVICES'),('OUTPUT DEVICES')
GO
SELECT * FROM productCategory
GO
INSERT INTO Designation VALUES('SALES EXECUTIVE'),('MANAGER'),('CASHIER'),('COMPUTER OPERATOR'),('PRODUCTION MANAGER'),('DELIVERY MAN'),('MARKETING MANAGER'),
('ASSISTANT MANAGER'),('CEO'),('ADMIN'),('HRM')
GO
SELECT * FROM Designation
GO
INSERT INTO Education VALUES ('SSC'),('HSC'),('DIPLOMA'),('BSc'),('MSc'),('HONOURS'),('PHD')
GO
SELECT * FROM Education
GO
INSERT INTO ProductUser VALUES ('MENS'),('WOMAN'),('BABY'),('INDUSTRIAL'),('MILITARY'),('EDUCATION'),('RESEARCHER'),('GOVERNMENT')
GO
SELECT * FROM ProductUser
GO
INSERT INTO BussinesType VALUES ('RETAIL'),('WHOLSALE'),('MANUFACTURER')
GO
SELECT * FROM BussinesType
GO
INSERT INTO department VALUES ('SALES'),('PRODUCTION'),('HRM'),('ADMIN')
GO
SELECT * FROM department
GO

--Insert data by specifying column name--

INSERT INTO Client ([name], shopName, shopLocation, bussinesTypeId, genderId, maritalStatusId, nid, email, phone, [address], cityId, countryId, website, 
bankAccountNo,religionId) 
VALUES ('ABUL HOSSAIN', 'MAYER DOA ENTERPRISE', 'Lalbagh, Dhaka', 2, 1, 1, 5874236545698,'abulhossain@gmail.com', 01715654640,'230, lalbagh',1,2),
('Rifat', 'Rifat ENTERPRISE', 'Motijheel, Dhaka', 1, 1, 2, 5874236545699,'rifat@gmail.com', 01715654641,'231, Motijheel',1,3),
('Kabul HOSSAIN', 'Israt ENTERPRISE', 'Motijheel Dhaka', 2, 1, 2, 5874236545691,'kabul@gmail.com', 01715654642,'232, Motijheel',1,4),
('mahim ', 'mahim ENTERPRISE', 'Paltan, Dhaka', 2, 1, 1, 5874236545697,'mahim@gmail.com', 01715654643,'233, Paltan',1,2),
('Rifatur ', 'Rifatur ENTERPRISE', 'Kakrail, Dhaka', 1, 1, 2, 5874236545694,'rifatur@gmail.com', 01715654644,'234, Kakrail',1,5),
('Sajib', 'Sajib ENTERPRISE', 'Shantinagar, Dhaka', 1, 1, 1, 5874236545691,'sajib@gmail.com', 01715654645,'235, Shantinagar',1,3),
('Yasin ', 'Yasin ENTERPRISE', 'Ghulshan, Dhaka', 2, 1, 2, 5874236545690,'yasin@gmail.com', 01715654646,'236, Ghulshan',1,4),
('Rayhan Firoz', 'Firoz ENTERPRISE', 'Banani, Dhaka', 2, 1, 1, 5874236545696,'firoz@gmail.com', 01715654647,'237, Banani',1,1),
('Khairuzzaman', 'Khairuzzaman ENTERPRISE', 'Mirpur DOHS, Dhaka', 1, 1, 1, 5874236545693,'Khairuzzaman@gmail.com', 01715654648,'238, Mirpur DOHS',1,2),
('Riyad', 'Riyad ENTERPRISE', 'Mohakhali DOHS, Dhaka', 1, 1, 3, 5874236545695,'riyad@gmail.com', 01715654649,'239, Mohakhali DOHS',1,1)

GO

--Insert data by column sequence--

INSERT INTO Employee VALUES
('Rifat', 'Shafayet', 'Jarina', 1, 1, 1, 1874236545699,'rifat@gmail.com', 01715654641,'1201, Uttara', 1, 1, '01258745632', 12000.00, 12-12-2012,'5214789632',1),
('Mahim', 'KARIM', 'ROJINA', 1, 2, 1, 2874236545690,'mahim@gmail.com', 01715654641,'1201, mohammodpur', 1, 1, '01258745632', 13000.00, 12-12-2013,'5214789632',2),
('Riyad', 'Rafayet', 'Acia', 1, 1, 1, 3874236545691,'riayd@gmail.com', 01715654641,'1201, motijheel', 1, 1, '01258745632', 14000.00, 12-12-2014,'5214789632',3),
('Mehedy', 'Kefayet', 'Asma', 1, 3, 1, 4874236545692,'mehedy@gmail.com', 01715654641,'1201, mohammodpur', 1, 1, '01258745632', 15000.00, 12-12-2011,'5214789632',1),
('Firoz', 'Harun', 'Hannah', 1, 1, 1, 5874236545693,'firoz@gmail.com', 01715654641,'1201, Uttara', 1, 1, '01258745632', 12000.00, 12-12-2012,'5214789632',4),
('Khairuzzaman', 'Jibon', 'Zakiya', 1, 2, 1, 6874236545694,'khairuzzama@gmail.com', 01715654641,'1201, motijheel', 1, 1, '01258745632', 14000.00, 12-12-2017,'5214789632',5)

GO

INSERT INTO supplier	VALUES
('HANIF', 'hanif enterprise', 'Islambagh' , 1, 1, 1, 1874236545688,'hanif@yahoo.com', 01715654651,'1201, islambagh', 1, 1, '01258745632',1),
 ('rasel', 'rasel enterprise', 'ghulistan' , 1, 1, 1, 1874236545688,'rasel@yahoo.com', 01715654651,'1201, ghulistan', 1, 1, '01258745632',1),
 ('shariff', 'shariff enterprise', 'bongshal' , 1, 1, 1, 1874236545688,'shariff@yahoo.com', 01715654651,'1201, bongshal', 1, 1, '01258745632',1),
 ('islam', 'islam enterprise', 'babubazar' , 1, 1, 1, 1874236545688,'islam@yahoo.com', 01715654651,'1201, babubazar', 1, 1, '01258745632',1),
 ('mijan', 'mijan enterprise', 'noyabazar' , 1, 1, 1, 1874236545688,'mijan@yahoo.com', 01715654651,'1201, noyabazar', 1, 1, '01258745632',1)
 GO

 INSERT INTO Manufacturer VALUES
('KAJOL', 'hanif enterprise', 'Islambagh' , 1, 1, 1, 1874236545688,'hanif@yahoo.com', 01715654651,'1201, islambagh', 1, 1, '01258745632',1),
 ('SALMAN', 'SALMAN enterprise', 'ghulistan' , 1, 1, 1, 1874236545688,'rasel@yahoo.com', 01715654651,'1201, ghulistan', 1, 1, '01258745632',1),
 ('AMIR', 'AMIR enterprise', 'bongshal' , 1, 1, 1, 1874236545688,'shariff@yahoo.com', 01715654651,'1201, bongshal', 1, 1, '01258745632',1),
 ('IMRAN', 'IMRAN enterprise', 'babubazar' , 1, 1, 1, 1874236545688,'islam@yahoo.com', 01715654651,'1201, babubazar', 1, 1, '01258745632',1),
 ('NAWAZ', 'NAWAZ enterprise', 'noyabazar' , 1, 1, 1, 1874236545688,'mijan@yahoo.com', 01715654651,'1201, noyabazar', 1, 1, '01258745632',1)
 GO

 INSERT INTO product  	
VALUES
('KEYBOARD',1200.00, 500, 1, 'ARTIFICIAL', 1, 1, 12, '12-12-2012', 500.00, 500, 0.15),
('MOUSE',550.00, 500, 1, 'ARTIFICIAL', 1, 1, 12, '12-12-2013', 500.00, 500, 0.15),
('SSD 256GB',4000.00, 500, 1, 'ARTIFICIAL', 1, 1, 12, '12-12-2013', 500.00, 500, 0.15),
('SCANNER',7000.00, 500, 1, 'ARTIFICIAL', 1, 1, 12, '12-12-2014', 500.00, 500, 0.15),
('MONITOR',10000.00, 500, 1, 'ARTIFICIAL', 1, 1, 12, '12-12-2015', 500.00, 500, 0.15),
('FLASH DRIVE',500.00, 500, 1, 'ARTIFICIAL', 1, 1, 12, '12-12-2016', 500.00, 500, 0.15)
GO

--INSERT DATA THROUGH STORED PROCEDURE WITH AN OUTPUT PARAMETER--

DECLARE @EmployeeId INT
EXEC spInsertEmployee 'Ramzan Ali', 'Amjad Ali', 'Kajol', 1, 1, 1, '1989646464', 'ramzan@gmail.com', '01779852333','184 Blackpool Dr', 
5,1,'56357433921',1, 20000.00, '12.12.2012', 1, @EmployeeId OUTPUT
PRINT 'The new instructor ID is : '+ str(@EmployeeId)
GO


--INSERT DATA USING SEQUENCE VALUE--
INSERT INTO Comments VALUES((NEXT VALUE FOR seqNum), NULL)
GO
SELECT * FROM Comments
GO

/*
								  SECTION 04  
					INSERT UPDATE DELETE DATA THROUGH VIEW
*/

SELECT * FROM VW_ProductInfo
GO

INSERT INTO VW_ProductInfo(productId,productName, unitPrice) VALUES(11, 5, .05)
INSERT INTO VW_ProductInfo(productId,productName, unitPrice) VALUES(9, 10, .02)
INSERT INTO VW_ProductInfo(productId,productName, unitPrice) VALUES(13, 3, .10)
GO
SELECT * FROM VW_ProductInfo
GO

/*
								 SECTION 05  
						RETREIVE DATA USING FUNCTION

*/

-- A Scalar Function to get monthly total net sales using two parameter @year & @month
SELECT dbo.fnCurrentYearSales() AS 'Currrent Year Net Sale'
GO

-- A Inline Table Valued Function to get monthly total sales, discount & net sales using two parameter @year & @month
SELECT * FROM dbo.fnMonthlyProductSales (2012, 12)
GO


-- A Multi Statement Table Valued Function to get monthly net sales using two parameter @year & @month
SELECT * FROM dbo.fnMonthlySalesDetails (2012, 12)
GO


 -- SELECT INTO > SAVE RESULT SET TO A NEW TEMPORARY TABLE

SELECT * INTO #tmpProduct
FROM product
GO

--  IMPLICIT JOIN WITH WHERE BY CLAUSE, ORDER BY CLAUSE 

-- GET DESIGNATION UNDER DEPARTMENT
SELECT designationId, deptName FROM  designation, department
WHERE designation.designationId = department.deptId
ORDER BY deptId ASC, designationId DESC
GO


--- INNER JOIN WITH GROUP BY CLAUSE --

-- GET SEMESTERWISE TRAINEE LIST
SELECT p.productName, COUNT(p.productUserId) AS Students FROM product p
INNER JOIN productCategory pc ON pc.categoryId= p.productId
INNER JOIN ProductUser pu ON pc.categoryId = pu.id
GROUP BY p.productId
GO

 -- COMPARISON, LOGICAL(AND OR NOT) & BETWEEN OPERATOR --

SELECT * FROM Employee
WHERE maritalStatusId = 1
AND joiningDate BETWEEN '1996-01-01' AND '1997-12-10'
AND NOT cityId = 4
AND currentSalary > 14000
OR cityId = 2
GO

--- LIKE, IN, NOT IN, OPERATOR & IS NULL CLAUSE ---

SELECT * FROM Employee
WHERE name LIKE '%n'
AND cityId NOT IN ('1' ,'2')
AND drivingLicense IS NULL
GO

---OFFSET FETCH ---

-- OFFSET 5 ROWS
SELECT * FROM Employee
ORDER BY id
OFFSET 5 ROWS
GO

-- OFFSET 10 ROWS AND GET NEXT 5 ROWS

SELECT * FROM Employee
ORDER BY id
OFFSET 10 ROWS
FETCH NEXT 5 ROWS ONLY
GO

----- UNION ---

SELECT * FROM employee
WHERE cityId IN ('1', '2', '3')

UNION

SELECT * FROM employee
WHERE cityId IN ('4', '5', '6')
GO

---- EXCEPT INTERSECT ----

-- EXCEPT
SELECT * FROM employee

EXCEPT

SELECT * FROM employee
WHERE genderId = 2
GO

----INTERSECT--

SELECT * FROM product
WHERE productId > 10

INTERSECT

SELECT * FROM product
WHERE productId > 15
GO


---- AGGREGATE FUNCTION ----

SELECT	COUNT(*) 'Total Sales Count',
		SUM(netSales) 'Total Net Sale',
		AVG(netSales) 'Average Net Sale',
		MIN(unitPrice) 'MIN Unit Price',
		(MAX(discount))*100 'MAX Discount %'
FROM product
GO

-- AGGREGATE FUNCTION WITH GROUP BY & HAVING CLAUSE--

SELECT product.discount, count(product.productid) 'Total', SUM(netSales) 'NET SALES' FROM product
INNER JOIN productCategory ON product.productId = productCategory.categoryId
GROUP BY productCategory.categoryName
HAVING SUM(netSales) > 50000
GO

--- SUB-QUERIES--


--A subquery to findout Employee who have not Joined yet

SELECT [name], nid, email, phone, [address] FROM Employee
WHERE id NOT IN (SELECT id FROM Employee)
ORDER BY [name]
GO

--- EXISTS ---

SELECT [name], nid, email, phone, [address] FROM Employee
WHERE NOT EXISTS 
			(SELECT * FROM product
				WHERE product.productId = Employee.id)
GO

--- MERGE ---

SELECT * FROM Comments
SELECT * FROM Comments
GO

MERGE Comments AS SOURCE
USING Comments AS TARGET
ON SOURCE.commentId = TARGET.commentId
WHEN MATCHED THEN
				UPDATE SET
				commentId = SOURCE.commentId,
				comment = SOURCE.comment;
GO

--- BUILT IN FUNCTION ---

-- Get current date and time
SELECT GETDATE()
GO

-- GET STRING LENGTH
SELECT Id, LEN([name]) 'Name Length' FROM employee
GO

-- CONVERT DATA USING CAST()
SELECT CAST(1500 AS decimal(17,2)) AS DecimalNumber
GO

-- CONVERT DATA USING CONVERT()
DECLARE @currTime DATETIME = GETDATE()
SELECT CONVERT(VARCHAR, @currTime, 108) AS ConvertToTime
GO

-- CONVERT DATA USING TRY_CONVERT()
SELECT TRY_CONVERT(FLOAT, 'HELLO', 1) AS ReturnNull
GO

-- GET DIFFERENCE OF DATES
SELECT DATEDIFF(DAY, '2021-01-01', '2022-01-01') AS DAYinYear
GO

-- GET A MONTH NAME
SELECT DATENAME(MONTH, GETDATE()) AS 'Month'
GO

--- WHILE ---

	DECLARE @counter int
	SET @counter = 0

	WHILE @counter < 20

	BEGIN
	  SET @counter = @counter + 1
	  INSERT INTO Comments(commentId, comment) VALUES((NEXT VALUE FOR [dbo].seqNum), NULL)
	END

	SELECT * FROM Comments
GO

---RANKING FUNCTION --

SELECT 
RANK() OVER(ORDER BY productid) AS 'Rank',
DENSE_RANK() OVER(ORDER BY productid) AS 'Dense_Rank',
NTILE(3) OVER(ORDER BY netSales) AS 'NTILE',
productId,
productId, 
netSales
FROM product
GO

--============== IF ELSE & PRINT ============--

DECLARE @totalSales MONEY
SELECT @totalSales = SUM((netSales))
FROM product
WHERE YEAR(product.soldDate) = YEAR(GETDATE())
IF @totalSales > 1000000
	BEGIN
		PRINT 'Great ! The sales is greater than target in this year !!'
	END
ELSE
	BEGIN
		PRINT 'Didn''t Reached the goal !'
	END
GO