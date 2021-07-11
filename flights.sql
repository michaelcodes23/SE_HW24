\connect flights
--Copying the routes to the files full of data
-- COPY routes FROM '/Users/michaelletsgo/Documents/2021_General_Assembly/GA_exercises/jul21/sql-airplane-lab/routes.csv' DELIMITER ',' CSV;
-- COPY airports FROM '/Users/michaelletsgo/Documents/2021_General_Assembly/GA_exercises/jul21/sql-airplane-lab/airports.csv' DELIMITER ',' CSV;
-- COPY airlines FROM '/Users/michaelletsgo/Documents/2021_General_Assembly/GA_exercises/jul21/sql-airplane-lab/airlines.csv' DELIMITER ',' CSV;
-- CREATE TABLE airlines (
--   id int,
--   name varchar(255) DEFAULT NULL,
--   alias varchar(255) DEFAULT NULL,
--   iata varchar(255) DEFAULT NULL,
--   icao varchar(255) DEFAULT NULL,
--   callsign varchar(255) DEFAULT NULL,
--   country varchar(255) DEFAULT NULL,
--   active varchar(255) DEFAULT NULL
-- );
-- CREATE TABLE airports (
--   id int,
--   name varchar(255) DEFAULT NULL,
--   city varchar(255) DEFAULT NULL,
--   country varchar(255) DEFAULT NULL,
--   iata_faa varchar(255) DEFAULT NULL,
--   icao varchar(255) DEFAULT NULL,
--   latitude varchar(255) DEFAULT NULL,
--   longitude varchar(255) DEFAULT NULL,
--   altitude varchar(255) DEFAULT NULL,
--   utc_offset varchar(255) DEFAULT NULL,
--   dst varchar(255) DEFAULT NULL,
--   tz varchar(255) DEFAULT NULL
-- );
-- CREATE TABLE routes (
--   airline_code varchar(255) DEFAULT NULL,
--   airline_id int DEFAULT NULL,
--   origin_code varchar(255) DEFAULT NULL,
--   origin_id int DEFAULT NULL,
--   dest_code varchar(255) DEFAULT NULL,
--   dest_id int DEFAULT NULL,
--   codeshare varchar(255) DEFAULT NULL,
--   stops int DEFAULT NULL,
--   equipment varchar(255) DEFAULT NULL
-- );
-- SELECT * FROM airports LIMIT 10;

--GOALS:
--1. Select airport code LIKE for 'John F Kennedy' or 'De Gaulle
SELECT iata_faa FROM airports
WHERE name LIKE 'John F Kennedy%'
OR name LIKE '%De Gaulle';
--2. Select all flights originating from 'JFK' AND going to 'CDG'
Select * FROM routes
WHERE origin_code = 'JFK'
AND dest_code = 'CDG';
--3.Find out the NUMBER of airports in Canada.
SELECT COUNT(*) FROM airports
WHERE country = 'Canada';


--4.Select airport names IN the following countries- Algeria, Ghana, Ethiopia, order by country.
SELECT name, country FROM airports 
WHERE country IN ('Algeria','Ghana','Ethiopia')
ORDER BY country;

--5. Select all the airports that airlines 'Germania' flies from.
SELECT DISTINCT (b.name, b.country) as airports
FROM routes r, airlines a, airports b
WHERE a.id = r.airline_id
AND r.origin_code = b.iata_faa
AND a.name = 'Germania'