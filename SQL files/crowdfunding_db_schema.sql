-- Database: crowdfunding_db

-- DROP DATABASE IF EXISTS crowdfunding_db;
CREATE DATABASE crowdfunding_db
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
	
-- Create a table "category"
CREATE TABLE IF NOT EXISTS category (
  category_id VARCHAR(10) NOT NULL,
  category VARCHAR(30) NOT NULL,
  PRIMARY KEY (category_id)
);


-- Create a table "subcategory"
CREATE TABLE IF NOT EXISTS subcategory (
  subcategory_id VARCHAR(10) NOT NULL,
  subcategory VARCHAR(30) NOT NULL,
  PRIMARY KEY (subcategory_id)
);

-- Create a table "contacts"
CREATE TABLE IF NOT EXISTS contacts (
    contact_id INTEGER NOT NULL,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    email VARCHAR(100),
	PRIMARY KEY (contact_id)
);

-- Create a table "campaign"
CREATE TABLE IF NOT EXISTS campaign (
  	cf_id INTEGER NOT NULL,
    contact_id INTEGER,
    company_name VARCHAR(50),
    description TEXT,
    goal FLOAT, -- Using FLOAT for potentially better performance
    pledged FLOAT, -- Using FLOAT for potentially better performance
    outcome VARCHAR(20),
    backers_count INTEGER,
    country CHAR(2),
    currency CHAR(3),
    launch_date DATE,
    end_date DATE,
    category_id VARCHAR(10),
    subcategory_id VARCHAR(10),
	PRIMARY KEY (cf_id),
	FOREIGN KEY (contact_id) REFERENCES contacts(contact_id),
	FOREIGN KEY (category_id) REFERENCES category(category_id),
    FOREIGN KEY (subcategory_id) REFERENCES subcategory(subcategory_id)
);

--Please import the CSV files into their respective tables in the following order:
-- 1. import category.csv to table category
-- 2. import subcategory.csv to table subcategory
-- 3. import contacts.csv to table contacts
-- 4. import campaign.csv to table campaign


SELECT * FROM category;

SELECT * FROM subcategory;

SELECT * FROM contacts;

SELECT * FROM campaign;


