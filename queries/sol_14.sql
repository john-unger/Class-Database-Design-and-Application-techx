--
-- For each division, what were the average SOL scores by subject 
-- for the year 2014, when VPSA Base Grants are given
-- to divisions and the e-Learning Backpack Initative 
-- Grants are first given (2013-2014)?
--

DROP FUNCTION IF EXISTS sol_14(div_num integer);

CREATE FUNCTION sol_14(div_num integer)
RETURNS TABLE(sch_year integer, subject text, avg_score decimal ) AS $$

SELECT sch_year, subject, AVG(avg_score)
FROM sol_test_data
WHERE test_name = 'ALL'
AND sch_year >=2014
AND div_num = $1
GROUP BY div_num, sch_year, subject
Order BY div_num, sch_year


$$ LANGUAGE SQL STABLE STRICT;

ALTER FUNCTION sol_14(div_num integer) OWNER TO techx;
