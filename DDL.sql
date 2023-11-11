/*
					SQL Project Name : Stock Management System (SMS)
							    Trainee Name : Abdur Razzak Rayhan  
						    	  Trainee ID : 1278824     
							Batch ID : WADA/PNTL-A/56/01 

 --------------------------------------------------------------------------------

Table of Contents: DDL
			=> SECTION 01: Created a Database [SMS]
			=> SECTION 02: Created Appropriate Tables with column definition related to the project
			=> SECTION 03: ALTER, DROP AND MODIFY TABLES & COLUMNS
			=> SECTION 04: CREATE CLUSTERED AND NONCLUSTERED INDEX
			=> SECTION 05: CREATE SEQUENCE & ALTER SEQUENCE
			=> SECTION 06: CREATE A VIEW & ALTER VIEW
			=> SECTION 07: CREATE STORED PROCEDURE & ALTER STORED PROCEDURE
			=> SECTION 08: CREATE FUNCTION(SCALAR, SIMPLE TABLE VALUED, MULTISTATEMENT TABLE VALUED) & ALTER FUNCTION
			=> SECTION 09: CREATE TRIGGER (FOR/AFTER TRIGGER)
			=> SECTION 10: CREATE TRIGGER (INSTEAD OF TRIGGER)
*/
/*
==============================  SECTION 01  ==============================
	   CHECK DATABASE EXISTANCE & CREATE DATABASE WITH ATTRIBUTES
==========================================================================
*/

USE SMS
GO

IF DB_ID('SMS') IS NOT NULL
DROP DATABASE SMS
GO

CREATE DATABASE SMS
ON
(
	[name] = 'sms_data',
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\sms_data.mdf',
	size = 5MB,
	maxsize = 50MB,
	filegrowth = 5%
)
LOG ON
(
	[name] = 'sms_log',
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\sms_log.ldf',
	size = 8MB,
	maxsize = 40MB,
	filegrowth = 5MB
)
GO
/*
==============================  SECTION 02  ==============================
		          CREATE TABLES WITH COLUMN DEFINITION 
==========================================================================
*/

--============== Table with IDENTITY, PRIMARY KEY & nullability CONSTRAINT... ============--
-- USE SCHEMA
CREATE TABLE gender
(
	genderId		INT IDENTITY PRIMARY KEY,
	genderTitle		CHAR(10) NOT NULL
)
GO
CREATE TABLE religion
(
	religionId		INT IDENTITY PRIMARY KEY,
	religionTitle	CHAR(15) NOT NULL
)
GO
CREATE TABLE country
(
	countryId		INT IDENTITY PRIMARY KEY,
	countryName		CHAR(15) NOT NULL
)
GO
CREATE TABLE city
(
	cityid		INT IDENTITY PRIMARY KEY,
	cityname	CHAR(15) NOT NULL,
)
GO
CREATE TABLE maritalStatus
(
	maritalStatusId		INT IDENTITY PRIMARY KEY,
	[status]			VARCHAR(10) NOT NULL
)
GO
CREATE TABLE productCategory
(
	categoryId		INT IDENTITY PRIMARY KEY,
	categoryName	VARCHAR(40) NOT NULL,
)
GO
CREATE TABLE Designation
(
	designationId	INT IDENTITY PRIMARY KEY,
	[name]			VARCHAR(40) NOT NULL,
)
GO
CREATE TABLE Education
(
	id					INT IDENTITY PRIMARY KEY,
	nameOfEducation		VARCHAR(40) NOT NULL

)
GO
CREATE TABLE ProductUser
(
	id			INT IDENTITY PRIMARY KEY,
	[name]		VARCHAR(40) NOT NULL,

)
GO
CREATE TABLE BussinesType
(
	bussinesTypeId	INT IDENTITY PRIMARY KEY,
	[name]			VARCHAR(40) NOT NULL,

)
GO
CREATE TABLE department
(
	deptId		INT IDENTITY PRIMARY KEY,
	deptName	VARCHAR(40) NOT NULL,

)
GO
CREATE TABLE Comments
(
	commentId INT,
	comment NVARCHAR(100) NULL
)
GO

