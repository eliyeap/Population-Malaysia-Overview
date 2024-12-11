/* /////////////////////////////////////////////////////////////////////////////////////// */
/* DOWNLOAD DATA */
/* CREATE TABLE population_state_raw */
CREATE TABLE population_state_raw (
    state varchar(255),
	`date` varchar(255),
    sex varchar(255),
    age varchar(255),
    ethnicity varchar(255),
    population int
);

/* LOAD EXCEL DATA INTO population_state_raw TABLE */
LOAD DATA LOCAL INFILE "C:/Users/elizy/OneDrive/SQL/Portfolio Malaysia/population_state.csv" INTO TABLE population_state_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;									

/* CREATE STAGING TABLE TO MODIFY DATA */
CREATE TABLE population_state_staging LIKE population_state_raw;
INSERT population_state_staging 
SELECT * FROM population_state_raw;

/* /////////////////////////////////////////////////////////////////////////////////////// */
/* CLEAN DATA */
/* CHECK FOR DUPLICATES */
SELECT state, `date`, sex, age, ethnicity, population
FROM population_state_staging
GROUP BY state, `date`, sex, age, ethnicity, population
HAVING COUNT(*) > 1;

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

/* CHECK FOR EMPTY OR NULL VALUES */
SELECT * FROM population_state_staging
WHERE population = '' AND population <> '0' OR population IS NULL;

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

/* CHANGE DATE FORMAT: D/M/YYYY TO YYYY */
SELECT `date`, date_format(str_to_date(`date`, '%d/%m/%Y'), '%Y') AS date_corrected
FROM population_state_staging;
UPDATE population_state_staging
SET `date` = date_format(str_to_date(`date`, '%d/%m/%Y'), '%Y'); 	

/* /////////////////////////////////////////////////////////////////////////////////////// */
/* EXPLORATORY DATA ANALYSIS */
/* OBTAIN ANNUAL TIME SERIES */
-- TOTAL MALE POPULATION IN MALAYSIA 
SELECT `date`, sum(population)*1000 AS male_population
FROM population_state_staging
WHERE sex = 'male' AND age = 'overall' AND ethnicity = 'overall' 		
GROUP BY `date`;

-- TOTAL FEMALE POPULATION IN MALAYSIA 
SELECT `date`, sum(population)*1000 AS female_population
FROM population_state_staging
WHERE sex = 'female' AND age = 'overall' AND ethnicity = 'overall' 		
GROUP BY `date`;

-- TOTAL POPULATION IN MALAYSIA ACCORDING TO ETHNICITY
SELECT `date`, ethnicity, sex, sum(population)*1000 AS population
FROM population_state_staging
WHERE sex <> 'both' AND age = 'overall' AND ethnicity <> 'overall' 	
GROUP BY `date`, ethnicity, sex;

-- TOTAL POPULATION IN MALAYSIA FOR EACH AGE GROUP AND ETHNICITY
SELECT `date`, age, ethnicity, sum(population)*1000 AS population
FROM population_state_staging
WHERE sex = 'both' AND age <> 'overall' AND ethnicity <> 'overall' 	
GROUP BY `date`, age, ethnicity;

-- STATE POPULATION FOR EACH GENDER
SELECT `date`, state, sex, sum(population)*1000 AS population
FROM population_state_staging
WHERE sex <> 'both' AND age = 'overall' AND ethnicity = 'overall'      
GROUP BY `date`, state, sex;

-- ESTIMATE STATE POPULATION DENSITY
SELECT `date`, state, sex
    (
    CASE 
        WHEN state = 'Johor' THEN sum(population*1000)/18987	 
        WHEN state = 'Kedah' THEN sum(population*1000)/9425
        WHEN state = 'Kelantan' THEN sum(population*1000)/15024
        WHEN state = 'Melaka' THEN sum(population*1000)/1652
        WHEN state = 'Negeri Sembilan' THEN sum(population*1000)/6644
        WHEN state = 'Pahang' THEN sum(population*1000)/35965
        WHEN state = 'Perak' THEN sum(population*1000)/21005
        WHEN state = 'Perlis' THEN sum(population*1000)/795
        WHEN state = 'Pulau Pinang' THEN sum(population*1000)/1031
        WHEN state = 'Sabah' THEN sum(population*1000)/73619	
        WHEN state = 'Sarawak' THEN sum(population*1000)/124450
        WHEN state = 'Selangor' THEN sum(population*1000)/7960
        WHEN state = 'Terengganu' THEN sum(population*1000)/12955
        WHEN state = 'W.P. Kuala Lumpur' THEN sum(population*1000)/243
        WHEN state = 'W.P. Labuan' THEN sum(population*1000)/92
        WHEN state = 'W.P. Putrajaya' THEN sum(population*1000)/46
    END) AS population_density
FROM population_state_staging
WHERE sex <> 'both' AND age = 'overall' AND ethnicity = 'overall' 		
GROUP BY `date`, state, sex;

-- STATE POPULATION FOR EACH GENDER ACCORDING TO ETHNICITY
SELECT `date`, state, ethnicity, sex, sum(population)*1000 AS population
FROM population_state_staging
WHERE sex <> 'both' AND age = 'overall' AND ethnicity <> 'overall'      
GROUP BY `date`, state, ethnicity, sex;

-- STATE POPULATION FOR EACH AGE GROUP ACCORDING TO ETHNICITY
SELECT `date`, state, age, ethnicity, sum(population)*1000 AS population
FROM population_state_staging
WHERE sex = 'both' AND age <> 'overall' AND ethnicity <> 'overall'     
GROUP BY `date`, state, age, ethnicity;

