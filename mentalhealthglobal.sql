-- Array of unique entities
DECLARE entities_array ARRAY<STRING>;
SET entities_array = ['Andean Latin America', 'Australasia', 'Caribbean', 'Central Europe', 'Central Latin America',     
     'Central Sub-Saharan Africa', 'East Asia', 'Eastern Europe', 'Eastern Sub-Saharan Africa', 'High SDI', 'High-income', 
     'High-income Asia Pacific', 'High-middle SDI', 'Latin America and Caribbean', 'Low-middle SDI', 'Middle SDI', 
     'North Africa and Middle East', 'North America', 'Northern Ireland', 'Oceania', 'South Asia', 'Southeast Asia', 
     'Southeast Asia, East Asia, and Oceania', 'Southern Latin America', 'Southern Sub-Saharan Africa', 'Sub-Saharan Africa', 
     'Tropical Latin America', 'Western Europe', 'Western Sub-Saharan Africa', 'World'];

CREATE TABLE db1.mentalhealthglobal_regions (
  Entity STRING,
  Code STRING,
  Year INT64,
  Schizophrenia NUMERIC,
  Bipolar_disorder NUMERIC,
  Eating_disorders NUMERIC,
  Anxiety_disorders NUMERIC,
  Drug_use_disorders NUMERIC,
  Depression NUMERIC,
  Alcohol_use_disorders NUMERIC
);
-- Adding non-countries to new table
INSERT INTO `db1.mentalhealthglobal_regions`
SELECT *
FROM `db1.mentalhealthglobal`
WHERE Entity IN UNNEST(entities_array);

-- Inserting data into the destination table based on the entities_array
INSERT INTO `db1.mentalhealthglobal_regions`
SELECT m.*,
       a.Code,
       a.Year,
       a.Schizophrenia,
       a.Bipolar_disorder,
       a.Eating_disorders,
       a.Anxiety_disorders,
       a.Drug_use_disorders,
       a.Depression,
       a.Alcohol_use_disorders

FROM `db1.mentalhealthglobal` m
LEFT JOIN `db1.mentalhealthglobal_regions` a
ON m.Entity = a.Entity
WHERE m.Entity IN UNNEST(entities_array);
