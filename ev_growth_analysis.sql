-- Table: public.ev_population

-- DROP TABLE IF EXISTS public.ev_population;

CREATE TABLE IF NOT EXISTS public.ev_population
(
    vin character varying(10) COLLATE pg_catalog."default",
    county character varying(255) COLLATE pg_catalog."default",
    city character varying(255) COLLATE pg_catalog."default",
    state character varying(255) COLLATE pg_catalog."default",
    postal_code character varying(10) COLLATE pg_catalog."default",
    model_year integer,
    make character varying(255) COLLATE pg_catalog."default",
    model character varying(255) COLLATE pg_catalog."default",
    electric_vehicle_type character varying(255) COLLATE pg_catalog."default",
    cafv_eligibility character varying(255) COLLATE pg_catalog."default",
    electric_range integer,
    base_msrp numeric(18,2),
    legislative_district integer,
    dol_vehicle_id character varying(255) COLLATE pg_catalog."default",
    vehicle_location character varying(255) COLLATE pg_catalog."default",
    electric_utility character varying(255) COLLATE pg_catalog."default",
    census_tract_2020 character varying(255) COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.ev_population
    OWNER to postgres;
	
	
--Q1: What is the overall trend in the growth of EV population overtime?


 SELECT MODEL_YEAR AS Registration_Year, COUNT(*) AS Car_Count
 FROM EV_POPULATION
 WHERE Model_year != 2024
 GROUP BY Registration_Year
 ORDER BY Registration_Year;
 
 --Q2: Which specific EV manufacturer are most prevalent?

 SELECT make AS manufacturer, count (dol_vehicle_id) AS car_count
 FROM EV_POPULATION
 WHERE Make IS NOT NULL
 GROUP BY Make
 ORDER BY Car_Count DESC
 LIMIT 1;
 
 --Q3: Which City has the most EV registration?

 SELECT City, count (dol_vehicle_id) AS car_count
 FROM EV_POPULATION
 GROUP BY City
 ORDER BY Car_Count DESC
 LIMIT 1

 
