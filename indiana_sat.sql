-- changing data in year column
UPDATE school
SET year = CAST(SUBSTRING(year FROM 1 FOR 4) AS INTEGER);

select* FROM school;

-- changing percent_grad_taking_sat to be represented in decimals
UPDATE school
SET percent_grad_taking_sat =  percent_grad_taking_sat/100;

-- Which are the schools with missing SAT information
SELECT *
FROM school
WHERE avg_composite IS NULL;

--which are the top 3 schools for composite sat score over the years
SELECT * 
FROM 
(SELECT year,school_name,avg_composite, ROW_NUMBER() OVER (PARTITION BY year ORDER BY avg_composite DESC) AS composite_rank
FROM school
WHERE avg_composite IS NOT NULL
ORDER BY year DESC) x
WHERE x.composite_rank BETWEEN 1 AND 3
ORDER BY year DESC, composite_rank ASC;

--which are the top 3 schools for math score over the years
SELECT * 
FROM 
(SELECT year,school_name,ave_sat_math , ROW_NUMBER() OVER (PARTITION BY year ORDER BY ave_sat_math DESC) AS math_rank
FROM school
WHERE ave_sat_math IS NOT NULL
ORDER BY year DESC) x
WHERE x.math_rank BETWEEN 1 AND 3
ORDER BY year DESC, math_rank ASC;

--which are the top 3 schools for reading score over the years
SELECT * 
FROM 
(SELECT year,school_name,ave_sat_reading , ROW_NUMBER() OVER (PARTITION BY year ORDER BY ave_sat_reading DESC) AS reading_rank
FROM school
WHERE ave_sat_reading IS NOT NULL
ORDER BY year DESC) x
WHERE x.reading_rank BETWEEN 1 AND 3
ORDER BY year DESC, reading_rank ASC;