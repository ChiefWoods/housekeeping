CREATE TABLE house (
  house_id INT NOT NULL PRIMARY KEY,
  customer_id INT FOREIGN KEY REFERENCES House(customer_id),
  service_id INT FOREIGN KEY REFERENCES Service(customer_id),
  house_type CHAR(2),
  street VARCHAR(64),
  city VARCHAR(64),
  town VARCHAR(64),
  state VARCHAR(64),
  postcode INT(5),
)

CREATE TABLE customer (
  customer_id INT NOT NULL PRIMARY KEY,
  house_id INT FOREIGN KEY REFERENCES House(house_id),
  gift_id INT FOREIGN KEY REFERENCES Gift(gift_id),
  first_name VARCHAR(16),
  last_name VARCHAR(16),
  gender CHAR,
  phone_number NUMBER(16),
)

CREATE TABLE service (
  service_id INT NOT NULL PRIMARY KEY,
  house_id INT FOREIGN KEY REFERENCES House(house_id),
  supervisor_id INT FOREIGN KEY REFERENCES Supervisor(supervisor_id),
  service_date DATE,
)

CREATE TABLE employee (
  employee_id INT NOT NULL PRIMARY KEY,
  supervisor_id INT FOREIGN KEY REFERENCES supervisor(supervisor_id),
  first_name VARCHAR(16),
  last_name VARCHAR(16),
  gender CHAR,
  street VARCHAR(64),
  city VARCHAR(64),
  town VARCHAR(64),
  state VARCHAR(64),
  postcode INT(5),
  phone_number NUMBER(16),
  salary INT(9),
  service_hours INT(3),
  commission_rate NUMBER(*.2),
  total_commission NUMBER,
)

CREATE TABLE supervisor (
  supervisor_id INT NOT NULL PRIMARY KEY,
  service_id INT FOREIGN KEY REFERENCES service(service_id),
  first_name VARCHAR(16),
  last_name VARCHAR(16),
  gender CHAR,
  phone_number NUMBER(16),
)

CREATE TABLE gift (
  gift_id INT NOT NULL PRIMARY KEY,
  customer_id INT FOREIGN KEY REFERENCES customer(customer_id),
  gift_type VARCHAR(16),
  gift_price NUMBER(*.2),
)