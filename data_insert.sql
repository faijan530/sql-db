INSERT INTO departments (dept_name) VALUES ('Engineering'), ('HR'), ('Sales');

INSERT INTO employees (name, email, phone, gender, salary, dept_id) VALUES
('Faizan Raja', 'faizan@example.com', '9999999999', 'Male', 60000, 1),
('Ayesha Khan', 'ayesha@example.com', '8888888888', 'Female', 55000, 2),
('Ravi Verma', 'ravi@example.com', '7777777777', 'Male', 52000, 1),
('Neha Singh', 'neha@example.com', '6666666666', 'Female', 48000, 3),
('John Doe', 'john@example.com', '9998887777', 'Male', 50000, 1),
('Priya Das', 'priya@example.com', '8889997777', 'Female', 47000, 3);


UPDATE departments SET manager_id = 1 WHERE dept_id = 1;
UPDATE departments SET manager_id = 2 WHERE dept_id = 2;
UPDATE departments SET manager_id = 4 WHERE dept_id = 3;


INSERT INTO projects (project_name, start_date, end_date, dept_id) VALUES
('Inventory System', NOW() - INTERVAL '60 days', NOW() + INTERVAL '30 days', 1),
('Recruitment App', NOW() - INTERVAL '20 days', NULL, 2),
('Sales Tracker', NOW() - INTERVAL '90 days', NOW() + INTERVAL '60 days', 3),
('CRM Revamp', NOW() - INTERVAL '15 days', NULL, 1);
INSERT INTO employee_projects (emp_id, project_id) VALUES
(1, 1), (1, 4),
(3, 1), (5, 4),
(2, 2), (4, 3), (6, 3);

INSERT INTO leave_requests (emp_id, start_date, end_date, reason, leave_type, status) VALUES
(1, NOW() - INTERVAL '2 days', NOW() + INTERVAL '1 day', 'Medical leave', 'Sick', 'Approved'),
(2, '2025-07-25', '2025-07-26', 'Personal work', 'Casual', 'Pending'),
(3, '2025-07-20', '2025-07-22', 'Family function', 'Paid', 'Approved'),
(1, '2025-06-15', '2025-06-20', 'Vacation', 'Paid', 'Approved'),
(6, '2025-07-10', '2025-07-11', 'Doctor visit', 'Sick', 'Rejected'),
(5, '2025-07-01', '2025-07-10', 'Long leave', 'Unpaid', 'Approved');

