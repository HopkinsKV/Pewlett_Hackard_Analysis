# Pewlett_Hackard_Analysis


Current Department Breakdown  
![Name only](https://user-images.githubusercontent.com/91762315/144900666-7f9cd939-9ffd-4943-b965-e69b0ca6731a.png)

Mentor Eligibile count by department  
![image](https://user-images.githubusercontent.com/91762315/144902628-a7c8791d-275d-47d0-9456-a912bd5e02c3.png)



## Top 3 departments eligibility by title
`SELECT dpt.dept_name, me.title, count(me.title)`  
`FROM dept_emp as de`  
`INNER JOIN MENTORSHIP_eligibility as me`  
	`ON de.emp_no = me.emp_no`  
`JOIN departments as dpt`  
	`ON de.dept_no = dpt.dept_no`  
`WHERE dpt.dept_name = 'Development' OR dpt.dept_name = 'Production' OR .dept_name ='Sales'`  
`Group BY me.title, dpt.dept_name`  
`ORDER BY dpt.dept_name, Count desc;`  

![image](https://user-images.githubusercontent.com/91762315/144904105-4f4f5e9a-ebb0-448f-96da-8f9b8df63240.png)


#IDENTIFYING ACTIVE EMPLOYEE COUNTS FOR TOP 3 DEPTS
SELECT dpt.dept_name, COUNT(ttl.title), de.dept_no, ttl.title
From dept_emp AS de 
JOIN departments AS dpt
	ON de.dept_no = dpt.dept_no
JOIN titles AS ttl
	ON de.emp_no = ttl.emp_no
	WHERE de.to_date = ('9999-01-01') AND dpt.dept_name = 'Development' OR dpt.dept_name = 'Production' OR dpt.dept_name ='Sales'
GROUP BY dpt.dept_name, ttl.title, de.dept_no
ORDER BY array_position(ARRAY['Development', 'Production', 'Sales']::varchar[], dpt.dept_name), dpt.count DESC;


