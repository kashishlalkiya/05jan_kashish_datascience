create database assesment_db;

use assesment_db;

CREATE TABLE city(
	id INT (11) UNSIGNED NOT NULL,
    city_name VARCHAR(25),
    lat float(20),
    city_long float(20),
    country_id INT (11) UNSIGNED NOT NULL,
    primary key(id),
    foreign key(country_id) REFERENCES country(id)
);
    
CREATE TABLE customer(
	id INT (11) UNSIGNED NOT NULL,
    customer_name VARCHAR(50),
    city_id INT (11) UNSIGNED NOT NULL,
    cutomer_address varchar(50),
    next_call_date date,
    ts_inserted datetime,
    primary key(id),
    foreign key(city_id) REFERENCES city(id)) ;
    
CREATE TABLE country(
	id INT (11) UNSIGNED NOT NULL,
    country_name varchar(50),
    country_name_eng varchar(50),
    country_code varchar(50),
    primary key(id)
);

/*--------------------------------Data for the table City------------------------------------- */
INSERT INTO city(id,city_name,lat,city_long,country_id) VALUES (1,"Berlin",52.520008,13.404954,1);
INSERT INTO city(id,city_name,lat,city_long,country_id) VALUES (2,"Belgrade",44.787191,20.457273,2);
INSERT INTO city(id,city_name,lat,city_long,country_id) VALUES (3,"Zagreb",45.815399,15.966568,3);
INSERT INTO city(id,city_name,lat,city_long,country_id) VALUES (4,"New York",40.730610,-73.935242,4);
INSERT INTO city(id,city_name,lat,city_long,country_id) VALUES (5,"Los Angles",34.052235,-118.243683,4);
INSERT INTO city(id,city_name,lat,city_long,country_id) VALUES (6,"Warsaw",52.237049,21.017532,5);

select * from city;

/*--------------------------------Data for the table Customer------------------------------------- */
INSERT INTO customer(id,customer_name,city_id,cutomer_address,next_call_date,ts_inserted) VALUES (1,"Jewelry Store",4,"Long Street 120","2020-01-21","2020-01-09 14:01:20.000");
INSERT INTO customer(id,customer_name,city_id,cutomer_address,next_call_date,ts_inserted) VALUES (2, "Bakery",1,"Kurfurstendamm 20","2020-02-21","2020-01-09 17:52:15.000");
INSERT INTO customer(id,customer_name,city_id,cutomer_address,next_call_date,ts_inserted) VALUES (3,"Cafe",1,"Tauentzienstrabe 44","2020-01-21","2020-01-21 08:02:49.000");
INSERT INTO customer(id,customer_name,city_id,cutomer_address,next_call_date,ts_inserted) VALUES (4,"Restaurant",5,"Ulica lipa 15","2020-01-21","2020-01-21 09:20:21.000");

select * from customer;

/*--------------------------------Data for the table country------------------------------------- */
INSERT INTO country(id,country_name,country_name_eng,country_code) VALUES (1,"Deutchland","Germany","DEU");
INSERT INTO country(id,country_name,country_name_eng,country_code) VALUES (2,"Sarbija","Serbia","SRB");
INSERT INTO country(id,country_name,country_name_eng,country_code) VALUES (3,"Hrvatska","Croatia","HRV");
INSERT INTO country(id,country_name,country_name_eng,country_code) VALUES (4,"United States of America","United States of America","USA");
INSERT INTO country(id,country_name,country_name_eng,country_code) VALUES (5,"Polska","Poland","POL");
INSERT INTO country(id,country_name,country_name_eng,country_code) VALUES (6,"Espana","Spain","ESP");
INSERT INTO country(id,country_name,country_name_eng,country_code) VALUES (7,"Rossiya","Rossia","RUS");

select * from country;

/*------------------------------Question Answere---------------------------------------------------*/
-- Task : 1 (join multiple tables using left join)
-- List all Countries and customers related to these countries.
-- For each country displaying its name in English, the name of the city customer is located in as 
-- well as the name of the customer. 
-- Return even countries without related cities and customers

select k.country_name as "Country Name",k.country_name_eng as "Country English",c.city_name as "City Name",u.customer_name as "Customer Name" 
from country k left join city c on k.id = c.country_id left join customer u on c.id = u.city_id;

-- Task : 2 (join multiple tables using both left and inner join)
-- Return the list of all countries that have pairs(exclude countries which are not referenced by any 
-- city). For such pairs return all customers.
-- Return even pairs of not having a single customer

select k.country_name as "Country Name",c.city_name as "City Name",u.customer_name as "Customer Name" 
from country k left join city c on k.id = c.country_id inner join customer u on c.id = u.city_id;