USE `book_business`;

/*
SET SQL_SAFE_UPDATES = 0;
DELETE FROM `BookAuthors`;
DELETE FROM `BookEditors`;
DELETE FROM `BookGenres`;
DELETE FROM `BookOrders`;
DELETE FROM `Publishers`;
DELETE FROM `Books`;
DELETE FROM `Authors`;
DELETE FROM `Editors`;
DELETE FROM `Genres`;
DELETE FROM `Customers`;
DELETE FROM `Orders`;
SET SQL_SAFE_UPDATES = 1;
*/

-- Publishers

INSERT INTO `Publishers` (`Name`, `Website`) VALUES
    ROW('Knopf', 'https://knopfdoubleday.com/'),
    ROW('Simon & Schuster Audio', 'https://about.simonandschuster.biz');

-- Books

INSERT INTO `Books` (`Name`, `Price`, `PublisherID`) VALUES
    ROW('How to Avoid a Climate Disaster', 14.95, 1),
    ROW('Steve Jobs', 35.00, 2),
    ROW('How to Prevent the Next Pandemic', 17.42, 1);

--  Authors

INSERT INTO `Authors` (`Name`) VALUES
    ROW('Bill Gates'),
    ROW('Walter Isaacson'),
    ROW('Wil Wheaton');

-- Editors

INSERT INTO `Editors` (`Name`) VALUES
    ROW('Wil Wheaton'),
    ROW('Dylan Baker');


-- Genres

INSERT INTO `Genres` (`Name`) VALUES
    ROW('History'),
    ROW('Biographies & Memoirs');

-- Customers

INSERT INTO `Customers` (`Name`, `Address`, `Phone`, `Email`) VALUES
    ROW('Hello World', 'All around the world St, Apt 101, MA, 02139, US', '123456789', 'hello@world.com'),
    ROW('Tik Tok', 'Tee St, Apt 202, CA, 93405, US', '987654321', 'tik@tok.com');

-- Orders

INSERT INTO `Orders` (`CustomerID`, `Date`) VALUES
    ROW(1, '2022-10-07'),
    ROW(2, '2022-10-08');

-- BookAuthors

INSERT INTO `BookAuthors` (`BookID`, `AuthorID`, `Royalties`) VALUES
    ROW(1, 1, 100000),
    ROW(2, 2, 200000),
    ROW(3, 1, 100000),
    ROW(1, 3, 100000);

-- BookEditors

INSERT INTO `BookEditors` (`BookID`, `EditorID`) VALUES
    ROW(1, 1),
    ROW(2, 2),
    ROW(3, 1);

-- BookGenres

INSERT INTO `BookGenres` (`BookID`, `GenreID`) VALUES
    ROW(1, 1),
    ROW(2, 2),
    ROW(3, 1);

-- BookOrders

INSERT INTO `BookOrders` (`BookID`, `OrderID`, `Amount`) VALUES
    ROW(1, 1, 2),
    ROW(2, 2, 1),
    ROW(3, 1, 1);