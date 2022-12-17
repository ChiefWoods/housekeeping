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