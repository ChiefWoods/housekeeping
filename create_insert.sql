DROP INDEX index_house_type;
DROP INDEX index_service_hours;
DROP INDEX index_commission_rate;

DROP VIEW view_employee;
DROP VIEW view_house;

DROP TABLE service;
DROP TABLE house;
DROP TABLE customer;
DROP TABLE employee;
DROP TABLE supervisor;
DROP TABLE gift;

CREATE TABLE gift (
  gift_id NUMBER(4) PRIMARY KEY,
  gift_type VARCHAR(64) NOT NULL,
  gift_price NUMBER(*, 2) NOT NULL
);

CREATE TABLE supervisor (
  supervisor_id NUMBER(4) PRIMARY KEY,
  first_name VARCHAR(32) NOT NULL,
  last_name VARCHAR(32) NOT NULL,
  gender CHAR, CONSTRAINT check_supervisor_gender CHECK (gender IN ('M', 'F')),
  phone_number VARCHAR(32) NOT NULL, CONSTRAINT unique_supervisor_number UNIQUE (phone_number)
);

CREATE TABLE employee (
  employee_id NUMBER(4) PRIMARY KEY,
  supervisor_id NUMBER(4), FOREIGN KEY (supervisor_id) REFERENCES supervisor(supervisor_id),
  first_name VARCHAR(32) NOT NULL,
  last_name VARCHAR(32) NOT NULL,
  gender CHAR, CONSTRAINT check_employee_gender CHECK (gender IN ('M', 'F')),
  street VARCHAR(256),
  city VARCHAR(32),
  town VARCHAR(32),
  state VARCHAR(32),
  postcode NUMBER(5),
  phone_number VARCHAR(32) NOT NULL, CONSTRAINT unique_employee_number UNIQUE (phone_number),
  salary FLOAT(2) NOT NULL, CONSTRAINT check_salary CHECK (salary >= 1500),
  service_hours NUMBER(4) NOT NULL,
  commission_rate FLOAT(2) NOT NULL
);

CREATE TABLE customer (
  customer_id NUMBER(4) PRIMARY KEY,
  gift_id NUMBER(4), FOREIGN KEY (gift_id) REFERENCES gift(gift_id),
  first_name VARCHAR(32) NOT NULL,
  last_name VARCHAR(32) NOT NULL,
  gender CHAR(1), CONSTRAINT check_customer_gender CHECK (gender IN ('M', 'F')),
  phone_number VARCHAR(32) NOT NULL
);

CREATE TABLE house (
  house_id NUMBER(4) PRIMARY KEY,
  customer_id NUMBER(4), FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  house_type NCHAR(2) NOT NULL, CONSTRAINT check_house_type CHECK (house_type IN ('CD', 'AP', 'SD', 'BG')),
  street VARCHAR(256),
  city VARCHAR(32) NOT NULL,
  town VARCHAR(32) NOT NULL,
  state VARCHAR(32) NOT NULL, CONSTRAINT check_house_state CHECK (state IN ('Selangor')),
  postcode NUMBER(5) NOT NULL
);

CREATE TABLE service (
  service_id NUMBER(4) PRIMARY KEY,
  house_id NUMBER(4), FOREIGN KEY (house_id) REFERENCES house(house_id),
  supervisor_id NUMBER(4), FOREIGN KEY (supervisor_id) REFERENCES supervisor(supervisor_id),
  service_date DATE NOT NULL
);

ALTER session set NLS_DATE_FORMAT = 'DD/MM/YYYY';

INSERT INTO gift VALUES (6001, 'Smart Phone', 1200);
INSERT INTO gift VALUES (6002, 'TV', 1500);
INSERT INTO gift VALUES (6003, 'Sofa', 600);
INSERT INTO gift VALUES (6004, 'Table', 300);
INSERT INTO gift VALUES (6005, 'Chair', 150);
INSERT INTO gift VALUES (6006, 'Laptop', 1600);
INSERT INTO gift VALUES (6007, 'Tablet', 800);
INSERT INTO gift VALUES (6008, 'T-Shirt', 60);
INSERT INTO gift VALUES (6009, 'Calender', 30);
INSERT INTO gift VALUES (6010, 'Cap', 20);

