--Examine data from table countries and economies to examine the inflation rate 2010 and 2015

-- Select fields with aliases
SELECT c.code AS country_code, c.name, e.year, e.inflation_rate
FROM countries AS c
-- Join to economies (alias e)
INNER JOIN economies AS e
-- Match on code field using table aliases
ON c.code = e.code

--Which languages are offical languages and which ones are unoffical?
--Explore using USING and INNER JOIN and the table languages

SELECT c.name AS country, l.name AS language, official
FROM countries AS c
INNER JOIN languages AS l
-- Match using the code column
USING (code);

--There's a many to many relationship between the countries and languages table
--Inspecting the relationship. Output languge and country

-- Select country and language names, aliased
SELECT c.name AS country, l.name AS language
-- From countries (aliased)
FROM countries AS c
-- Join to languages (aliased)
INNER JOIN languages AS l
-- Use code as the joining field with the USING keyword
USING (code);

-- Rearrange SELECT statement, keeping aliases
SELECT l.name AS language, c.name AS country
FROM countries AS c
INNER JOIN languages AS l
USING(code)
-- Order the results by language
ORDER BY language;

--What is the relationship between fertility and unemployment rates?
--Use tables countries, populations and economies

-- Select relevant fields
SELECT name, year, fertility_rate 
-- Inner join countries and populations, aliased, on code
FROM countries AS c
INNER JOIN populations AS p
ON c.code = p.country_code;

--Ensure that year is also selected
SELECT name, e.year, fertility_rate, unemployment_rate
FROM countries AS c
INNER JOIN populations AS p
ON c.code = p.country_code
INNER JOIN economies AS e
ON c.code = e.code
-- Add an additional joining condition such that you are also joining on year
	AND e.year = p.year;


