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

-- FOR CAPITAL CITY 
-- SELECT 
--     T.country,
--     T.urban_pop,
--     T.country_pop,
--     T.urban_pct
-- FROM (SELECT 
--     facts.name country,
--     facts.population total_pop,
--     cities.name city ,
--     cities.population urban_pop,
--     ROUND(CAST (cities.population AS FLOAT) / CAST( facts.population AS FLOAT),6) AS urban_pct
-- FROM facts 
-- INNER JOIN cities ON facts.id = cities.facts_id
-- WHERE cities.capital = 1) T
-- WHERE T.urban_pct > 0.5 
-- ORDER BY 4 ASC;

-- ALL CITY 
SELECT 
    T.country,
    T.urban_pop,
    T.total_pop,
    ROUND((CAST(T.urban_pop AS FLOAT) / CAST(T.total_pop AS FLOAT)), 6) urban_pct
FROM (SELECT 
    facts.name country,
    facts.population total_pop,
    SUM(cities.population) urban_pop --ALL CITIES POP SUM 
FROM facts 
INNER JOIN cities ON facts.id = cities.facts_id
GROUP BY 1,2) T
WHERE urban_pct > 0.5
ORDER BY 4 ASC;