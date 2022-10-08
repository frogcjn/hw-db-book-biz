SET NAMES UTF8MB4;
SET character_set_client = UTF8MB4;

/*
    Check if database exists, if yes drop database, create database
*/

DROP DATABASE IF EXISTS `book_business`;
CREATE DATABASE IF NOT EXISTS `book_business`; 
USE `book_business`;

-- Publishers

DROP TABLE IF EXISTS `Publihsers`;
CREATE TABLE `Publishers` (

	`PublisherID` 	INT				NOT NULL AUTO_INCREMENT,			
	`Name`			VARCHAR(100)    NOT NULL,
	`Website`       VARCHAR(100)    NOT NULL,
	`Address`		VARCHAR(100)	NULL,	
	`Phone`			VARCHAR(24)		NULL,
	`Email`			VARCHAR(30)		NULL,

	PRIMARY KEY 		(`PublisherID`),
	INDEX `PublisherID` (`PublisherID` ASC), 
	INDEX `Name`		(`Name` ASC)
);

-- Books

DROP TABLE IF EXISTS `Books`;
CREATE TABLE `Books` (

	`BookID` 		INT 			NOT NULL AUTO_INCREMENT,
	`Name` 		    VARCHAR(100) 	NOT NULL,
	`Price` 		DECIMAL(10,2) 	NOT NULL,
	`Date` 		    DATE 			NULL,
	`PublisherID` 	INT 			NULL,

	PRIMARY KEY 	(`BookID`),
	INDEX `BookID` 	(`BookID` ASC), 
	INDEX `Name` 	(`Name` ASC),

	FOREIGN KEY 	(`PublisherID`) REFERENCES `Publishers`(`PublisherID`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci; 


-- Authors

DROP TABLE IF EXISTS `Authors`;
CREATE TABLE `Authors` (

	`AuthorID` 	INT 			NOT NULL AUTO_INCREMENT,	
	`Name` 		VARCHAR(100) 	NOT NULL,
	`Address`	VARCHAR(100) 	NULL,
	`Phone`		VARCHAR(24)		NULL,
	`Email`		VARCHAR(30)		NULL,

	PRIMARY KEY 		(`AuthorID`),
	INDEX `AuthorID`	(`AuthorID` ASC), 
	INDEX `Name`		(`Name` ASC)
);

-- Editors

DROP TABLE IF EXISTS `Editors`;
CREATE TABLE `Editors` (

	`EditorID` 	INT 			NOT NULL AUTO_INCREMENT,	
	`Name` 		VARCHAR(100) 	NOT NULL,
	`Address`	VARCHAR(100) 	NULL,
	`Phone`		VARCHAR(24)		NULL,
	`Email`		VARCHAR(30)		NULL,

	PRIMARY KEY (`EditorID`),
	INDEX `EditorID`	(`EditorID` ASC), 
	INDEX `Name`		(`Name` ASC)
);

-- Genre

DROP TABLE IF EXISTS `Genres`;
CREATE TABLE `Genres` (

	`GenreID` 	INT 		 NOT NULL AUTO_INCREMENT,	
	`Name` 		VARCHAR(100) NOT NULL,

	PRIMARY KEY 	(`GenreID`),
	INDEX `GenreID`	(`GenreID` ASC), 
	INDEX `Name`	(`Name` ASC),

	UNIQUE			(`Name`)
);

-- Customers

DROP TABLE IF EXISTS `Customers`;
CREATE TABLE `Customers` (

	`CustomerID` 	INT 			NOT NULL AUTO_INCREMENT,	
	`Name` 			VARCHAR(100) 	NOT NULL,
	`Address`		VARCHAR(100) 	NOT NULL,
	`Phone`			VARCHAR(24)		NOT NULL,
	`Email`			VARCHAR(30)		NOT NULL,

	PRIMARY KEY 		(`CustomerID`),
	INDEX `CustomerID`	(`CustomerID` ASC), 
	INDEX `Name`		(`Name` ASC),
	INDEX `Email`		(`Email` ASC),
	
	UNIQUE			(`Phone`)
);

-- Orders

DROP TABLE IF EXISTS `Orders`;
CREATE TABLE `Orders` (

	`OrderID`		INT NOT NULL AUTO_INCREMENT,	
	`CustomerID`	INT NOT NULL,
	`Date`          DATE NOT NULL,

	PRIMARY KEY		(`OrderID`),
	INDEX `Date`	(`Date` DESC)
);

-- BookAuthors

DROP TABLE IF EXISTS `BookAuthors`;
CREATE TABLE `BookAuthors`(
    `BookID`	INT NOT NULL, 
    `AuthorID`	INT NOT NULL, 
	`Royalties` DECIMAL(10,2) NOT NULL,
	PRIMARY KEY (`BookID`, `AuthorID`),
	FOREIGN KEY 	(`BookID`)		REFERENCES `Books`(`BookID`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	FOREIGN KEY 	(`AuthorID`)	REFERENCES `Authors`(`AuthorID`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

-- BookEditors

DROP TABLE IF EXISTS `BookEditors`;
CREATE TABLE `BookEditors`(
    `BookID`	INT NOT NULL, 
    `EditorID`	INT NOT NULL, 
	PRIMARY KEY (`BookID`, `EditorID`),
	FOREIGN KEY 	(`BookID`)		REFERENCES `Books`(`BookID`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	FOREIGN KEY 	(`EditorID`)	REFERENCES `Editors`(`EditorID`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

-- BookGenres

DROP TABLE IF EXISTS `BookGenres`;
CREATE TABLE `BookGenres`(
    `BookID`	INT NOT NULL, 
    `GenreID`	INT NOT NULL, 
	PRIMARY KEY (`BookID`, `GenreID`),
	FOREIGN KEY 	(`BookID`)	REFERENCES `Books`(`BookID`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	FOREIGN KEY 	(`GenreID`)	REFERENCES `Genres`(`GenreID`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

-- BookOrders

DROP TABLE IF EXISTS `BookOrders`;
CREATE TABLE `BookOrders`(
    `BookID`	INT NOT NULL, 
    `OrderID`	INT NOT NULL, 
	`Amount`	INT NOT NULL,
	PRIMARY KEY (`BookID`, `OrderID`),
	FOREIGN KEY 	(`BookID`)	REFERENCES `Books`(`BookID`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	FOREIGN KEY 	(`OrderID`)	REFERENCES `Orders`(`OrderID`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);
