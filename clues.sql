-- ============================================
-- Carmen Sandiego SQL Investigation
-- ============================================

-- Clue #1: Least populated country in Southern Europe
SELECT name
FROM countries
WHERE region = 'Southern Europe'
ORDER BY population ASC
LIMIT 1;
-- Answer: San Marino

-- -------------------------------------------------

-- Clue #2: Official language spoken in San Marino
SELECT language
FROM country_languages
WHERE country = 'San Marino' AND is_official = true;
-- Answer: Italian

-- -------------------------------------------------

-- Clue #3: Country that speaks only Italian
SELECT country
FROM country_languages
GROUP BY country
HAVING COUNT(*) = 1
   AND MAX(language = 'Italian') = 1;
-- Answer: Italy

-- -------------------------------------------------

-- Clue #4: City in Italy that isn't named "Italy"
SELECT name
FROM cities
WHERE country = 'Italy' AND name != 'Italy';
-- Possible Answer: Florence

-- -------------------------------------------------

-- Clue #5: City in South America similar to "Florence" but not ending in "ence"
SELECT c.name AS city, c.country
FROM cities c
JOIN countries co ON c.country = co.name
WHERE co.continent = 'South America'
  AND c.name LIKE 'Flor%' AND c.name NOT LIKE '%ence';
-- Answer: Florencia, Colombia

-- -------------------------------------------------

-- Clue #6: Capital city of Colombia
SELECT capital
FROM countries
WHERE name = 'Colombia';
-- Answer: Bogotá

-- -------------------------------------------------

-- Clue #7: City with population 91,085 – Carmen’s next stop!
SELECT name, country
FROM cities
WHERE population = 91085;
-- Answer: Valencia, Venezuela

-- ============================================
-- Final Destination: Valencia, Venezuela ✈️
-- ============================================
