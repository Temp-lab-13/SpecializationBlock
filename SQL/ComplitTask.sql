-- Удалить записи о верблюдах, сама таблица сохраняется.
DELETE FROM Camel WHERE Class = 3;
SELECT * FROM Camel;

-- Объединить таблицы лошадей и ослов (У меня таблица с быками.)
SELECT Name, Age, Commands, Class FROM Hours
UNION
SELECT Name, Age, Commands, Class FROM Bull;

-- Создать новую таблицу для животных в возрасте от 1 до 3 лет и вычислить их возраст с точностью до месяца.
DROP TABLE IF EXISTS `Animal Up to 3 years`;
CREATE TABLE IF NOT EXISTS `Animal Up to 3 years`(
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Name VARCHAR (10),
    Age DATE,
	Years VARCHAR (20),
	Commands TEXT,
	Class INT
);
SELECT * FROM `Animal Up to 3 years`;

DROP FUNCTION IF EXISTS Search_Age;
DELIMITER $$
CREATE FUNCTION Search_Age(Age DATE)
	RETURNS VARCHAR(20)
	DETERMINISTIC
	BEGIN
		DECLARE result VARCHAR(20);
        DECLARE Years INT;
        DECLARE Months INT;
        SET Years = TIMESTAMPDIFF(YEAR, Age, CURDATE());
        SET Months = (TIMESTAMPDIFF(Month, Age, CURDATE())) - (Years * 12);
        SET result = concat(Years, "years ", Months, "months");
		RETURN result;
	END $$
DELIMITER ;
-- Select Search_Age('2005-11-19');
DELIMITER $$
CREATE FUNCTION Search_YEAR(Age DATE)
	RETURNS INT
	DETERMINISTIC
	BEGIN
        DECLARE Years INT;
        SET Years = TIMESTAMPDIFF(YEAR, Age, CURDATE());
		RETURN Years;
	END $$
DELIMITER ;

INSERT INTO `Animal Up to 3 years` (Name, Age, Years, Commands, Class)
	SELECT Name, Age as BirthDate, Search_Age(Age) as Age, Commands, Class 
    FROM `Kat` WHERE  Search_YEAR(Age) <= 3 AND Search_YEAR(Age) >= 1
    UNION
    SELECT Name, Age as BirthDate, Search_Age(Age) as Age, Commands, Class 
    FROM `Dog` WHERE  Search_YEAR(Age)<= 3 AND Search_YEAR(Age) >= 1
    UNION
    SELECT Name, Age as BirthDate, Search_Age(Age) as Age, Commands, Class 
    FROM `Mouse` WHERE  Search_YEAR(Age)<= 3 AND Search_YEAR(Age) >= 1
    UNION
    SELECT Name, Age as BirthDate, Search_Age(Age) as Age, Commands, Class 
    FROM `Hours` WHERE  Search_YEAR(Age)<= 3 AND Search_YEAR(Age) >= 1
    UNION
    SELECT Name, Age as BirthDate, Search_Age(Age) as Age, Commands, Class 
    FROM `Camel` WHERE  Search_YEAR(Age)<= 3 AND Search_YEAR(Age) >= 1
    UNION
    SELECT Name, Age as BirthDate, Search_Age(Age) as Age, Commands, Class 
    FROM `Bull` WHERE  Search_YEAR(Age)<= 3 AND Search_YEAR(Age) >= 1;
SELECT * FROM `Animal Up to 3 years`;
    
-- Объединить все созданные таблицы в одну, сохраняя информацию о принадлежности к исходным таблицам.
SELECT Animals.Category, Pets.Class, Name, Age, Commands FROM Kat
	JOIN Pets ON Kat.Class = Pets.Id
    JOIN Animals ON Pets.Category = Animals.Id
UNION 
SELECT Animals.Category, Pets.Class, Name, Age, Commands FROM Dog
	JOIN Pets ON Dog.Class = Pets.Id
    JOIN Animals ON Pets.Category = Animals.Id
UNION
SELECT Animals.Category, Pets.Class, Name, Age, Commands FROM Mouse
	JOIN Pets ON Mouse.Class = Pets.Id
    JOIN Animals ON Pets.Category = Animals.Id
UNION 
SELECT Animals.Category, `Pack animals`.Class, Name, Age, Commands FROM Hours 
	JOIN `Pack animals` ON Hours.Class = `Pack animals`.Id
    JOIN Animals ON `Pack animals`.Category = Animals.Id
UNION 
SELECT Animals.Category, `Pack animals`.Class, Name, Age, Commands FROM Camel 
	JOIN `Pack animals` ON Camel.Class = `Pack animals`.Id
    JOIN Animals ON `Pack animals`.Category = Animals.Id;
	
