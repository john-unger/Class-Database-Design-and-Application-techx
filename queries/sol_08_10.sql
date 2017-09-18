--
-- For each division, what were the average SOL scores by subject 
-- for the years 2008-2010, before any VPSA Technology Grants are 
-- given to school divisions in the state of Virginia?
--

DROP FUNCTION IF EXISTS sol_08_10(div_num integer);

CREATE FUNCTION sol_08_10(div_num integer)
RETURNS TABLE(sch_year integer, subject text, avg_score decimal ) AS $$

SELECT sch_year, subject, AVG(avg_score)
FROM sol_test_data
WHERE test_name = 'ALL'
AND sch_year >= 2008
AND sch_year <= 2010
AND div_num = $1
GROUP BY sch_year, subject
Order BY sch_year


$$ LANGUAGE SQL STABLE STRICT;

ALTER FUNCTION sol_08_10(div_num integer) OWNER TO techx;
