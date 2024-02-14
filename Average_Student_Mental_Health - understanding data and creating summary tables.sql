--Understanding the total number of entries
SELECT COUNT(*)
FROM students;

--Compare types of students by how many vs the total number of students
SELECT inter_dom, COUNT(inter_dom) AS count_inter_dom, COUNT(*) AS total_records 
FROM students
GROUP BY inter_dom;

--How many students from each region deliniated by gender
SELECT region, COUNT(region) AS international_regions, gender
FROM students
WHERE inter_dom = 'Inter'
GROUP BY region,gender
ORDER BY gender,region;

--How many domestic students deliniated by gender?
SELECT region, gender, COUNT(region) AS international_regions
FROM students
WHERE inter_dom = 'Dom'
GROUP BY region, gender;

--The numbers were not adding, the number was managable
--Display the null values to see what the anomolies are
SELECT *
FROM students
WHERE inter_dom IS null;

--Are undergraduates or graduates more suicidal?
SELECT suicide, gender, academic, COUNT(gender) AS num_student
FROM students
GROUP BY suicide,academic,gender
ORDER BY academic,suicide;

--Table to display the min, max and average to understand basics about the data scores
--todep, depression, tosc, social connectedness, toas, acculturative stress
--total of students
SELECT 
	MIN(todep) AS min_phq, MAX(todep) AS max_phq, ROUND(AVG(todep),2) as avg_phq,
	MIN(tosc) AS min_scs, MAX(tosc) AS max_scs, ROUND(AVG(tosc),2) as avg_scs,
	MIN(toas) AS min_as, MAX(toas) AS max_as, ROUND(AVG(toas),2) as avg_as
FROM students;

--What is the difference with international students?
SELECT 
	MIN(todep) AS min_phq, MAX(todep) AS max_phq, ROUND(AVG(todep),2) as avg_phq,
	MIN(tosc) AS min_scs, MAX(tosc) AS max_scs, ROUND(AVG(tosc),2) as avg_scs,
	MIN(toas) AS min_as, MAX(toas) AS max_as, ROUND(AVG(toas),2) as avg_as
FROM students
WHERE inter_dom = 'Inter';

--What is the possibility of years studied at the university?
SELECT DISTINCT(stay) AS num_years
FROM students
ORDER BY num_years DESC;

--What is the average score of international students the three tests measured vs years at university?
SELECT stay, 
       ROUND(AVG(todep), 2) AS average_phq, 
       ROUND(AVG(tosc), 2) AS average_scs, 
       ROUND(AVG(toas), 2) AS average_as
FROM students
WHERE inter_dom = 'Inter'
GROUP BY stay
ORDER BY stay DESC;