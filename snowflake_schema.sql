--CREATE INDEPENDENT (DIMENSION) TABLES
CREATE table country (
	country_id INT PRIMARY KEY,
	country VARCHAR(50),
	last_update DATE
);


create table language (
	language_id INT primary key,
	name VARCHAR (50),
	last_update DATE
);


create table actor (
	actor_id INT primary key,
	first_name VARCHAR (50),
	last_name VARCHAR (50),
	last_update DATE
)


create table category (
	category_id INT primary key,
	name VARCHAR (50),
	last_update DATE
)


--CREATE DEPENDENT (FACT) TABLES

CREATE TABLE customer (
	customer_id INT PRIMARY KEY,
	store_id INT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(50),
	address_id INT,
	activebool BOOLEAN,
	create_date DATE,
	last_update DATE,
	active INT,
		FOREIGN KEY (address_id) REFERENCES address (address_id),
		FOREIGN KEY (store_id) REFERENCES store (store_id)
);

CREATE TABLE address (
	address_id INT primary key,
	address VARCHAR(50),
	address2 VARCHAR(50),
	district VARCHAR(50),
	city_id BIGINT,
	postal_code BIGINT,
	phone BIGINT,
	last_update DATE,
		FOREIGN KEY (city_id) REFERENCES city (city_id)
);

CREATE TABLE city (
	city_id INT PRIMARY KEY,
	city VARCHAR(50),
	country_id INT,
	last_update DATE,
		FOREIGN KEY (country_id) REFERENCES country (country_id)
);

CREATE TABLE rental (
	rental_id INT PRIMARY KEY, 
	rental_date DATE,
	inventory_id INT,
	customer_id INT,
	return_date DATE,
	staff_id INT,
	last_update DATE,
		FOREIGN KEY (staff_id) REFERENCES staff (staff_id),
		FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
		FOREIGN KEY (inventory_id) REFERENCES inventory (inventory_id)
);

CREATE TABLE payment(
	payment_id INT PRIMARY KEY,
	customer_id INT, 
	staff_id INT,	
	rental_id INT,
	amount DECIMAL (10,2),
	last_update DATE,
		FOREIGN KEY (rental_id) REFERENCES rental (rental_id),
		FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
		FOREIGN KEY (staff_id) REFERENCES staff (staff_id)
);

alter table staff add constraint staff_pk primary key (staff_id);
CREATE TABLE staff (
	staff_id INT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	address_id INT,
	email VARCHAR(50),
	store_id INT,
	active BOOLEAN,
	username VARCHAR(50),
	password VARCHAR(50),
	last_update DATE,
	picture BYTEA,
		FOREIGN KEY (address_id) REFERENCES address (address_id),
		FOREIGN KEY (store_id) REFERENCES store (store_id)
);

CREATE TABLE store (
	store_id INT primary key,
	manager_staff_id INT,
	address_id INT,
	last_update DATE,
		FOREIGN KEY (address_id) REFERENCES address (address_id)
);


create table film (
	film_id INT primary key,
	title VARCHAR (50),
	description VARCHAR (200),
	Released_year DATE,
	language_id INT,
	original_language_id INT,
	rental_duration INT,
	rental_rate INT,
	length INT,
	replacement_cost DECIMAL (10, 2),
	rating VARCHAR (50),
	last_update DATE,
	special_features VARCHAR (100),
	fulltext VARCHAR (300),
		FOREIGN KEY (language_id) REFERENCES language (language_id)
);

 
create table film_category (--7
	film_id INT,
	category_id INT,
	last_update DATE,
		FOREIGN KEY (film_id) REFERENCES film (film_id),
		FOREIGN KEY (category_id) REFERENCES category (category_id)
);


create table film_actor (
	actor_id INT,
	film_id INT,
	last_update DATE,
		FOREIGN KEY (actor_id) REFERENCES actor (actor_id),
		FOREIGN KEY (film_id) REFERENCES film (film_id)
);


create table inventory (
	inventory_id INT primary key,
	film_id INT,
	store_id INT,
	last_update DATE,
		FOREIGN KEY (film_id) REFERENCES film (film_id),
		FOREIGN KEY (store_id) REFERENCES store (store_id)
);

--CASE
select c.first_name,
		c.last_name,
		c.customer_id,
		p.amount,
		case
			when amount < 4 then 'Basic'
			when amount < 8 then 'Moderate'
			when amount < 12 then 'Costly'
			else 'uncaught exception'
		end as price_details
		
from customer c
join payment p
	on c.customer_id = p.customer_id
	
	
--CONCATENATE
select *,
	concat(first_name, '  ', last_name) as actor_fullname
from actor
	