--============== Table with PRIMARY KEY & FOREIGN KEY & CONSTRAINTS... ============--
CREATE TABLE Client
(
	id					INT IDENTITY PRIMARY KEY,
	[name]				VARCHAR(50) NOT NULL,
	shopName			VARCHAR (50) NOT NULL,
	shopLocation		VARCHAR (50) NOT NULL,
	bussinesTypeId		INT REFERENCES BussinesType(bussinesTypeId),
	genderId			INT REFERENCES gender(genderId),
	maritalStatusId		INT REFERENCES maritalStatus(maritalStatusId),
	nid					CHAR(10) UNIQUE CHECK(nid LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	email				VARCHAR(40) UNIQUE CONSTRAINT ck_email CHECK (email LIKE '%@%' ),
	phone				CHAR(20) UNIQUE CHECK(phone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	[address]			VARCHAR(70) NOT NULL,
	cityId				INT REFERENCES city(cityId),
	countryId			INT REFERENCES country(countryId),
	website				VARCHAR(30) NULL,
	bankAccountNo		VARCHAR (40) NULL,
	religionId			INT REFERENCES religion (religionId)
)
GO
CREATE TABLE Employee
(
	id					INT IDENTITY PRIMARY KEY,
	[name]				VARCHAR(50) NOT NULL,
	fatherName			VARCHAR (50) NOT NULL,
	motherName			VARCHAR (50) NOT NULL,
	genderId			INT REFERENCES gender(genderId),
	maritalStatusId		INT REFERENCES maritalStatus(maritalStatusId),
	religionId			INT REFERENCES religion (religionId),
	nid					CHAR(10) UNIQUE CHECK(nid LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	email				VARCHAR(40) UNIQUE CONSTRAINT ck_email CHECK (email LIKE '%@%' ),
	phone				CHAR(20) UNIQUE CHECK(phone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	[address]			VARCHAR(70) NOT NULL,
	cityId				INT REFERENCES city(cityId),
	countryId			INT REFERENCES country(countryId),
	website				VARCHAR(30) NULL,
	bankAccountNo		VARCHAR (40) NULL,
	departmentId		INT REFERENCES department (deptId),
	currentSalary		MONEY DEFAULT 0.00,
	joiningDate			DATE NULL,
	passportNo			VARCHAR (50) NULL,
	drivingLicense		VARCHAR (50) NULL,
	designationId		INT REFERENCES Designation (designationId)
)
GO
CREATE TABLE supplier
(
	id					INT IDENTITY PRIMARY KEY,
	[name]				VARCHAR(50) NOT NULL,
	shopName			VARCHAR (50) NOT NULL,
	shopLocation		VARCHAR (50) NOT NULL,
	bussinesTypeId		INT REFERENCES BussinesType(bussinesTypeId),
	genderId			INT REFERENCES gender(genderId),
	maritalStatusId		INT REFERENCES maritalStatus(maritalStatusId),
	nid					CHAR(10) UNIQUE CHECK(nid LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	email				VARCHAR(40) UNIQUE CONSTRAINT ck_email CHECK (email LIKE '%@%' ),
	phone				CHAR(20) UNIQUE CHECK(phone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	[address]			VARCHAR(70) NOT NULL,
	cityId				INT REFERENCES city(cityId),
	countryId			INT REFERENCES country(countryId),
	website				VARCHAR(30) NULL,
	bankAccountNo		VARCHAR (40) NULL,
	religionId			INT REFERENCES religion (religionId)
)
GO

CREATE TABLE Manufacturer
(
	id					INT IDENTITY PRIMARY KEY,
	[name]				VARCHAR(50) NOT NULL,
	companyName			VARCHAR (50) NOT NULL,
	factoryLocation		VARCHAR (50) NOT NULL,
	products			VARCHAR (50) NOT NULL,
	genderId			INT REFERENCES gender(genderId),
	maritalStatusId		INT REFERENCES maritalStatus(maritalStatusId),
	nid					CHAR(10) UNIQUE CHECK(nid LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	email				VARCHAR(40) UNIQUE CONSTRAINT ck_email CHECK (email LIKE '%@%' ),
	phone				CHAR(20) UNIQUE CHECK(phone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	[address]			VARCHAR(70) NOT NULL,
	cityId				INT REFERENCES city(cityId),
	countryId			INT REFERENCES country(countryId),
	website				VARCHAR(30) NULL,
	bankAccountNo		VARCHAR (40) NULL,
	religionId			INT REFERENCES religion (religionId)
)
GO
CREATE TABLE product
(
	productId			INT IDENTITY PRIMARY KEY,
	productName			VARCHAR(40) NOT NULL,
	unitPrice			MONEY NOT NULL,
	stock				INT DEFAULT 0,
	categoryId			INT REFERENCES productCategory (categoryId),
	productMaterial		VARCHAR (50) NOT NULL,
	manufacturerId		INT REFERENCES Manufacturer (id),
	supplierId			INT REFERENCES supplier (id),
	productSize			INT NULL,
	productUserId		INT REFERENCES ProductUser (id),
	soldDate			DATE ,
	netSales			INT,
	quantity			INT,
	discount			FLOAT 
)
GO
/*
==============================  SECTION 03  ==============================
		          ALTER, DROP AND MODIFY TABLES & COLUMNS
==========================================================================
*/
--============== Update column definition ============--

ALTER TABLE product
ALTER COLUMN productMaterial CHAR(10) NOT NULL
GO

--============== ADD column with DEFAULT CONSTRAINT ============--

ALTER TABLE product
ADD unitPrice MONEY DEFAULT 0.00
GO

--============== DROP COLUMN ============--

ALTER TABLE product
DROP COLUMN productSize
GO

/*
==============================  SECTION 04  ==============================
		          CREATE CLUSTERED AND NONCLUSTERED INDEX
==========================================================================
*/

-- Clustered Index
CREATE CLUSTERED INDEX IX_tblComments
ON Comments
(
	commentId
)
GO

-- Nonclustered Index
CREATE UNIQUE NONCLUSTERED INDEX IX_nonClustered
ON employee
(
	nid,
	phone
)
GO

/*
==============================  SECTION 05  ==============================
							 CREATE SEQUENCE
==========================================================================
*/

CREATE SEQUENCE seqNum
	AS INT
	START WITH 1000
	INCREMENT BY 10
	MINVALUE 0
	MAXVALUE 200
	CYCLE
	CACHE 10
GO

--============== ALTER SEQUENCE ============--

ALTER SEQUENCE seqNum
	MAXVALUE 180
	CYCLE
	CACHE 8
GO
/*
==============================  SECTION 06  ==============================
							  CREATE A VIEW
==========================================================================
*/

CREATE VIEW VW_ProductInfo
AS
SELECT productId, productName, unitPrice, stock FROM product
GO
-- VIEW WITH ENCRYPTION, SCHEMABINDING & WITH CHECK OPTION
CREATE VIEW VW_TodayProductSales
WITH SCHEMABINDING, ENCRYPTION
AS
SELECT productId, productName, productMaterial, soldDate FROM dbo.product
WHERE CONVERT(DATE, soldDate) = CONVERT(DATE, GETDATE())
WITH CHECK OPTION
GO
/*
							SECTION 07  
						 STORED PROCEDURE

*/
----- STORED PROCEDURE FOR INSERT DATA USING PARAMETER ------
CREATE PROCEDURE spInsertEmployee	(
									@id					INT ,
									@[name]				VARCHAR (50),
									@fatherName			VARCHAR (50),
									@motherName			VARCHAR (50),
									@genderId			INT,
									@maritalStatusId	INT ,
									@religionId			INT ,
									@nid				CHAR (10),
									@email				VARCHAR (40),
									@phone				CHAR (20),
									@[address]			VARCHAR(70),
									@cityId				INT ,
									@countryId			INT ,
									@website			VARCHAR(30),
									@bankAccountNo		VARCHAR (40) ,
									@departmentId		INT ,
									@currentSalary		MONEY ,
									@joiningDate		DATE ,
									@passportNo			VARCHAR (50) ,
									@drivingLicense		VARCHAR (50) ,
									@designationId		INT 
									)

AS
BEGIN
	INSERT INTO Employee([name], fatherName, motherName, genderId, maritalStatusId, religionId, nid, email, phone, [address], 
	cityId, countryId, website, bankAccountNo, departmentId, currentSalary, joiningDate,passportNo,drivingLicense,designationId) 
	VALUES(@id, @name, @fatherName, @motherName, @genderId, @maritalStatusId, @religionId, @nid, @email, @phone, 
	 @address, @cityId, @countryId, @website, @bankAccountNo, @departmentId, @currentSalary, @joiningDate, @passportNo, @drivingLicense,
	 @designationId )


END
GO
---STORED PROCEDURE FOR INSERT DATA WITH OUTPUR PARAMETER---
CREATE PROCEDURE spInsertEmployee	(
									@id					INT ,
									@[name]				VARCHAR (50),
									@fatherName			VARCHAR (50),
									@motherName			VARCHAR (50),
									@genderId			INT,
									@maritalStatusId	INT ,
									@religionId			INT ,
									@nid				CHAR (10),
									@email				VARCHAR (40),
									@phone				CHAR (20),
									@[address]			VARCHAR(70),
									@cityId				INT ,
									@countryId			INT ,
									@website			VARCHAR(30),
									@bankAccountNo		VARCHAR (40) ,
									@departmentId		INT ,
									@currentSalary		MONEY ,
									@joiningDate		DATE ,
									@passportNo			VARCHAR (50) ,
									@drivingLicense		VARCHAR (50) ,
									@designationId		INT 
									)

AS
BEGIN
	INSERT INTO Employee([name], fatherName, motherName, genderId, maritalStatusId, religionId, nid, email, phone, [address], 
	cityId, countryId, website, bankAccountNo, departmentId, currentSalary, joiningDate,passportNo,drivingLicense,designationId) 
	VALUES(@id, @name, @fatherName, @motherName, @genderId, @maritalStatusId, @religionId, @nid, @email, @phone, 
	 @address, @cityId, @countryId, @website, @bankAccountNo, @departmentId, @currentSalary, @joiningDate, @passportNo, @drivingLicense,
	 @designationId )
	SELECT @id = IDENT_CURRENT('Employee')
END
GO

----- STORED PROCEDURE FOR UPDATE TABLE DATA-----
CREATE PROCEDURE spUpdateEmployee	@EmployeeId INT,
									@joiningDate DATE
AS
BEGIN
	UPDATE Employee
	SET
	joiningDate = @joiningDate
	WHERE Id = @EmployeeId
END
GO

----- STORED PROCEDURE FOR DELETE TABLE DATA-----

CREATE PROCEDURE spDeleteEmployee	@EmployeeId INT,
									@joiningDate DATE
AS
BEGIN
	DELETE FROM Employee
	SET 
	joiningDate = @joiningDate
	WHERE Id = @EmployeeId
END
GO

----- TRY CATCH IN A STORED PROCEDURE & RAISERROR WITH ERROR NUMBER AND ERROR MESSAGE-----

CREATE PROCEDURE spRaisError
AS
BEGIN
	BEGIN TRY
		DELETE FROM product
	END TRY
	BEGIN CATCH
		DECLARE @Error VARCHAR(200) = 'Error' + CONVERT(varchar, ERROR_NUMBER(), 1) + ' : ' + ERROR_MESSAGE()
		RAISERROR(@Error, 1, 1)
	END CATCH
END
GO

------ALTER STORED PROCEDURE-----

ALTER PROCEDURE spUpdateEmployee @Id INT,
								 @joiningDate DATE
AS
BEGIN
	UPDATE Employee
	SET
	joiningDate = @joiningDate
	WHERE Id = @Id
END
GO

/*
								SECTION 08  
								 FUNCTION

*/

CREATE FUNCTION fnCurrentYearSales()
RETURNS MONEY
AS
BEGIN
	DECLARE @totalSales MONEY

	SELECT @totalSales = SUM((netSales))
	FROM product
	WHERE YEAR(product.soldDate) = YEAR(GETDATE())

	RETURN @totalSales
END
GO

-----AN AFTER/FOR TRIGGER FOR INSERT, UPDATE, DELETE

CREATE TRIGGER trProductStockManage
ON product
FOR INSERT, UPDATE, DELETE
AS
	BEGIN
		DECLARE @pid INT
		DECLARE @qty INT
				-- Check if this trigger is executed only for updated
				IF (EXISTS(SELECT * FROM INSERTED) AND EXISTS(SELECT * FROM DELETED))
					BEGIN
						UPDATE product
						SET stock = (CASE
										WHEN i.quantity > d.quantity THEN stock - (i.quantity-d.quantity)
										WHEN i.quantity < d.quantity THEN stock + (d.quantity-i.quantity)
										ELSE i.quantity
									END)
						FROM inserted As i
						INNER JOIN deleted AS d
						ON i.productId = d.productId
						WHERE Product.productId = i.productId
						PRINT 'Stock updated via modified sales entry'
					END
				--Check if this trigger is for only for inserted
				ELSE IF (EXISTS(SELECT * FROM INSERTED) AND NOT EXISTS(SELECT * FROM DELETED))
					BEGIN
						SELECT
						@pid = productid,
						@qty = quantity
						FROM inserted

						UPDATE Product
						SET stock = stock - @qty
						WHERE productId = @pid
						PRINT 'Stock updated via new sales'
					END
				-- Check if this trigger is executed only for deleted
				ELSE IF (EXISTS(SELECT * FROM DELETED) AND NOT EXISTS(SELECT * FROM INSERTED))
					BEGIN
						SELECT
						@pid = productid,
						@qty = quantity
						FROM deleted

						UPDATE Product
						SET stock = stock + @qty
						WHERE productId = @pid
						PRINT 'Stock updated due to deleted sales id'
					END
				-- If not match any condition then rollback the transaction
				ELSE ROLLBACK TRANSACTION
		END
GO

/*
								SECTION 10  
							INSTEAD OF TRIGGER

*/


CREATE TRIGGER trProductSales
ON product
INSTEAD OF INSERT
AS
BEGIN
	IF ((SELECT COUNT(*) FROM inserted) > 0)
		BEGIN
			INSERT INTO product(productId, productName,categoryId, unitPrice, discount)
			SELECT
			i.productId,
			i.unitPrice,
			product.unitPrice
			from inserted i
			INNER JOIN product ON product.productId = i.productId
		END
	ELSE
	BEGIN
		PRINT 'Error Occured for Inserting Data Into product Table !'
	END
END
GO



