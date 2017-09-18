--
-- Taking the average of every division, what were the average SOL scores per subject
-- in the state of Virginia from 2011-2014, and how much e-Learning Backpack Initiative and VPSA 
-- Grant money was given to all divisions total, per year? 
--

DROP FUNCTION IF EXISTS sol_avg_grants(div_num integer);

CREATE FUNCTION sol_avg_grants(div_num integer)
RETURNS TABLE(sch_year integer, subject text, 
    avg_score decimal, total_tech_grant integer ) AS $$

SELECT  sol.sch_year, sol.subject, AVG(sol.avg_score), g.total_tech_grant    
FROM sol_test_data AS sol
  JOIN grants AS g ON sol.div_num = g.div_num
    AND sol.sch_year = g.year
WHERE sol.test_name = 'ALL'
  AND sol.div_num = $1
  AND sol.test_level = 'ALL'
  AND sol.sch_year > 2010
GROUP BY sol.div_num, sol.sch_year, sol.subject, g.total_tech_grant
ORDER BY sch_year, subject;

$$ LANGUAGE SQL STABLE STRICT;

ALTER FUNCTION sol_avg_grants(div_num integer) OWNER TO techx;
