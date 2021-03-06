
-- drop table if exists statements
DROP TABLE IF EXISTS companionPlant;
DROP TABLE IF EXISTS combativePlant;
DROP TABLE IF EXISTS garden;
DROP TABLE IF EXISTS plantArea;

DROP TABLE IF EXISTS plant;


CREATE TABLE plant(

	plantId SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT, -- PRIMARY KEY
	plantName VARCHAR(64) ,
	plantLatinName VARCHAR (72) ,
	plantVariety VARCHAR(64) ,
	plantType VARCHAR(32)  ,
	plantDescription TEXT,
	plantSpread FLOAT UNSIGNED ,
	plantHeight FLOAT UNSIGNED ,
	plantDaysToHarvest SMALLINT UNSIGNED ,
	plantMinTemp TINYINT SIGNED NOT NULL,
	plantMaxTemp TINYINT SIGNED ,
	plantSoilMoisture VARCHAR(32) ,
	PRIMARY KEY (plantId) -- ,
	-- FOREIGN KEY (plantId) REFERENCES garden(gardenPlantId),
	-- FOREIGN KEY (plantId) REFERENCES plantArea(plantAreaPlantId)
);

CREATE TABLE companionPlant(
	companionPlant1Id SMALLINT UNSIGNED NOT NULL, -- FOREIGN KEY
	companionPlant2Id SMALLINT UNSIGNED NOT NULL, -- FOREIGN KEY
	-- index and create foreign keys
	INDEX(companionPlant1Id),
	INDEX(companionPlant2Id),
	FOREIGN KEY (companionPlant1Id) REFERENCES plant(plantId),
	FOREIGN KEY (companionPlant2Id) REFERENCES plant(plantId)
);

CREATE TABLE combativePlant(
	combativePlant1Id SMALLINT UNSIGNED NOT NULL, -- FOREIGN KEY
	combativePlant2Id SMALLINT UNSIGNED NOT NULL, -- FOREIGN KEY
	-- index foreign keys
	INDEX(combativePlant1Id),
	INDEX(combativePlant2Id),
	FOREIGN KEY (combativePlant1Id) REFERENCES plant(plantId),
	FOREIGN KEY (combativePlant2Id) REFERENCES plant(plantId)
);

CREATE TABLE garden (
	gardenProfileId INT UNSIGNED,
	gardenPlantId SMALLINT UNSIGNED,
	gardenDatePlanted DATE,
	-- index and create foreign keys
	FOREIGN KEY(gardenProfileId) REFERENCES profile(profileId),
	FOREIGN KEY(gardenPlantId) REFERENCES plant(plantId),
	INDEX(gardenProfileId),
	INDEX(gardenPlantId)
);

CREATE TABLE plantArea(
	plantAreaId SMALLINT UNSIGNED AUTO_INCREMENT, -- Primary Key
	plantAreaPlantId SMALLINT UNSIGNED NOT NULL, -- Foreign Key

	plantAreaStartDay TINYINT NOT NULL,
	plantAreaEndDay TINYINT NOT NULL,
	plantAreaStartMonth TINYINT NOT NULL,
	plantAreaEndMonth TINYINT NOT NULL,
	plantAreaNumber VARCHAR(2),
	-- index and create foreign key
	INDEX(plantAreaPlantId),
	FOREIGN KEY(plantAreaPlantId) REFERENCES plant(plantId),
	PRIMARY KEY (plantAreaId)
);



