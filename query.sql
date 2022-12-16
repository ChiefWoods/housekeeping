-- The management of SUNNY Housekeeping wants to gather all supervisors who worked on services in the first quarter of the year to reward them for their outstanding performance, with their service dates rounded off to the nearest month.

SELECT first_name "Supervisor First Name", last_name "Supervisor Last Name"
FROM supervisor
WHERE supervisor_id IN (
  SELECT supervisor_id
  FROM service
  WHERE TO_CHAR(ROUND(TO_DATE (service_date), 'MONTH'), 'MON') IN ('JAN', 'FEB', 'MAR')
);

-- A survey company wishes to gather groups of male customers from SUNNY Housekeeping with more than one service provided in which these services are carried out by male supervisors for statistical purposes.

SELECT customer.first_name "Customer First Name", customer.last_name "Customer Last Name", customer.phone_number "Customer Contact Number", COUNT(house.customer_id) "Number of Services"
FROM customer, house, service, supervisor
WHERE service.house_id = house.house_id
AND house.customer_id = customer.customer_id
AND service.supervisor_id = supervisor.supervisor_id
AND customer.gender = 'M'
AND supervisor.gender = 'M'
GROUP BY customer.first_name, customer.last_name, customer.phone_number
HAVING COUNT(house.customer_id) > 1;

-- SUNNY Housekeeping wants to keep track of all male supervisors with names that begin with 'J' or 'L', whose employees reside in the town Petaling Jaya or Puchong Jaya, including those that are not assigned to any services.

SELECT DISTINCT service.service_id "Service ID", supervisor.first_name "Supervisor First Name", supervisor.last_name "Supervisor Last Name" 
FROM employee, service
RIGHT OUTER JOIN supervisor ON service.supervisor_id = supervisor.supervisor_id
WHERE employee.town LIKE '%Jaya'
AND supervisor.gender = 'M'
AND employee.supervisor_id = supervisor.supervisor_id
AND (supervisor.first_name LIKE 'J%' OR supervisor.first_name LIKE 'L%')
GROUP BY supervisor.first_name, supervisor.last_name, service.service_id
ORDER BY service.service_id;

-- SUNNY Housekeeping is forming a tally of amount of houses for all house types.

SELECT 'BG' AS "House Type", COUNT(BG.house_id) "Amount of House Type"
FROM house main, house BG
WHERE main.house_id = BG.house_id
AND BG.house_type = 'BG'
UNION
SELECT 'AP' AS "House Type", COUNT(AP.house_id) "Amount of House Type"
FROM house main, house AP
WHERE main.house_id = AP.house_id
AND AP.house_type = 'AP'
UNION
SELECT 'SD' AS "House Type", COUNT(SD.house_id) "Amount of House Type"
FROM house main, house SD
WHERE main.house_id = SD.house_id
AND SD.house_type = 'SD'
UNION
SELECT 'CD' AS "House Type", COUNT(CD.house_id) "Amount of House Type"
FROM house main, house CD
WHERE main.house_id = CD.house_id
AND CD.house_type = 'CD';