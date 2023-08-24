-- Create first table
CREATE TABLE mentalhealthglobal (
     Entity VARCHAR(20),
     Code VARCHAR(4),
     Year INT,
     Schizophrenia (%) DECIMAL(15, 10),
     `Bipolar disorder (%)` DECIMAL(15, 10),
     `Eating disorders (%)` DECIMAL(15, 10),
     `Anxiety disorders (%)` DECIMAL(15, 10),
     `Drug use disorders (%)` DECIMAL(15, 10),
     Depression (%) DECIMAL(15, 10),
     `Alcohol use disorders (%)` DECIMAL(15, 10)
 );
-- Load data from the CSV file
LOAD DATA INFILE 'mentalhealth_global.csv'
INTO TABLE mentalhealthglobal
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- Investigators have requested that non-countries are to be separated and stored in new table.
CREATE TABLE mentalhealthglobal_regions (
     Entity VARCHAR(20),
     Code VARCHAR(4),
     Year INT,
     Schizophrenia (%) DECIMAL(15, 10),
     `Bipolar disorder (%)` DECIMAL(15, 10),
     `Eating disorders (%)` DECIMAL(15, 10),
     `Anxiety disorders (%)` DECIMAL(15, 10),
     `Drug use disorders (%)` DECIMAL(15, 10),
     Depression (%) DECIMAL(15, 10),
     `Alcohol use disorders (%)` DECIMAL(15, 10)
);
-- Insert non-country entities into the mentalhealthglobal_regions table and associate additional information
INSERT INTO mentalhealthglobal_regions
SELECT m.Entity, m.Code, m.Year, m.Schizophrenia, m.`Bipolar Disorder`, m.`Eating Disorders`,
       m.`Anxiety Disorders`, m.`Drug use disorders`, m.Depression, m.`Alcohol use disorder`,
       a.Additional_Column
FROM mentalhealthglobal m
LEFT JOIN additional_info a ON m.Entity = a.Entity
WHERE m.Entity IN ('Andean Latin America', 'Australasia', 'Carribean', 'Central Europe', 'Central Latin America',     
     'Central Sub-Saharan Africa', 'East Asia', 'Eastern Europe', 'Eastern Sub-Saharan Africa', 'High SDI', 'High-income', 
     'High-income Asia Pacific', 'High-middle SDI', 'Latin America and Caribbean', 'Low-middle SDI', 'Middle SDI', 
     'North Africa and Middle East', 'North America', 'Northern Ireland', 'Oceania', 'South Asia', 'Southeast Asia', 
     'Southeast Asia, East Asia, and Oceania', 'Southern Latin America', 'Southern Sub-Saharan Africa', 'Sub-Saharan Africa', 
     'Tropical Latin America', 'Western Europe', 'Western Sub-Saharan Africa', 'World'); 

DELETE FROM my_table
WHERE WHERE Entity IN ('Andean Latin America', 'Australasia', 'Carribean', 'Central Europe', 'Central Latin America',     
     'Central Sub-Saharan Africa', 'East Asia', 'Eastern Europe', 'Eastern Sub-Saharan Africa', 'High SDI', 'High-income', 
     'High-income Asia Pacific', 'High-middle SDI', 'Latin America and Caribbean', 'Low-middle SDI', 'Middle SDI', 
     'North Africa and Middle East', 'North America', 'Northern Ireland', 'Oceania', 'South Asia', 'Southeast Asia', 
     'Southeast Asia, East Asia, and Oceania', 'Southern Latin America', 'Southern Sub-Saharan Africa', 'Sub-Saharan Africa', 
     'Tropical Latin America', 'Western Europe', 'Western Sub-Saharan Africa', 'World'); 
