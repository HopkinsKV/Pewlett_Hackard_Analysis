--Finding the number of retiring employees by title

-- Create retirement_titles (all retiring emps with all their titles)
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ttl.title,
	ttl.from_date,
	ttl.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ttl
	ON e.emp_no = t.emp_no
	WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

 --Create unique_titles (show emps most recent job title)
SELECT DISTINCT ON (rt.emp_no)
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles rt
ORDER BY rt.emp_no, rt.to_date DESC;

-- Create retiring_titles (count emp by most recent job title)
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles ut
GROUP BY ut.title
ORDER BY ut.count DESC;

-- Finding the employees eligible for the Mentorship Program
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ttl.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp AS de
	ON (e.emp_no = de.emp_no)
INNER JOIN titles as ttl
	ON (e.emp_no = ttl.emp_no)
WHERE (de.to_date = ('9999-01-01'))
	AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

