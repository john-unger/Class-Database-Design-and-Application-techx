TechX

Norwood Burdett, Nicholas Hawkins,
John Unger, Michael Whetsel,
Jacob Wilson ("techx")

**SPECIAL NOTE**

The data that we have so far is from what we have found on the sources
given on our assignment website (doe.virginia.gov, research.schev.edu, 
data.virginia.gov, and other agencies). This data is not sufficient
for answering the question that we proposed. We have contacted these 
sources for additional data and have been told that they will get back
to us soon.


DESCRIPTION

Our application enables policy makers to view and update a list of divisions,
schools, and colleges in Virginia. The data is based on last year's VLDS fall
membership and additional data from NCES. Our application allows users to view 
the technology expenditures of individual school districts and how they relate 
to vital academic statistics, such as SAT scores, SOL performance, 
and graduation rates.


STEPS TO CREATE DATABASE

1. Download the following pdf files that report on the Educational Technology 
grants given by the Virginia Public School Authority since 2011:

http://www.doe.virginia.gov/administrators/superintendents_memos/2011/129-11a.pdf
http://www.doe.virginia.gov/administrators/superintendents_memos/2012/133-12a.pdf
http://www.doe.virginia.gov/administrators/superintendents_memos/2013/146-13a.pdf
http://www.doe.virginia.gov/administrators/superintendents_memos/2014/136-14a.pdf
http://www.doe.virginia.gov/administrators/superintendents_memos/2015/136-15a.pdf

3. Convert the PDF files into CSV files. 

4. Use a spreadsheet to save columns A-F to college.csv.

5. Add SQL statements to create.sql that create tables with data from csv files, then run create.sql to create tables with group ownership for each of the sources.

6. Add bash statmenets on copy.sh that copy data from the CSV files and VDOE database, then run copy.sh on db.cs.jmu.edu to copy data from VDOE and the local CSV files. 

7. Use the count() method to find the number of rows on each table, then run stats.sql to count rows and analyze the tables.

FOR John: \copy sales_tax_2014 FROM sales_tax_2014.csv WITH CSV HEADER

Source of Internet DATA:

https://www.fcc.gov/general/form-477-county-data-internet-access-services