INSERT INTO supervisor VALUES (2010, 'Liam', 'Smith', 'M', '012-3726293');
INSERT INTO supervisor VALUES (2020, 'Olivia', 'Johnson', 'F', '011-1025632');
INSERT INTO supervisor VALUES (2030, 'James', 'Jones', 'M', '014-7392071');
INSERT INTO supervisor VALUES (2040, 'Benjamin', 'Garcia', 'M', '012-3262623');
INSERT INTO supervisor VALUES (2050, 'Lylla', 'Davis', 'F', '011-8882634');
INSERT INTO supervisor VALUES (2060, 'Henry', 'Miller', 'M', '018-2936466');
INSERT INTO supervisor VALUES (2070, 'Theodore', 'Brown', 'M', '018-2735493');
INSERT INTO supervisor VALUES (2080, 'Isabella', 'Lee', 'F', '012-3946599');
INSERT INTO supervisor VALUES (2090, 'Evelyn', 'Moore', 'F', '017-2735223');
INSERT INTO supervisor VALUES (2100, 'Sophia', 'Robinson', 'F', '017-2009372');
INSERT INTO supervisor VALUES (2110, 'Jennifer', 'Bright', 'F', '013-4762353');
INSERT INTO supervisor VALUES (2120, 'Ellie', 'Webster', 'F', '012-3846451');
INSERT INTO supervisor VALUES (2130, 'Crystal', 'Leach', 'F', '011-2836451');
INSERT INTO supervisor VALUES (2140, 'Alvin', 'Jackson', 'M', '018-3454545');
INSERT INTO supervisor VALUES (2150, 'Oscar', 'Levy', 'M', '019-2826341');

