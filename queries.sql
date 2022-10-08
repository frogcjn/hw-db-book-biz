USE `book_business`;

-- 1. Books per author. 
SELECT  `Authors`.`Name` AS `Author`, COUNT(`BookAuthors`.`BookID`) AS `Book Count`, GROUP_CONCAT(DISTINCT `Books`.`Name` SEPARATOR ';\n') AS `Book Names` 
    FROM `Books` 
    LEFT JOIN `BookAuthors` ON `BookAuthors`.`BookID` = `Books`.`BookID`
    LEFT JOIN `Authors` ON `Authors`.`AuthorID` = `BookAuthors`.`AuthorID`
GROUP BY `Authors`.`AuthorID`;

-- 7.2. Authors per book. 
SELECT  `Books`.`Name` AS `Book`, COUNT(`BookAuthors`.`AuthorID`) AS `Author Count`, GROUP_CONCAT(DISTINCT `Authors`.`Name` SEPARATOR ';\n') AS `Author Names` 
    FROM `Books` 
    LEFT JOIN `BookAuthors` ON `BookAuthors`.`BookID` = `Books`.`BookID`
    LEFT JOIN `Authors` ON `Authors`.`AuthorID` = `BookAuthors`.`AuthorID`
GROUP BY `Books`.`BookID`;


-- 7.3. Author royalties on a book. 
SELECT   `Books`.`Name` AS `Book`, SUM(`BookAuthors`.`Royalties`) AS `Total Royalties`
    FROM `Books` 
    LEFT JOIN `BookAuthors` ON `BookAuthors`.`BookID` = `Books`.`BookID`
    LEFT JOIN `Authors` ON `Authors`.`AuthorID` = `BookAuthors`.`AuthorID`
GROUP BY `Books`.`BookID`;


-- 7.4. Book royalties per author. 
SELECT  `Authors`.`Name` AS `Author`, SUM(`BookAuthors`.`Royalties`) AS `Total Royalties`
    FROM `Books` 
    LEFT JOIN `BookAuthors` ON `BookAuthors`.`BookID` = `Books`.`BookID`
    LEFT JOIN `Authors` ON `Authors`.`AuthorID` = `BookAuthors`.`AuthorID`
GROUP BY `Authors`.`AuthorID`;


-- 7.5. Books in a genre. 
SELECT  `Genres`.`Name` AS `Genre`, COUNT(`BookGenres`.`BookID`) AS `Book Count`, GROUP_CONCAT(DISTINCT `Books`.`Name` SEPARATOR ';\n') AS `Book Names` 
    FROM `Books` 
    LEFT JOIN `BookGenres` ON `BookGenres`.`BookID` = `Books`.`BookID`
    LEFT JOIN `Genres` ON `Genres`.`GenreId` = `BookGenres`.`GenreID`
GROUP BY `Genres`.`GenreID`;

-- 7.6. Books published by a publisher. 
SELECT  `Publishers`.`Name` AS `Publisher`, COUNT(`Books`.`BookID`) AS `Book Count`, GROUP_CONCAT(DISTINCT `Books`.`Name` SEPARATOR ';\n') AS `Book Names` 
    FROM `Books` 
    LEFT JOIN `Publishers` ON `Publishers`.`PublisherID` = `Books`.`PublisherID`
GROUP BY `Publishers`.`PublisherID`;

-- 7.7. Editors per book. 
SELECT  `Books`.`Name` AS `Book`, COUNT(`BookEditors`.`EditorID`) AS `Editor Count`, GROUP_CONCAT(DISTINCT `Editors`.`Name` SEPARATOR ';\n') AS `Editor Names` 
    FROM `BookEditors` 
    LEFT JOIN `Books` ON `Books`.`BookID` = `BookEditors`.`BookID`
    LEFT JOIN `Editors` ON `Editors`.`EditorID` = `BookEditors`.`EditorID`
GROUP BY `Books`.`BookID`;


-- 7.8. Books per editor. 
SELECT  `Editors`.`Name` AS `Editor`, COUNT(`BookEditors`.`BookID`) AS `Book Count`, GROUP_CONCAT(DISTINCT `Books`.`Name` SEPARATOR ';\n') AS `Book Names` 
    FROM `BookEditors` 
    LEFT JOIN `Books` ON `Books`.`BookID` = `BookEditors`.`BookID`
    LEFT JOIN `Editors` ON `Editors`.`EditorID` = `BookEditors`.`EditorID`
GROUP BY `Editors`.`EditorID`;


-- 7.9. Books in an order. 
SELECT  `Orders`.`OrderID` AS `OrderID`,  `Orders`.`Date` AS `Date`, SUM(`BookOrders`.`Amount`) AS `Total Book Count`, GROUP_CONCAT(CONCAT(`Books`.`Name`, ' x ', `BookOrders`.`Amount`) SEPARATOR ';\n') AS `Book Names` 
    FROM `BookOrders` 
    LEFT JOIN `Books` ON `Books`.`BookID` = `BookOrders`.`BookID`
    LEFT JOIN `Orders` ON `Orders`.`OrderID` = `BookOrders`.`OrderID`
GROUP BY `Orders`.`OrderID`;


-- 7.10. Orders for a book. 
SELECT  `Books`.`Name` AS `Book`, SUM(`BookOrders`.`Amount`) AS `Total Book Count`, GROUP_CONCAT(CONCAT('Order ID: ', `Orders`.`OrderID`, ', Order Amount: ', `BookOrders`.`Amount`,  ', Order Date: ', `Orders`.`Date`) SEPARATOR ';\n') AS `Order Details` 
    FROM `BookOrders` 
    LEFT JOIN `Books` ON `Books`.`BookID` = `BookOrders`.`BookID`
    LEFT JOIN `Orders` ON `Orders`.`OrderID` = `BookOrders`.`OrderID`
GROUP BY `Books`.`BookID`;

-- 7.11. Customer orders. 
SELECT   `Customers`.`Name` AS `Customer`, SUM(`BookOrders`.`Amount`) AS `Total Book Count`, `Orders`.`OrderID` AS `OrderID`,  `Orders`.`Date` AS 'Date', GROUP_CONCAT(CONCAT(`Books`.`Name`, ' x ', `BookOrders`.`Amount`) SEPARATOR ';\n') AS `Order Details` 
    FROM `BookOrders` 
    LEFT JOIN `Books` ON `Books`.`BookID` = `BookOrders`.`BookID`
    LEFT JOIN `Orders` ON `Orders`.`OrderID` = `BookOrders`.`OrderID`
    LEFT JOIN `Customers` ON `Customers`.`CustomerID` = `Orders`.`CustomerID`
GROUP BY `Orders`.`OrderID`;

-- 7.12. Orders per customer. 
SELECT  `Customers`.`Name` AS `Customer`, SUM(`BookOrders`.`Amount`) AS `Total Book Count`, GROUP_CONCAT(CONCAT('Order ID: ', `Orders`.`OrderID`, ', ', `Books`.`Name`, ' x ', `BookOrders`.`Amount`,  ', Order Date: ', `Orders`.`Date`) SEPARATOR ';\n') AS `Order Details` 
    FROM `BookOrders` 
    LEFT JOIN `Books` ON `Books`.`BookID` = `BookOrders`.`BookID`
    LEFT JOIN `Orders` ON `Orders`.`OrderID` = `BookOrders`.`OrderID`
    LEFT JOIN `Customers` ON `Customers`.`CustomerID` = `Orders`.`CustomerID`
GROUP BY `Customers`.`CustomerID`;
