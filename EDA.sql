/* /////////////////////////////////////////////////////////////////////////////////////// */
/* DATA ANALYSIS */    
/* OBTAIN ANNUAL TIME SERIES */
-- TOTAL POPULATION IN MALAYSIA
SELECT `date`, sum(population)*1000 AS mas_population
FROM population_state_staging
WHERE sex <> 'both' AND age <> 'overall' AND ethnicity <> 'overall' 
GROUP BY `date`;

-- TOTAL BIRTH IN MALAYSIA
SELECT `date`, sum(birth) AS mas_birth
FROM birth_state_staging
WHERE sex = 'both' AND ethnicity = 'overall' 
GROUP BY `date`;

-- STATE POPULATION  
CREATE VIEW state_population AS (
	SELECT `date`, state, sex, age, sum(population*1000) AS population
	FROM population_state_staging
	WHERE sex <> 'both' AND age <> 'overall' AND ethnicity <> 'overall'      
	GROUP BY `date`, state, sex, age);

-- STATE BIRTHS
CREATE VIEW state_birth AS (
	SELECT `date`, state, sex, sum(birth) AS birth
	FROM birth_state_staging
	WHERE sex <>'both' AND ethnicity = 'overall'     
	GROUP BY `date`, state, sex);

-- STATE POPULATION SEPARATED INTO COLUMNS 
SELECT
	`date`,
    SUM(IF(state = 'Selangor', population, 0)) AS 'Selangor',
    SUM(IF(state = 'Johor', population, 0)) AS 'Johor',
    SUM(IF(state = 'Sabah', population, 0)) AS 'Sabah',
    SUM(IF(state = 'Perak', population, 0)) AS 'Perak',
    SUM(IF(state = 'Sarawak', population, 0)) AS 'Sarawak',
    SUM(IF(state = 'Kedah', population, 0)) AS 'Kedah',
    SUM(IF(state = 'W.P. Kuala Lumpur', population, 0)) AS 'W.P. Kuala Lumpur',
    SUM(IF(state = 'Kelantan', population, 0)) AS 'Kelantan',
    SUM(IF(state = 'Pulau Pinang', population, 0)) AS 'Pulau Pinang',
    SUM(IF(state = 'Pahang', population, 0)) AS 'Pahang',
    SUM(IF(state = 'Negeri Sembilan', population, 0)) AS 'Negeri Sembilan',
    SUM(IF(state = 'Terengganu', population, 0)) AS 'Terengganu',
    SUM(IF(state = 'Melaka', population, 0)) AS 'Melaka',
    SUM(IF(state = 'Perlis', population, 0)) AS 'Perlis',
    SUM(IF(state = 'W.P. Putrajaya', population, 0)) AS 'W.P. Putrajaya',
    SUM(IF(state = 'W.P. Labuan', population, 0)) AS 'W.P. Labuan'
FROM state_population
GROUP BY `date`;

-- STATE POPULATION DENSITY SEPARATED INTO COLUMNS 
SELECT
	`date`, 
    SUM(IF(state = 'Selangor', population/7960, 0)) AS 'Selangor',
    SUM(IF(state = 'Johor', population/18987, 0)) AS 'Johor',
    SUM(IF(state = 'Sabah', population/73619, 0)) AS 'Sabah',
    SUM(IF(state = 'Perak', population/21005, 0)) AS 'Perak',
    SUM(IF(state = 'Sarawak', population/124450, 0)) AS 'Sarawak',
    SUM(IF(state = 'Kedah', population/9425, 0)) AS 'Kedah',
    SUM(IF(state = 'W.P. Kuala Lumpur', population/243, 0)) AS 'W.P. Kuala Lumpur',
    SUM(IF(state = 'Kelantan', population/15024, 0)) AS 'Kelantan',
    SUM(IF(state = 'Pulau Pinang', population/1031, 0)) AS 'Pulau Pinang',
    SUM(IF(state = 'Pahang', population/35965, 0)) AS 'Pahang',
    SUM(IF(state = 'Negeri Sembilan', population/6644, 0)) AS 'Negeri Sembilan',
    SUM(IF(state = 'Terengganu', population/12955, 0)) AS 'Terengganu',
    SUM(IF(state = 'Melaka', population/1652, 0)) AS 'Melaka',
    SUM(IF(state = 'Perlis', population/795, 0)) AS 'Perlis',
    SUM(IF(state = 'W.P. Putrajaya', population/46, 0)) AS 'W.P. Putrajaya',
    SUM(IF(state = 'W.P. Labuan', population/92, 0)) AS 'W.P. Labuan'
FROM state_population
GROUP BY `date`;

-- STATE BIRTH SEPARATED INTO COLUMNS 
SELECT
	`date`, 
    SUM(IF(state = 'Selangor', birth, 0)) AS 'Selangor',
    SUM(IF(state = 'Johor', birth, 0)) AS 'Johor',
    SUM(IF(state = 'Sabah', birth, 0)) AS 'Sabah',
    SUM(IF(state = 'Perak', birth, 0)) AS 'Perak',
    SUM(IF(state = 'Sarawak', birth, 0)) AS 'Sarawak',
    SUM(IF(state = 'Kedah', birth, 0)) AS 'Kedah',
    SUM(IF(state = 'W.P. Kuala Lumpur', birth, 0)) AS 'W.P. Kuala Lumpur',
    SUM(IF(state = 'Kelantan', birth, 0)) AS 'Kelantan',
    SUM(IF(state = 'Pulau Pinang', birth, 0)) AS 'Pulau Pinang',
    SUM(IF(state = 'Pahang', birth, 0)) AS 'Pahang',
    SUM(IF(state = 'Negeri Sembilan', birth, 0)) AS 'Negeri Sembilan',
    SUM(IF(state = 'Terengganu', birth, 0)) AS 'Terengganu',
    SUM(IF(state = 'Melaka', birth, 0)) AS 'Melaka',
    SUM(IF(state = 'Perlis', birth, 0)) AS 'Perlis',
    SUM(IF(state = 'W.P. Putrajaya', birth, 0)) AS 'W.P. Putrajaya',
    SUM(IF(state = 'W.P. Labuan', birth, 0)) AS 'W.P. Labuan'
FROM state_birth
GROUP BY `date`;							