INSERT INTO employee VALUES (2011, 2010, 'Jayson', 'Levy', 'M', 'Persiaran Puchong Jaya Selatan Skypod Residence Tower 2 Unit 05-05', 'Puchong', 'Puchong Jaya', 'Selangor', 47100, '012-3883273', 1600, 12, 15);
INSERT INTO employee VALUES (2012, 2010, 'Kaine', 'Rivers', 'F', 'Jalan Tasik Prima 6/2', 'Puchong', 'Puchong Jaya', 'Selangor', 47100, '014-2735521', 2000, 12, 15);
INSERT INTO employee VALUES (2013, 2040, 'Celeste', 'Jackson', 'F', 'Persiaran Wawasan, Pusat Bandar Puchong Brio Setia Walk (R2-23-09)', 'Puchong', 'Puchong Jaya', 'Selangor', 47100, '011-2736542', 1750, 12, 15);
INSERT INTO employee VALUES (2021, 2020, 'Haris', 'Lam', 'M', 'Jalan Layang - Layang 1 Skypod Residence', 'Puchong', 'Puchong Jaya', 'Selangor', 47100, '013-2938451', 2000, 8, 10);
INSERT INTO employee VALUES (2022, 2080, 'Sylvie', 'Jefferson', 'F', 'Jalan Puchong Taman, Putra Perdana', 'Puchong', 'Puchong Jaya', 'Selangor', 47130, '018-2836451', 1800, 8, 10);
INSERT INTO employee VALUES (2031, 2030, 'Eleri', 'Houston', 'F', 'Jalan Putra Perdana 16', 'Puchong', 'Puchong Jaya', 'Selangor', 47130, '019-2364617', 1900, 16, 20);
INSERT INTO employee VALUES (2032, 2030, 'Kyra', 'Klein', 'F', 'Setiawalk Mall Puchong', 'Puchong', 'Puchong Jaya', 'Selangor', 47160, '012-3947561', 1800, 16, 20);
INSERT INTO employee VALUES (2033, 2040, 'Todd', 'James', 'M', 'Jalan 13/1 Seksyen 13', 'Bandar Sunway', 'Petaling Jaya', 'Selangor', 46200, '013-1333321', 1700, 12, 20);
INSERT INTO employee VALUES (2034, 2110, 'Josie', 'Barron', 'F', 'Jalan PJU 8/8A, Damansara Perdana', 'Bandar Sunway', 'Petaling Jaya', 'Selangor', 47820, '018-2999912', 2100, 16, 20);
INSERT INTO employee VALUES (2041, 2040, 'Nadine', 'Dennis', 'F', 'Alia Damansara Hotel, Empire Damansara, Damansara Perdana', 'Bandar Sunway', 'Petaling Jaya', 'Selangor', 47820, '013-2938751', 1900, 16, 25);
INSERT INTO employee VALUES (2042, 2100, 'Kezia', 'Fishcer', 'F', 'No. 116 FAS Business Avenue Off, Jalan Perbandaran, SS3', 'Kelana Jaya', 'Petaling Jaya', 'Selangor', 47300, '012-3948571', 1900, 20, 25);
INSERT INTO employee VALUES (2043, 2060, 'Margaret', 'Mckinney', 'F', 'No. 2 Jalan Barat', 'Bandar Sunway', 'Petaling Jaya', 'Selangor', 46200, '017-8237361', 1600, 20, 25);
INSERT INTO employee VALUES (2044, 2110, 'Spencer', 'Santiago', 'M', '8A Jalan Jelita 1, Taman Jelita', 'Hulu Langat', 'Kajang', 'Selangor', 43000, '011-2393746', 1700, 20, 25);
INSERT INTO employee VALUES (2045, 2060, 'Ryan', 'Cook', 'M', 'No. 20, Jalan Puteri 2A/8', 'Bandar Puteri Bangi', 'Kajang', 'Selangor', 43000, '013-2394756', 1850, 20, 25);
INSERT INTO employee VALUES (2051, 2050, 'Issac', 'Chavez', 'M', 'Lot 1 & 2, 1st Floor, Jalan Jelok 6, Metro Point', 'Bandar Puteri Bangi', 'Kajang', 'Selangor', 43000, '014-3943757', 2000, 20, 20);
INSERT INTO employee VALUES (2052, 2050, 'Jamal', 'Delgado', 'M', 'No. 121, Jalan PJS 11/2, Subang Indah', 'Bandar Sunway', 'Petaling Jaya', 'Selangor', 46150, '012-3948881', 1900, 16, 20);
INSERT INTO employee VALUES (2053, 2120, 'Allen', 'Watkins', 'M', 'No. 83, Pusat Perniagaan NBC, 1 1/2 Miles, Jalan Meru', 'Klang', 'Klang', 'Selangor', 41050, '013-2394858', 1700, 16, 20);
INSERT INTO employee VALUES (2054, 2120, 'Jim', 'Herrera', 'M', '263, Jalan Meru, Kawasan 19, Klang Selangor', 'Klang', 'Klang', 'Selangor', 41050, '014-3945771', 1700, 16, 20);
INSERT INTO employee VALUES (2061, 2060, 'Mabel', 'Waller', 'M', '2, Jalan Batu Unjur 1, Taman Bayu Perdana', 'Klang', 'Klang', 'Selangor', 41200, '012-3575771', 1850, 16, 10);
INSERT INTO employee VALUES (2062, 2060, 'Annie', 'Foley', 'F', 'Landmark Residence 1, Jalan Sungai Long', 'Kuala Lumpur', 'Cheras', 'Selangor', 43000, '018-4856141', 2050, 8, 10);
INSERT INTO employee VALUES (2071, 2070, 'Ibrahim', 'Fuentes', 'M', 'Jalan Simfoni 2', 'Hulu Langat', 'Cheras', 'Selangor', 43200, '017-4857515', 1700, 12, 15);
INSERT INTO employee VALUES (2072, 2070, 'Freya', 'Francis', 'F', '2, Jalal BS 9, Taman Bukit Segar', 'Hulu Langat', 'Cheras', 'Selangor', 43200, '018-5857363', 1650, 12, 15);
INSERT INTO employee VALUES (2073, 2130, 'Cameron', 'Ho', 'M', 'No. 1, Jalan Kasturi 3, Plaza Kasturi Cheras', 'Balakong', 'Cheras', 'Selangor', 43200, '011-2394756', 1500, 12, 15);
INSERT INTO employee VALUES (2081, 2080, 'Connor', 'Olson', 'M', '11, Jalan C180/1, Dataran C180', 'Cheras Selatan', 'Cheras', 'Selangor', 43200, '013-5958712', 1700, 8, 10);
INSERT INTO employee VALUES (2082, 2080, 'Karina', 'Mccall', 'F', 'No. 16, Jalan Sulaiman 1, Taman Putra Sulaiman', 'Gombak', 'Ampang', 'Selangor', 68000, '014-3958571', 1600, 8, 10);
INSERT INTO employee VALUES (2091, 2090, 'Ines', 'Riley', 'F', 'No. 8, Jalan Draviden, Bandar Baru Ampang', 'Kuala Lumpur', 'Ampang', 'Selangor', 68000, '012-4957561', 1650, 16, 20);
INSERT INTO employee VALUES (2092, 2130, 'Nina', 'Yoder', 'F', 'No. 14, Jalan Mamanda 5, Taman Dato Ahmad Razali', 'Kuala Lumpur', 'Ampang', 'Selangor', 68000, '013-8575122', 1800, 16, 20);
INSERT INTO employee VALUES (2093, 2090, 'Andy', 'Armstrong', 'M', 'Jalan PJU 5/18, Dataran Sunway', 'Kota Damansara', 'Petaling Jaya', 'Selangor', 47810, '012-3575751', 1800, 16, 20);
INSERT INTO employee VALUES (2094, 2140, 'Tyrese', 'Meyer', 'F', 'B-G-29, Block B, Pelangi Square, Pelangi Damansara, PJU 6, Persiaran Surian', 'Kota Damansara', 'Petaling Jaya', 'Selangor', 47810, '011-2397457', 1700, 16, 20);
INSERT INTO employee VALUES (2101, 2100, 'Aliya', 'Ayers', 'F', 'No. 3-1, Jalan PJU 5/20A, The Strand', 'Kota Damansara', 'Petaling Jaya', 'Selangor', 47810, '011-9557562', 1650, 20, 25);
INSERT INTO employee VALUES (2102, 2150, 'Mollie', 'Benson', 'F', 'Emporis Kota Damansara, Persiaran Surian Seksyen 3, Taman Sains Selangor', 'Kota Damansara', 'Petaling Jaya', 'Selangor', 47810, '012-3957571', 1900, 20, 25);
INSERT INTO employee VALUES (2103, 2010, 'Louisa', 'Carpenter', 'F', 'PT 7259, Ivory One, Jalan Desa Permai', 'Bandar Country Homes', 'Rawang', 'Selangor', 48000, '014-0358575', 1800, 20, 25);
INSERT INTO employee VALUES (2104, 2020, 'Deborah', 'Hill', 'F', '39, Jalan Anggerik 5d/1', 'Gombak', 'Rawang', 'Selangor', 48300, '018-3382123', 1850, 20, 25);
INSERT INTO employee VALUES (2105, 2020, 'Cohen', 'Trevino', 'M', '91, Jalan Desa 1/7', 'Bandar Country Homes', 'Rawang', 'Selangor', 48000, '019-5957572', 1600, 20, 25);

