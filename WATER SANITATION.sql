CREATE DATABASE axia_africa_project;

-- created the table using the table data import wizard 

SELECT *
FROM water_supply_sanitation;

-- the average water availability (liters per capita per day) for each country
SELECT country, AVG(water_availability) AS avg_water_availability
FROM water_supply_sanitation
GROUP BY country
ORDER BY avg_water_availability DESC;

--  retrieving the details of communities where at least one water point is non-functional.
SELECT *
FROM water_supply_sanitation
WHERE Non_Functional_Water_Points >0;

-- top 5 communities with the highest annual sanitation maintenance costs.
SELECT *
FROM water_supply_sanitation
ORDER BY Annual_Maintenance_Cost DESC
LIMIT 5;

-- total number of functional water points per country
SELECT country,
  SUM(functional_water_points) AS total_functional_points
FROM water_supply_sanitation
GROUP BY country
ORDER BY total_functional_points DESC;

-- total number of non-functional water points per country
SELECT country,
  SUM(Non_Functional_Water_Points) AS total_non_functional_points
FROM water_supply_sanitation
GROUP BY country
ORDER BY total_non_functional_points DESC;

-- communities with high incidence of water borne diseases
SELECT *
FROM water_supply_sanitation
WHERE Waterborne_Diseases_Incidence_Rate >20;

-- average distance to the water source per region
SELECT region,
AVG(avg_distance_to_water_source) AS avg_distance
FROM water_supply_sanitation
GROUP BY region
ORDER BY avg_distance DESC;

-- communities that receive both government and NGO support
SELECT Community_Name
FROM water_supply_sanitation
WHERE Government_Support = 'yes'
AND NGO_Support='yes';

-- communities with the highest population per county
SELECT *
FROM water_supply_sanitation AS WSS
WHERE Population=(
  SELECT MAX(Population)
  FROM water_supply_sanitation
  WHERE Country= WSS.Country
  );
  
  -- communities with the highest population per county
SELECT Community_Name, Country, Population
FROM water_supply_sanitation AS WSS
WHERE Population=(
  SELECT MAX(Population)
  FROM water_supply_sanitation
  WHERE Country= WSS.Country
  );











