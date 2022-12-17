-- COMMISSION_RATE from table EMPLOYEE is indexed to allow easier reference

SELECT commission_rate, employee_id "Location"
FROM employee
GROUP BY commission_rate, employee_id
ORDER BY commission_rate ASC, employee_id ASC;