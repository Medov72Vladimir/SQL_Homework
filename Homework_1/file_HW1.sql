/*Создайте таблицу с мобильными телефонами, используя графический интерфейс. 
Заполните БД данными
*/
CREATE DATABASE HW_1;
USE HW_1;
CREATE TABLE mobile_phones
(id INT PRIMARY KEY NOT NULL,
ProductName VARCHAR(30) NOT NULL,
Manufacturer VARCHAR(30) NOT NULL,
ProductCount INT,
Price INT);
SELECT * FROM mobile_phones;
INSERT INTO mobile_phones(id, ProductName, Manufacturer, ProductCount, Price)
VALUES
(1, "iPhone X", "Apple", 3, 76000),
(2, "iPhone 8", "Apple", 2, 51000),
(3, "Galaxy S9", "Samsung", 2, 56000),
(4, "Galaxy S8", "Samsung", 1, 41000),
(5, "P20 Pro", "Huawei", 5, 36000);

# Выведите название, производителя и цену для товаров, количество которых превышает 2
SELECT ProductName, Manufacturer, Price FROM mobile_phones WHERE ProductCount > 2;

# Выведите весь ассортимент товаров марки “Samsung”
SELECT * FROM mobile_phones WHERE Manufacturer = "Samsung";