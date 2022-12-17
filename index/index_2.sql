SELECT service_hours, employee_id "Location"
FROM employee
GROUP BY service_hours, employee_id
ORDER BY service_hours ASC, employee_id ASC;