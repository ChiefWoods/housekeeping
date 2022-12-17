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