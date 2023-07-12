DROP DATABASE IF EXISTS `HW_6`;
CREATE DATABASE IF NOT EXISTS `HW_6`;
USE `HW_6`;

/*
1. Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/

DELIMITER $$
CREATE FUNCTION sec_in_day(seconds INT) 
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
	DECLARE days INT;
	DECLARE hours INT;
	DECLARE minutes INT;
    DECLARE result VARCHAR(255);
    
    SET days = seconds DIV (24 * 3600);
    SET seconds = seconds MOD (24 * 3600);
    SET hours = seconds DIV 3600;
    SET seconds = seconds MOD 3600;
    SET minutes = seconds DIV 60;
    SET seconds = seconds MOD 60;

    SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');

    RETURN result;
END $$

DELIMITER ;
    
SELECT sec_in_day(123456) AS 'Форматированное время';

/*
2. Создайте процедуру, которая  выводит только четные числа от 1 до 10 включительно.
Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)
*/

DELIMITER //
CREATE PROCEDURE even_numbers()
BEGIN
	DECLARE n INT;    
    SET n = 2; 
    CREATE TEMPORARY TABLE IF NOT EXISTS even_numbers (number INT);
    WHILE n <= 10 DO
        INSERT INTO even_numbers (number) VALUES (n);
        SET n = n + 2;
    END WHILE;
    SELECT * FROM even_numbers;
    DROP TEMPORARY TABLE IF EXISTS even_numbers;
END //
DELIMITER ;

CALL even_numbers();