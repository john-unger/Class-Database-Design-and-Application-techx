DROP TABLE IF EXISTS division;

CREATE TABLE division (
    div_num integer NOT NULL,
    div_name text NOT NULL
);

ALTER TABLE division OWNER TO techx;

COMMENT ON TABLE division IS 'all divisions in Virginia';


DROP TABLE IF EXISTS school;

CREATE TABLE school (
    div_num integer NOT NULL,
    sch_num integer NOT NULL,
    sch_name text NOT NULL
);

ALTER TABLE school OWNER TO techx;

COMMENT ON TABLE school IS 'all schools in Virginia';


DROP TABLE IF EXISTS fall_membership;

CREATE TABLE fall_membership (
    sch_year integer NOT NULL,
    div_num integer NOT NULL,
    fall_cnt integer NOT NULL
);

ALTER TABLE fall_membership OWNER TO techx;

COMMENT ON TABLE fall_membership IS 'fall membership counts';

DROP TABLE IF EXISTS sol_test_data;

CREATE TABLE sol_test_data
(
  sch_year integer NOT NULL,
  div_num integer NOT NULL,
  sch_num integer NOT NULL,
/*  race text NOT NULL,
  gender text NOT NULL,
  disabil text NOT NULL,
  lep text NOT NULL,
  disadva text NOT NULL,*/
  subject text NOT NULL,
  test_name text NOT NULL,
  test_level text NOT NULL,
  avg_score integer,
  pass_advn real NOT NULL,
  pass_prof real NOT NULL,
  pass_rate real NOT NULL,
  fail_rate real NOT NULL
);

ALTER TABLE sol_test_data OWNER TO techx;

COMMENT ON TABLE sol_test_data IS 'sol test data';



DROP TABLE IF EXISTS grants;

CREATE TABLE grants (
  div_num integer NOT NULL,
  div_name text NOT NULL,
  num_of_schools integer,
  year integer NOT NULL,
  grant_26000_ps integer,
  grant_50000_pd integer,
  base_div_vpsa_technology_grant integer,
  schools_nfa integer,
  schools_nfa_2400_ps integer,
  grade9_fall_membership_s_nfa integer,
  elearn_backpack_funding_400per9g integer, 
  total_elearn_funding integer,
  total_tech_grant integer,
  total_lmr_20_percent integer
);

ALTER TABLE grants OWNER TO techx;

COMMENT ON TABLE grants IS 'grants from 2011-2015';


DROP TABLE IF EXISTS sales_tax;

CREATE TABLE sales_tax (
  year integer NOT NULL,
  div_num integer NOT NULL,
  div_name text NOT NULL,
  july real,
  aug real,
  sept real,
  oct real,
  nov real,
  dec real,
  total_2014 real,
  jan real,
  feb real,
  mar real,
  apr real,
  may real,
  june real,
  total_2015 real
);

ALTER TABLE sales_tax OWNER TO techx;

COMMENT ON TABLE sales_tax IS 'sales_tax 2014-2015';


--This is a comment
--These two temp files are to create the internet database, which is the last statement
DROP TABLE IF EXISTS tempCounty;

CREATE TABLE tempCounty(
  county integer NOT NULL,
  div_num integer NOT NULL
);

ALTER TABLE tempCounty OWNER TO techx;

COMMENT ON TABLE tempCounty IS 'temporary relation of county to div_num';



DROP TABLE IF EXISTS tempInternet;

CREATE TABLE tempInternet(
  county integer NOT NULL,
  Year integer NOT NULL,
  internet integer NOT NULL
);

ALTER TABLE tempInternet OWNER TO techx;

COMMENT ON TABLE tempInternet IS 'temporary relation of internet data';



DROP TABLE IF EXISTS internet;

CREATE TABLE internet(
  div_num integer NOT NULL,
  year integer NOT NULL,
  internet integer NOT NULL
);

ALTER TABLE internet OWNER TO techx;

COMMENT ON TABLE internet IS 'number of internet connections';

