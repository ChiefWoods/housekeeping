SELECT house_type, house_id "Location"
FROM house
GROUP BY house_type, house_id
ORDER BY house_type ASC, house_id ASC;