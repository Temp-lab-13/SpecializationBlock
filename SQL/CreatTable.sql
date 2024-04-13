-- Создание таблиц и связывание в соответсвии с схемой.

-- DROP SCHEMA IF EXISTS `Human Friends`;
CREATE SCHEMA IF NOT EXISTS `Human Friends`;
USE `Human Friends`;
-- DROP TABLE `Animal`;
-- DROP TABLE `Pets`;
-- DROP TABLE `Pack animals`;
-- DROP TABLE `Kat`;
-- DROP TABLE `Dog`;
-- DROP TABLE `Mouse`;
-- DROP TABLE `Hours`;
-- DROP TABLE `Bull`;
-- DROP TABLE `Camel`;

DROP TABLE IF EXISTS `Animals`;
CREATE TABLE IF NOT EXISTS `Animals`(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    Category VARCHAR (24)
);

INSERT INTO `Animals` (Category) VALUES
    ('Домашнии питомцы'),
    ('Вьючные животные');
SELECT * FROM `Animals`;

DROP TABLE IF EXISTS `Pets`;
CREATE TABLE IF NOT EXISTS `Pets`(
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Class VARCHAR (20),
	Category INT,
	FOREIGN KEY (Category) REFERENCES `Animals` (Id)
);

INSERT INTO `Pets` (Class) VALUES
	('Кошки'),
	('Собаки'),
	('Мыши');
UPDATE `Pets` SET Category = (SELECT Id FROM Animals  WHERE  Animals.Category= 'Домашнии питомцы');
SELECT * FROM `Pets`;

	DROP TABLE IF EXISTS `Kat`;
	CREATE TABLE IF NOT EXISTS `Kat`(
		Id INT PRIMARY KEY AUTO_INCREMENT,
		Name VARCHAR (10),
		Age DATE,
		Commands VARCHAR(100), 
		Class INT,
		FOREIGN KEY (Class) REFERENCES `Pets` (Id)
	);
	SELECT * FROM `Kat`; 
    
	DROP TABLE IF EXISTS `Dog`;
	CREATE TABLE IF NOT EXISTS `Dog`(
		Id INT PRIMARY KEY AUTO_INCREMENT,
		Name VARCHAR (10),
		Age DATE,
		Commands VARCHAR(100),
		Class INT DEFAULT 2,
		FOREIGN KEY (Class) REFERENCES `Pets` (Id)
	);
	SELECT * FROM `Dog`; 

	DROP TABLE `Mouse`;
	CREATE TABLE IF NOT EXISTS `Mouse`(
		Id INT PRIMARY KEY AUTO_INCREMENT,
		Name VARCHAR (10),
		Age DATE,
		Commands VARCHAR(100),
		Class INT,
		FOREIGN KEY (Class) REFERENCES Pets (Id)
	);
	SELECT * FROM `Mouse`; 
    
		INSERT INTO `Kat` (Name, Age, Commands) VALUES
			('Плюша', '2015-12-22', 'есть, кис, брысь'),
			('Пончик', '2018-07-11', 'есть, кис, брысь');
		UPDATE `Kat` SET Class = (SELECT Id FROM Pets WHERE Pets.Class = 'Кошки');
        SELECT * FROM `Kat`; 
        
		INSERT INTO `Dog` (Name, Age, Commands) VALUES
			('Буханка', '2016-01-12', 'фу, есть, сидеть, лапу'),
			('Веник', '2017-02-21', 'фу, есть, лежать, ктотам');
		UPDATE `Dog` SET Class = (SELECT Id FROM Pets WHERE Pets.Class = 'Собаки');
		SELECT * FROM `Dog`; 
        
		INSERT INTO `Mouse` (Name, Age, Commands) VALUES
			('Пинки', '2022-01-01', '-'),
			('Брэйн', '2022-01-01', '-');
		UPDATE `Mouse` SET Class = (SELECT Id FROM Pets WHERE Pets.Class = 'Мыши');
		SELECT * FROM `Mouse`;
        
DROP TABLE IF EXISTS `Pack animals`;
CREATE TABLE IF NOT EXISTS `Pack animals`(
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Class VARCHAR (24),
	Category INT,
	FOREIGN KEY (Category) REFERENCES `Animals` (Id)
);

INSERT INTO `Pack animals` (Class) VALUES
	('Лошади'),
	('Быки'),
	('Верблюды');
UPDATE `Pack animals` SET Category = (SELECT Id FROM Animals  WHERE  Animals.Category= 'Вьючные животные');
SELECT * FROM `Pack animals`;
    

	DROP TABLE IF EXISTS `Hours`;
	CREATE TABLE IF NOT EXISTS `Hours`(
		Id INT PRIMARY KEY AUTO_INCREMENT,
		Name VARCHAR (10),
		Age DATE,
		Commands VARCHAR(100),
		Class INT,
		FOREIGN KEY (Class) REFERENCES `Pack animals` (Id)
	);
	SELECT * FROM `Hours`;
        
	DROP TABLE IF EXISTS `Bull`;
	CREATE TABLE IF NOT EXISTS `Bull`(
		Id INT PRIMARY KEY AUTO_INCREMENT,
		Name VARCHAR (10),
		Age DATE,
		Commands VARCHAR(100),
		Class INT,
		FOREIGN KEY (Class) REFERENCES `Pack animals` (Id)
	);
	SELECT * FROM `Bull`;
        
	DROP TABLE IF EXISTS `Camel`;
	CREATE TABLE IF NOT EXISTS `Camel`(
		Id INT PRIMARY KEY AUTO_INCREMENT,
		Name VARCHAR (10),
		Age DATE,
		Commands VARCHAR(100),
		Class INT,
		FOREIGN KEY (Class) REFERENCES `Pack animals` (Id)
	);
	SELECT * FROM `Camel`;
            
		INSERT INTO `Hours` (Name, Age, Commands) VALUES
			('Спирит', '2014-12-22', 'стоять, но, брр, сесть'),
			('Джезефина', '2015-02-11', 'стоять, но, брр, назад');
		UPDATE `Hours` SET Class = (SELECT Id FROM `Pack animals` WHERE `Pack animals`.Class = 'Лошади');
        SELECT * FROM `Hours`;
		
		INSERT INTO `Camel` (Name, Age, Commands) VALUES
			('Боярский', '2013-10-28', 'сесть, есть, выплюнь, плюнь, вперёт'),
			('Кэмэл', '2015-05-01', 'сесть, есть, неси, стоять');
		UPDATE `Camel` SET Class = (SELECT Id FROM `Pack animals` WHERE `Pack animals`.Class = 'Верблюды');
		SELECT * FROM `Camel`;
        
		INSERT INTO `Bull` (Name, Age, Commands) VALUES
			('Рэд', '2005-11-19', 'стоять, вперёд, назад'),
			('Блэк', '2010-05-24', 'стоять, вперёд, брось');
		UPDATE `Bull` SET Class = (SELECT Id FROM `Pack animals` WHERE `Pack animals`.Class = 'Быки');
        SELECT * FROM `Bull`;