#!/bin/sh
# Run this script directly on the db server.

echo COPY division FROM vdoe
psql -c "COPY (
    SELECT div_num, div_name
    FROM division
  ) TO STDOUT;" vdoe | \
  psql -c "COPY division FROM STDIN;" techx

echo COPY school FROM vdoe
psql -c "COPY (
    SELECT div_num, sch_num, sch_name
    FROM school
  ) TO STDOUT;" vdoe | \
  psql -c "COPY school FROM STDIN;" techx
echo COPY fall_membership FROM vdoe
psql -c "COPY (
    SELECT sch_year, div_num, fall_cnt
    FROM fall_membership
    WHERE TRUE 
	AND sch_num = 0
	AND grade_num = 0
	AND gender = 'ALL'
	AND disabil = 'ALL'
	AND disadva = 'ALL'
	AND lep = 'ALL'
        AND race = 'ALL'
  ) TO STDOUT;" vdoe | \
  psql -c "COPY fall_membership FROM STDIN;" techx

echo COPY sol_test_data FROM vdoe
psql -c "COPY ( 
  SELECT sch_year, div_num, sch_num, subject, test_name, test_level, avg_score, pass_advn, pass_prof, pass_rate, fail_rate
  FROM sol_test_data
  WHERE race = 'ALL'
    AND gender = 'ALL'
    AND disabil = 'ALL'
    AND lep = 'ALL'
    AND disadva = 'ALL'
    AND test_level LIKE 'ALL%'
    AND test_level NOT LIKE '%ALL%3-8%'
    AND test_name LIKE '%ALL%'
  ) TO STDOUT;" vdoe | \
psql -c "COPY sol_test_data FROM STDIN;" techx

echo COPY grants FROM Grants.csv
psql -c "\copy grants
  FROM Grants.csv
  WITH CSV HEADER;" techx


echo COPY sales_tax FROM sales_tax.csv
psql -c "\copy sales_tax 
  FROM sales_tax.csv 
  WITH CSV HEADER;" techx
  
  
  
  echo COPY tempCounty FROM county_div.csv
psql -c "\copy tempCounty 
  FROM county_div.csv 
  WITH CSV HEADER;" techx
  
  echo COPY tempInternet FROM internet.csv
psql -c "\copy tempInternet 
  FROM internet.csv 
  WITH CSV HEADER;" techx

echo COPY internet FROM temporary relations
psql -c "COPY (
  SELECT div_num, Year, internet
  FROM tempCounty NATURAL JOIN tempInternet
  ) TO STDOUT;" techx | \
psql -c "COPY internet FROM STDIN;" techx

psql -c "DROP TABLE IF EXISTS tempCounty;
DROP TABLE IF EXISTS tempInternet;" techx
