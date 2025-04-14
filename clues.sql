
-- Clue #1: We recently got word that someone fitting Carmen Sandiego's description has been traveling through Southern Europe.
-- She's most likely traveling someplace where she won't be noticed, so find the least populated country in Southern Europe,
-- and we'll start looking for her there.

-- SQL:
SELECT name
FROM countries
WHERE region = 'Southern Europe'
ORDER BY population ASC
LIMIT 1;

-- Answer: San Marino

------------------------------------------------------------

-- Clue #2: Now that we're here, we have insight that Carmen was seen attending language classes in this country's
-- officially recognized language. Check our databases and find out what language is spoken in this country.

-- SQL:
SELECT language
FROM country_languages
WHERE country = 'San Marino' AND is_official = true;

-- Answer: Italian

------------------------------------------------------------

-- Clue #3: She's moved on to a different country, a country where people speak only the language she was learning.
-- Find out which country speaks 100% Italian and nothing else.

-- SQL:
SELECT country
FROM country_languages
WHERE language = 'Italian' AND percentage = 100;

-- Answer: Vatican City

------------------------------------------------------------

-- Clue #4: There are only two cities she could be flying to in the country.
-- One is named the same as the country – that would be too obvious.
-- Find out what other city in that country she might be flying to.

-- SQL:
SELECT name
FROM cities
WHERE country = 'Vatican City' AND name != 'Vatican City';

-- Answer: No other city (Vatican City is the only city)

------------------------------------------------------------

-- Clue #5: She's headed to South America. Go find a city whose name is like the one we were headed to,
-- but doesn't end the same.

-- SQL:
SELECT c.name AS city, c.country
FROM cities c
JOIN countries co ON c.country = co.name
WHERE co.continent = 'South America'
  AND c.name ILIKE 'Flor%' AND c.name NOT LIKE '%ence';

-- Answer: Florencia, Colombia

------------------------------------------------------------

-- Clue #6: Our South American agent says she just got a taxi at the airport and is headed towards the capital!

-- SQL:
SELECT capital
FROM countries
WHERE name = 'Colombia';

-- Answer: Bogotá

------------------------------------------------------------

-- Clue #7: Riddle: "In a city of ninety-one thousand and now, eighty five."

-- SQL:
SELECT name, country
FROM cities
WHERE population = 91085;

-- Answer: Cartago, Costa Rica
