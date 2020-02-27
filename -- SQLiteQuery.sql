-- Visual Studio Code
-- cmd + shift  + p 
-- run query

-- .mode column
-- .header on

-- SQLite
-- select f.name as country, c.*
-- from cities c 
-- inner join facts f 
-- on c.facts_id = f.id
-- where c.capital = 1;

-- SELECT 
--     facts.name country,
--     cities.population   
-- FROM facts 
-- LEFT JOIN cities ON facts.id = cities.facts_id
-- WHERE cities.name IS NULL

-- SELECT 
--     cities.name capital_city,
--     facts.name,
--     cities.population
-- FROM facts 
-- INNER JOIN cities ON facts.id = cities.facts_id
-- WHERE cities.capital = 1
-- ORDER BY 3 DESC
-- LIMIT 10;


-- SELECT
--     f.name country,
--     c.name capital_city
-- FROM facts f 
-- INNER JOIN (
--     SELECT * FROM cities WHERE capital = 1
-- )  c ON c.facts_id = f.id
-- LIMIT 10;

-- SELECT 
--     C.name capital_city,
--     F.name country,
--     C.population population
-- FROM facts F 
-- INNER JOIN (
--     SELECT * FROM cities 
--     WHERE capital = 1
-- ) C ON C.facts_id = F.id
-- WHERE C.population > 10000000
-- ORDER BY 3 DESC;

-- SELECT 
--     CASE 
--         WHEN 

SELECT 
    facts.name country,
    facts.population country_pop,
    cities.name city ,
    cities.population city_pop
FROM facts 
INNER JOIN cities ON facts.id = cities.facts_id
WHERE cities.capital = 1
