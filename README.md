# Pewlett Hackard: Employee Database with SQL

## Overview

Pewlett Hackard is a large company who is looking to navigate the waters where employees from the baby boomer area are beginning to retire at an increased rate.  They need to know which current employees are likely to retire so that they can both handle retirement packages and try to ensure that they are in a good position to move forward when they need to fill those newly created vacancies instead of being caught with their pants down.  PH currently has their employee information scattered throughout six seperate CSV files, but due to the overwhelmingly large amount of data being dealt with, they are looking to move things into SQL databases.

## Results

XXX Provide a bulleted list with four major points from the two analysis deliverables. Use images as support where needed.

### Retirement + Unique Titles

* Our first attempt at working with the data saw us collecting employee numbers, names, titles, and employment dates from the Employees and Titles CSVs.  While this included all of the information we needed (and then some), it wasn't particularly useful as it contained multiple entries for each person if they held multiple positions throughout their time with the company.  Maybe it could be useful if someone wanted to go back and see every department that soon-to-be retirees worked in, but for the most part, we needed something more practical to work with.

![Unique Titles](https://github.com/Jeffstr00/Movies_ETL/blob/main/Resources/unique_titles.png)

* In order to refine our information so that we only had one entry for each person (representing their current position in the company), we used `SELECT DISTINCT ON (emp_no) emp_no ... ORDER BY emp_no, to_date DESC` when creating our Unique Titles table.  This leaves us with much more useful information as we have a list of who is expected to retire soon and what position they currently hold (in other words, what position the company needs to be prepared to fill).

### Retiring Titles

## Summary

XXX Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami."
How many roles will need to be filled as the "silver tsunami" begins to make an impact?
Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
