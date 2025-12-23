create database project1;
use project1;
create TABLE departments (
  dept_id SERIAL PRIMARY KEY,
  dept_name VARCHAR(50)
);

CREATE TABLE roles (
  role_id SERIAL PRIMARY KEY,
  role_name VARCHAR(50)
);

CREATE TABLE employees (
  emp_id SERIAL PRIMARY KEY,
  emp_name VARCHAR(100),
  dept_id INT REFERENCES departments(dept_id),
  role_id INT REFERENCES roles(role_id),
  join_date DATE
);

CREATE TABLE attendance (
  att_id SERIAL PRIMARY KEY,
  emp_id INT REFERENCES employees(emp_id),
  in_time TIMESTAMP,
  out_time TIMESTAMP,
  status VARCHAR(10)
);
-- Monthly attendance
SELECT emp_id, COUNT(*) FROM attendance
GROUP BY emp_id;

-- Late arrivals
SELECT emp_id, COUNT(*) FROM attendance
WHERE status='Late'
GROUP BY emp_id;


