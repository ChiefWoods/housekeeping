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