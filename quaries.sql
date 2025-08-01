SELECT p.project_name, COUNT(ep.emp_id) AS employee_count
FROM projects p
LEFT JOIN employee_projects ep ON p.project_id = ep.project_id
GROUP BY p.project_name;

SELECT d.dept_name, SUM(e.salary) AS monthly_salary_expense
FROM departments d
JOIN employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name;
SELECT e.name, lr.start_date, lr.end_date, lr.reason
FROM leave_requests lr
JOIN employees e ON lr.emp_id = e.emp_id
WHERE CURRENT_DATE BETWEEN lr.start_date AND lr.end_date
AND lr.status = 'Approved';


SELECT e.name, COUNT(*) AS leave_count
FROM leave_requests lr
JOIN employees e ON lr.emp_id = e.emp_id
WHERE lr.start_date >= CURRENT_DATE - INTERVAL '6 months'
GROUP BY e.name
ORDER BY leave_count DESC
LIMIT 1;
SELECT d.dept_name, COUNT(p.project_id) AS active_projects
FROM departments d
JOIN projects p ON d.dept_id = p.dept_id
WHERE p.end_date IS NULL OR p.end_date > CURRENT_DATE
GROUP BY d.dept_name
ORDER BY active_projects DESC;


SELECT e.name
FROM employees e
LEFT JOIN employee_projects ep ON e.emp_id = ep.emp_id
WHERE ep.project_id IS NULL;