INSERT INTO customer VALUES (8001, 6001, 'Levi', 'Young', 'M', '012-3872543');
INSERT INTO customer VALUES (8002, 6002, 'Emma', 'Sanchez', 'F', '017-2930451');
INSERT INTO customer VALUES (8003, 6003, 'Daniel', 'Hill', 'M', '014-2394622');
INSERT INTO customer VALUES (8004, 6004, 'Scarlett', 'Flores', 'F', '019-2735321');
INSERT INTO customer VALUES (8005, 6005, 'Logan', 'Smith', 'M', '011-2934212');
INSERT INTO customer VALUES (8006, 6006, 'Cynthia', 'Vanne', 'F', '013-2337362');
INSERT INTO customer VALUES (8007, 6007, 'Josh', 'Malone', 'M', '017-3736213');
INSERT INTO customer VALUES (8008, 6008, 'Elissa', 'Cruz', 'F', '014-2823661');
INSERT INTO customer VALUES (8009, 6009, 'Bruce', 'Hansen', 'M', '019-2936352');
INSERT INTO customer VALUES (8010, 6010, 'Suzanne', 'Hogan', 'F', '012-3836212');

INSERT INTO house VALUES (3071, 8001, 'CD', 'Palmville Resort Condominium, 3, Jalan Lagoon Timur (9/1)', 'Bandar Sunway', 'Subang Jaya', 'Selangor', 47500);
INSERT INTO house VALUES (3072, 8005, 'AP', 'Jalan PJS 11/6', 'Bandar Sunway', 'Petaling Jaya', 'Selangor', 47500);
INSERT INTO house VALUES (3073, 8002, 'SD', 'One Park USJ', 'Bandar Sunway', 'Subang Jaya', 'Selangor', 40150);
INSERT INTO house VALUES (3074, 8003, 'BG', 'Lakeview Bungalows, 43A, Saujana Resort', 'Bukit Jelutong', 'Shah Alam', 'Selangor', 40150);
INSERT INTO house VALUES (3075, 8006, 'SD', 'Persiaran Mimbar', 'Bukit Jelutong', 'Shah Alam', 'Selangor', 40150);
INSERT INTO house VALUES (3076, 8007, 'AP', 'Pangsapuri Lagoon Perdana, Jalan PJS 9/1', 'Bandar Sunway', 'Petaling Jaya', 'Selangor', 47500);
INSERT INTO house VALUES (3077, 8008, 'CD', 'G1, Impian Meridian Condominium, Jalan Subang 1', 'USJ 1', 'Subang Jaya', 'Selangor', 47600);
INSERT INTO house VALUES (3078, 8009, 'AP', 'Jalan PJS 10/11A', 'PJS 10', 'Petaling Jaya', 'Selangor', 46150);
INSERT INTO house VALUES (3079, 8010, 'SD', '4, Jalan Aman Perdana 3c/Ku5', 'Aman Perdana', 'Klang', 'Selangor', 42200);
INSERT INTO house VALUES (3080, 8004, 'BG', '2, Persiaran Titiwangsa, Titiwangsa', 'Kuala Lumpur', 'Titwangsa', 'Selangor', 53200);
INSERT INTO house VALUES (3081, 8008, 'SD', 'Jalan 13/1 Seksyen 13', 'Bandar Sunway', 'Petaling Jaya', 'Selangor', 46200);
INSERT INTO house VALUES (3082, 8005, 'BG', 'C-05-02, Utropolis Suites, Jalan Kontraktor U1/14, Seksyen U1', 'Bukit Jelutong', 'Shah Alam', 'Selangor', 40150);
INSERT INTO house VALUES (3083, 8001, 'AP', 'A-21-06, The Arc Persiaran Bestari', 'Cyberjaya', 'Putrajaya', 'Selangor', 63000);
INSERT INTO house VALUES (3084, 8004, 'CD', 'Sunway Gandaria Residences', 'Hulu Langat', 'Bangi', 'Selangor', 43650);
INSERT INTO house VALUES (3085, 8009, 'SD', 'Lingkaran Cyber Point Timur, Cyber 12', 'Cyberjaya', 'Putrajaya', 'Selangor', 63000);
INSERT INTO house VALUES (3086, 8007, 'SD', 'Jalan PJU 8/8A', 'Damansara Perdana', 'Petaling Jaya', 'Selangor', 47820);
INSERT INTO house VALUES (3087, 8003, 'CD', 'Saville Cheras No.1, Persiaran Sri Raya, Taman Sri Raya', 'Hulu Langat', 'Cheras', 'Selangor', 43200);
INSERT INTO house VALUES (3088, 8006, 'SD', 'Jalan Teknokrat 7', 'Cyberjaya', 'Putrajaya', 'Selangor', 63000);
INSERT INTO house VALUES (3089, 8010, 'AP', 'No. 2 Jalan Setia Dagang', 'Setia Alam', 'Shah Alam', 'Selangor', 40170);
INSERT INTO house VALUES (3090, 8002, 'BG', 'Pusat Perdagangan Icon City, No 1B, Jalan SS8/39, SS8', 'Bandar Sunway', 'Petaling Jaya', 'Selangor', 47300);

