/* CREATE TABLE population_state_raw & birth_state_raw */
-- population_state_raw
CREATE TABLE population_state_raw (
    state varchar(255),
	`date` varchar(255),
    sex varchar(255),
    age varchar(255),
    ethnicity varchar(255),
    population int
);

-- birth_state_raw 
CREATE TABLE birth_state_raw (
    state varchar(255),
	`date` varchar(255),
    sex varchar(255),
    ethnicity varchar(255),
    birth int
);

/* /////////////////////////////////////////////////////////////////////////////////////// */
/* LOAD EXCEL DATA INTO population_state_raw & birth_state_raw TABLES */
-- POPULATION DATA INTO population_state_raw 
LOAD DATA LOCAL INFILE "C:/Users/elizy/OneDrive/SQL/Portfolio Malaysia/population_state.csv" INTO TABLE population_state_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;									

-- BIRTH DATA INTO birth_state_raw TABLE 
LOAD DATA LOCAL INFILE "C:/Users/elizy/OneDrive/SQL/Portfolio Malaysia/birth_sex_ethnic_state.csv" INTO TABLE birth_state_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;	

/* /////////////////////////////////////////////////////////////////////////////////////// */
/* CREATE STAGING TABLE TO MODIFY DATA */
-- population_state_staging 
CREATE TABLE population_state_staging LIKE population_state_raw;
INSERT population_state_staging 
SELECT * FROM population_state_raw;

-- birth_state_staging
CREATE TABLE birth_state_staging LIKE birth_state_raw;
INSERT birth_state_staging 
SELECT * FROM birth_state_raw;

/* /////////////////////////////////////////////////////////////////////////////////////// */
/* CHECK FOR DUPLICATES */
-- population_state_staging
SELECT state, `date`, sex, age, ethnicity, population
FROM population_state_staging
GROUP BY state, `date`, sex, age, ethnicity, population
HAVING COUNT(*) > 1;

-- birth_state_staging
SELECT state, `date`, sex, ethnicity, birth
FROM birth_state_staging
GROUP BY state, `date`, sex, ethnicity, birth
HAVING COUNT(*) > 1;

/* /////////////////////////////////////////////////////////////////////////////////////// */
/* DELETE DATA BEFORE 2000 IN population_state_staging */
SELECT count(`date`) FROM population_state_raw
WHERE `date` LIKE '%1/1/19__';

SELECT state, `date`, ethnicity, population 
FROM population_state_staging
GROUP BY state, `date`, ethnicity, population 
HAVING `date` LIKE '%19__';

DELETE FROM population_state_staging						
WHERE `date` LIKE '%19__';

/* DELETE DATA DURING 2024 IN population_state_staging */
SELECT count(`date`) FROM population_state_raw
WHERE `date` = '1/1/2024';

DELETE FROM population_state_staging						
WHERE `date` = '2024';

/* /////////////////////////////////////////////////////////////////////////////////////// */
/* CHECK FOR EMPTY OR NULL VALUES */
-- population_state_staging
SELECT * FROM population_state_staging
WHERE population = '' AND population <> '0' OR population IS NULL;

-- birth_state_staging
SELECT * FROM birth_state_staging
WHERE birth = '' AND birth <> '0' OR birth IS NULL;

/* /////////////////////////////////////////////////////////////////////////////////////// */
/* CHANGE AGE COLUMN IN population_state_staging TABLE: 5-SEP TO 5-9 & Oct-14 TO 10-14 */
SELECT age 
, CASE WHEN age = '5-Sep' THEN '5-9'
	   WHEN age = 'Oct-14' THEN '10-14'
	   ELSE age
	   END AS age_corrected
FROM population_state_staging;

UPDATE population_state_staging
SET age =
  CASE WHEN age = '5-Sep' THEN '5-9'
	   WHEN age = 'Oct-14' THEN '10-14'
	   ELSE age
	   END;

/* /////////////////////////////////////////////////////////////////////////////////////// */
/* CHANGE DATE FORMAT: D/M/YYYY TO YYYY */
-- population_state_staging
SELECT `date`, date_format(str_to_date(`date`, '%d/%m/%Y'), '%Y') AS date_corrected
FROM population_state_staging;
UPDATE population_state_staging
SET `date` = date_format(str_to_date(`date`, '%d/%m/%Y'), '%Y'); 	

-- birth_state_staging
SELECT `date`, date_format(str_to_date(`date`, '%d/%m/%Y'), '%Y') AS date_corrected
FROM birth_state_staging;
UPDATE birth_state_staging
SET `date` = date_format(str_to_date(`date`, '%d/%m/%Y'), '%Y'); 
