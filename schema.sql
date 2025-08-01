CREATE TABLE departments (
  dept_id SERIAL PRIMARY KEY,
  dept_name VARCHAR(100) NOT NULL UNIQUE,
  manager_id INT
);


CREATE TABLE employees (
  emp_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  phone VARCHAR(15),
  gender VARCHAR(10) CHECK (gender IN ('Male', 'Female', 'Other')),
  join_date DATE DEFAULT CURRENT_DATE,
  salary NUMERIC(10,2),
  dept_id INT REFERENCES departments(dept_id) ON DELETE SET NULL
);


ALTER TABLE departments
ADD CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES employees(emp_id);



CREATE TABLE projects (
  project_id SERIAL PRIMARY KEY,
  project_name VARCHAR(100) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE,
  dept_id INT REFERENCES departments(dept_id) ON DELETE CASCADE
);

CREATE TABLE employee_projects (
  emp_id INT REFERENCES employees(emp_id) ON DELETE CASCADE,
  project_id INT REFERENCES projects(project_id) ON DELETE CASCADE,
  assigned_on DATE DEFAULT CURRENT_DATE,
  PRIMARY KEY (emp_id, project_id)
);
CREATE TABLE leave_requests (
  leave_id SERIAL PRIMARY KEY,
  emp_id INT REFERENCES employees(emp_id) ON DELETE CASCADE,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  reason TEXT,
  leave_type VARCHAR(30) CHECK (leave_type IN ('Sick', 'Casual', 'Paid', 'Unpaid', 'Maternity')),
  status VARCHAR(20) CHECK (status IN ('Pending', 'Approved', 'Rejected')) DEFAULT 'Pending'
);