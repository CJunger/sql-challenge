--1. List the employee number, last name, first name, sex, and salary of each employee 
Select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
From employees
left join salaries
on employees.emp_no = salaries.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986
select first_name, last_name, hire_date
from employees 
where hire_date between '1985-12-31' and '1987-01-01';

-- 3. List the manager of each department along with their department number, department name, 
-- employee number, last name, and first name
Select employees.emp_no, employees.last_name, employees.first_name, departments.dept_no, departments.dept_name
from employees
left join dept_manager
on employees.emp_no = dept_manager.emp_no
right join departments
on departments.dept_no = dept_manager.dept_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose 
-- last name begins with the letter B 
Select first_name, last_name, sex
from employees
where first_name = 'Hercules' 
	and last_name like 'B%';
	
--6. List each employee in the Sales department, including their employee number, last name, and first name 
select emp_no, last_name, first_name
from employees
where Exists (
	select emp_no
	from dept_emp
	where Exists (
		select dept_no
 		from departments
		where dept_name = 'Sales'
));

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, 
-- first name, and department name

Select employees.emp_no, employees.last_name, employees.first_name,  departments.dept_name
from employees
left join dept_emp
on employees.emp_no = dept_emp.emp_no
right join departments
on departments.dept_no = dept_emp.dept_no
where dept_name = 'Sales' or dept_name = 'Development';



-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees 
-- share each last name)

select employees.last_name, count(last_name)
from employees
group by employees.last_name
order by count(last_name) DESC;