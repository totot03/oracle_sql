-- 조인

-- 1. cross join (두개의 테이블을 크로스한다.)
select count(*) from employees;
select count(*) from departments;

select * from employees, departments where first_name like '%l%';

-- ANSI 협회정한 cross join
select * from employees, departments;  -- 107 * 27
select * from employees cross join departments;  -- 107 * 27

-- 2. inner join (employees  테이블과, departments 테이블을 조인해서 보여주시오)
select * from user_cons_columns where table_name = 'EMPLOYEES';


-- pk: departments.department_id fk:employees.department_id
-- first_name, email, job, 연봉, 부서명, 부서위치를 출력하는 조인문을 작성하시오
select e.first_name, e.email, e.job_id, e.salary, d.department_name, d.location_id from employees e, departments d
where e.department_id = d.department_id
and department_name = 'Shipping'
and salary > 5000;

select * from employees e inner join departments d
on e.department_id = d.department_id;

-- USING을 이용한 조인 조건 지정
select * 
from employees e inner join departments d
using(department_id);

select e.first_name, e.email, e.job_id, e.salary, d.department_name, d.location_id
from employees e inner join departments d
on e.department_id = d.department_id
where department_name = 'Shipping' and salary > 5000;

-- right outer join, left outer join
select e.first_name, d.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+)
order by d.department_id asc;

-- ANSI 협회정한 left outer join
select e.first_name, d.department_id, d.department_name
from employees e left outer join departments d
on e.department_id = d.department_id
order by d.department_id asc;

-- ANSI 협회정한 right outer join
select e.first_name, d.department_id, d.department_name
from employees e right outer join departments d
on e.department_id = d.department_id
order by d.department_id asc;

select * from departments order by department_id asc;

-- self 조인(한개의 태이블을 두개로 분리시킨다. 한개 pk, 다른 한개 fk)
-- employees를 self join을 통해서 사원의 정보와 사원의 사수의 정보를 출력하는 쿼리문 작성하시오.

select e1.first_name 사원, e2.first_name 사원사수, e1.salary 사원연봉,e2.salary 사수연봉 
from employees e1, employees e2
where e1.manager_id = e2.employee_id;

-- non equl join(두개의 테이블이 아무관계가 없다. FK 가지고 있지 않다)
-- 등급을 나타내는 테이블생성 gradetbl (등급, 최소연봉, 최대연봉)

create table gradetbl(
    grade number(1) not null,
    minsalary number not null,
    maxsalary number not null,
    constraint pk_gradetbl_grade primary key(grade)
);

insert into gradetbl values(1, 2000, 5000);
insert into gradetbl values(2, 5001, 10000);
insert into gradetbl values(3, 10001, 20000);
insert into gradetbl values(4, 20001, 30000);
insert into gradetbl values(5, 30001, 50000);

commit;

select * from gradetbl;

-- 공통컬럼이 어뵤는 employees 테이블과 gradetbl 조인을 해서 사원의 이름과. 사원의 월급, 사원의 월급등급을 출력하시오.

select first_name, salary, grade, minsalary, maxsalary 
from employees e, gradetbl g
where e.salary >= g.minsalary and e.salary <= g.maxsalary;

select first_name, salary, grade
from employees e, gradetbl g
where e.salary between g.minsalary and g.maxsalary;

