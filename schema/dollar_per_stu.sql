CREATE OR REPLACE FUNCTION dollar_per_stu(IN div_num integer)
  RETURNS TABLE(sch_year integer, dollar_per_stu integer) AS 
$BODY$

    SELECT f.sch_year, (g.ttg/MAX(f.fall_cnt))
    FROM fall_membership AS f
	JOIN (SELECT year, total_tech_grant AS ttg
		FROM grants
		WHERE div_num = $1) AS g ON f.sch_year = g.year  
    WHERE f.div_num = $1
    GROUP BY f.sch_year, g.ttg
    ORDER BY f.sch_year

$BODY$
  LANGUAGE sql STABLE STRICT
  COST 100
  ROWS 1000;
ALTER FUNCTION dollar_per_stu(integer) OWNER TO techx;