INSERT INTO service VALUES (7021, 3071, 2010, '02/02/2022');
INSERT INTO service VALUES (7022, 3072, 2020, '06/03/2022');
INSERT INTO service VALUES (7023, 3073, 2130, '16/03/2022');
INSERT INTO service VALUES (7024, 3074, 2040, '05/05/2022');
INSERT INTO service VALUES (7025, 3075, 2150, '16/07/2022');
INSERT INTO service VALUES (7026, 3076, 2060, '21/08/2022');
INSERT INTO service VALUES (7027, 3077, 2070, '26/09/2022');
INSERT INTO service VALUES (7028, 3078, 2080, '23/10/2022');
INSERT INTO service VALUES (7029, 3079, 2090, '04/11/2022');
INSERT INTO service VALUES (7030, 3080, 2100, '27/11/2022');
INSERT INTO service VALUES (7031, 3081, 2010, '03/01/2022');
INSERT INTO service VALUES (7032, 3082, 2120, '04/01/2022');
INSERT INTO service VALUES (7033, 3083, 2130, '24/10/2022');
INSERT INTO service VALUES (7034, 3084, 2140, '17/02/2022');
INSERT INTO service VALUES (7035, 3085, 2150, '11/07/2022');
INSERT INTO service VALUES (7036, 3086, 2020, '29/11/2022');
INSERT INTO service VALUES (7037, 3087, 2040, '24/09/2022');
INSERT INTO service VALUES (7038, 3088, 2060, '02/09/2022');
INSERT INTO service VALUES (7039, 3089, 2080, '16/04/2022');
INSERT INTO service VALUES (7040, 3090, 2100, '08/08/2022');

-- HOUSE_TYPE from table HOUSE, SERVICE_HOURS and COMMISSION_RATE from table EMPLOYEE is indexed to allow for easier reference 

CREATE INDEX index_house_type
ON house(house_type);

CREATE INDEX index_service_hours
ON employee(service_hours);

CREATE INDEX index_commission_rate
ON employee(commission_rate);

CREATE VIEW view_employee AS
SELECT employee_id, supervisor_id, first_name, phone_number
FROM employee;

CREATE VIEW view_house AS
SELECT house_id, customer_id, house_type
FROM house;