# Pewlett Hackard: Employee Database with SQL

## Overview

Pewlett Hackard is a large company who is looking to navigate the waters where employees from the baby boomer area are beginning to retire at an increased rate.  They need to know which current employees are likely to retire so that they can both handle retirement packages and try to ensure that they are in a good position to move forward when they need to fill those newly created vacancies instead of being caught with their pants down.  PH currently has their employee information scattered throughout six seperate CSV files, but due to the overwhelmingly large amount of data being dealt with, they are looking to move things into SQL databases.

## Results

### Retirement + Unique Titles

* Our first attempt at working with the data saw us collecting employee numbers, names, titles, and employment dates from the Employees and Titles CSVs.  While this included all of the information we needed (and then some), it wasn't particularly useful as it contained multiple entries for each person if they held multiple positions throughout their time with the company.  Maybe it could be useful if someone wanted to go back and see every department that soon-to-be retirees worked in, but for the most part, we needed something more practical to work with.

![Unique Titles](https://github.com/Jeffstr00/Pewlett-Hackard-Analysis/blob/main/resources/unique_titles.png)

* In order to refine our information so that we only had one entry for each person (representing their current position in the company), we used `SELECT DISTINCT ON (emp_no) emp_no ... ORDER BY emp_no, to_date DESC` when creating our Unique Titles table.  This leaves us with much more useful information as we have a list of who is expected to retire soon and what position they currently hold (in other words, what position the company needs to be prepared to fill).  However, this table contained a whooping 72,458 employees who were expected to retire, so sifting through this massive table to try to see what positions need to be filled would be an extremely difficult and cumbersome task.

### Retiring Titles

![Retiring Titles](https://github.com/Jeffstr00/Pewlett-Hackard-Analysis/blob/main/resources/retiring_titles.png)

* In order to get a count of how many people with each title were expected to retire soon, we used `SELECT COUNT(title), title ...GROUP BY title .. ORDER BY COUNT(title)` when creating our new Retiring Titles table.  We were left with a clear picture of how many of each position the company needs to be prepared to fill in the near future.

* As would be expected, the company is looking at the biggest projected departures coming at the Senior level positions with an expected exodus of about 25,000 for both Senior Engineers and Senior Staff.  While it should not come as a surprise that more tenured employees would be closer to retirement, this is still a bit worrisome since employees at this level would be much more difficult to replace.  As a result, the company should be sure that they have a pipeline going of capable employees moving up the ranks that will be ready to fill the voids left by retiring employees.

* While only two managers are expected to retire, that comes from a much shallower pool of only 24 current managers is the company.  As a result, variance here could potentially be more difficult to handle, as just a few additional managers deciding to retire would create a proportionally larger void than it would at the other, more robust positions.  Therefore, the company should take extra care to ensure that they are ready to replace managers if the need happens to arise.

### Mentorship Eligibility

![Mentorship Eligibility](https://github.com/Jeffstr00/Pewlett-Hackard-Analysis/blob/main/resources/mentorship_eligibility.png)

* In order to be ready to fill the upcoming void that will be created by the retiring baby boomers, we decided to look for current employees who would be good candidates for the mentorship program so that they will be prepared to take over the new resposibilities.  To do so, we looked at employees who are about 10-15 years away from retirement, figuring that they would be experienced enough to move into the senior positions that are about to be vacated without being too close to retirement themselves.  To select these people, we used `WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')` when creating the table.

## Summary

XXX Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami."
How many roles will need to be filled as the "silver tsunami" begins to make an impact?
Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
