-- find titles of employees expected to retire soon (born between 1952-55)
SELECT DISTINCT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO silver_squad
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no ASC;



-- Use Dictinct with Orderby to remove duplicate rows of people who had multiple titles
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM silver_squad
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;


-- count number of employees about to retire, grouped by title
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title);


-- find employees eligible to be part of mentorship program (current employees born in 1965)
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship_eligibility
FROM employees as E
	INNER JOIN dept_emp as de
		ON (e.emp_no = de.emp_no)
	INNER JOIN titles as t
		ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;
