DROP TABLE IF EXISTS customer, house, service, employee, supervisor, gift;

CREATE TABLE customer (
  customer_id NUMBER(4) PRIMARY KEY,
  house_id NUMBER(4) FOREIGN KEY REFERENCES house(house_id),
  gift_id NUMBER(4) FOREIGN KEY REFERENCES gift(gift_id),
  first_name VARCHAR(32) NOT NULL,
  last_name VARCHAR(32) NOT NULL,
  gender CHAR CONSTRAINT check_customer_gender CHECK (gender in ('M', 'F')),
  phone_number VARCHAR(32) NOT NULL,
);

CREATE TABLE house (
  house_id NUMBER(4) PRIMARY KEY,
  service_id NUMBER(4) FOREIGN KEY REFERENCES service(customer_id),
  house_type LONG NOT NULL CONSTRAINT check_house_type CHECK (house_type in ('CD', 'AP', 'SD', 'BG')),
  street VARCHAR(64) NOT NULL,
  city VARCHAR(32) NOT NULL,
  town VARCHAR(32) NOT NULL,
  state VARCHAR(32) NOT NULL CONSTRAINT check_house_state CHECK (state IN ('SELANGOR')),
  postcode NUMBER(5) NOT NULL,
);

CREATE TABLE service (
  service_id NUMBER(4) PRIMARY KEY,
  supervisor_id NUMBER(4) FOREIGN KEY REFERENCES supervisor(supervisor_id),
  service_date DATE NOT NULL,
);

CREATE TABLE employee (
  employee_id NUMBER(4) PRIMARY KEY,
  first_name VARCHAR(32) NOT NULL,
  last_name VARCHAR(32) NOT NULL,
  gender CHAR CONSTRAINT check_employee_gender CHECK (gender in ('M', 'F')),
  street VARCHAR(64),
  city VARCHAR(32),
  town VARCHAR(32),
  state VARCHAR(32),
  postcode NUMBER(5),
  phone_number VARCHAR(32) NOT NULL,
  salary NUMBER(*, 2) NOT NULL CONSTRAINT check_salary CHECK (salary >= 1500),
  service_hours NUMBER(4) NOT NULL,
  commission_rate FLOAT(2) NOT NULL,
);

CREATE TABLE supervisor (
  supervisor_id NUMBER(4) PRIMARY KEY,
  employee_id NUMBER(4) FOREIGN KEY REFERENCES employee(employee_id),
  first_name VARCHAR(32) NOT NULL,
  last_name VARCHAR(32) NOT NULL,
  gender CHAR CONSTRAINT check_supervisor_gender CHECK (gender in ('M', 'F')),
  phone_number VARCHAR(32) NOT NULL,
);

CREATE TABLE gift (
  gift_id NUMBER(4) PRIMARY KEY,
  customer_id NUMBER(4) FOREIGN KEY REFERENCES customer(customer_id),
  gift_type VARCHAR(64) NOT NULL,
  gift_price NUMBER(*, 2) NOT NULL,
);