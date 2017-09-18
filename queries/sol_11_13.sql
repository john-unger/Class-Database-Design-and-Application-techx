--
-- For each division, what were the average SOL scores by subject 
-- for the years 2011-2013, when VPSA Base Grants were first given
-- to divisions, however before e-Learning Backpack Initative 
-- Grants were given?
--

DROP FUNCTION IF EXISTS sol_11_13(div_num integer);

CREATE FUNCTION sol_11_13(div_num integer)
RETURNS TABLE(sch_year integer, subject text, avg_score decimal ) AS $$

SELECT sch_year, subject, AVG(avg_score)
FROM sol_test_data
WHERE test_name = 'ALL'
AND sch_year >=2011
AND sch_year <=2013
AND div_num = $1
GROUP BY sch_year, subject
Order BY sch_year, subject


$$ LANGUAGE SQL STABLE STRICT;

ALTER FUNCTION sol_11_13(div_num integer) OWNER TO techx;
