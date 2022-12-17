-- The management of SUNNY Housekeeping wants to gather all supervisors who worked on services in the first quarter of the year to reward them for their outstanding performance, with their service dates rounded off to the nearest month.

SELECT first_name "Supervisor First Name", last_name "Supervisor Last Name"
FROM supervisor
WHERE supervisor_id IN (
  SELECT supervisor_id
  FROM service
  WHERE TO_CHAR(ROUND(TO_DATE (service_date), 'MONTH'), 'MON') IN ('JAN', 'FEB', 'MAR')
);