-- select문 기능

-- 1. departments 레코드를 조사
select * from departments;

-- <문제> EMPLOYEES 테이블의 모든 레코드를 출력
select * from employees;

-- 2. departments 테이블에서 department_id, department_name 항목만 보고싶다.
select department_id, department_name from departments;

select FIRST_NAME, LAST_NAME, SALARY, HIRE_DATE from employees;

-- 3. 컬럼이름 별칭붙이기 
select FIRST_NAME as a, LAST_NAME as b, SALARY as c, HIRE_DATE from employees;
select FIRST_NAME 이름, LAST_NAME 성, SALARY 급여, HIRE_DATE from employees;

-- 4.연결연산자(concatenation) : 자바에서 문자열 + 숫자
select * from employees;
-- 사원번호는 100이고 사원의 이름 Stenven king 이메일주소는 sking 입니다.
select '사원번호는'|| employee_id || '이고 사원의 이름' || first_name || last_name || '입니다.' as info from employees;

-- 5. 중복된 데이터를 한번씩만 출력하는 기능
select DISTINCT JOB_ID from employees;

select DISTINCT department_id from employees;

-- 6. 조건문(if => where) 
-- employees에서 급여를 3000 이상 받는 직원을 대상
select first_name, salary from employees where salary >= 3000;

select * from employees where employee_id = 110;

SELECT employee_id, first_name, last_name, salary FROM employees where salary < 5000;

-- 7. 이름(first_name)이 'Lex'인 직원출력
select * from employees where first_name = 'Lex';

select employee_id, first_name, last_name, job_id from employees where first_name = 'John';

-- 8. 날짜 데이처 조회
select * from employees where hire_date > '2008/01/01';

-- 9. AND => BETWEEN AND연산자, OR => IN연산자, NOT 조건
select * from employees where department_id = 100 and job_id = 'FI_MGR';

select * from employees where 5000 <= salary and salary <= 10000;
select * from employees where salary BETWEEN 5000 and 10000;

select * from employees where department_id = 100 or job_id = 'FI_MGR';

select * from employees where employee_id = 134 or employee_id = 201 or employee_id = 107;
select * from employees where employee_id in (134,201,107);

select * from employees where department_id != 100;  -- 강추
select * from employees where department_id <> 100;  -- 강추
select * from employees where department_id ^= 100;
select * from employees where NOT department_id = 100;

select * from employees where job_id != 'FI_MGR';

select employee_id, first_name, last_name, salary from employees where 2500 <= salary and salary <= 4500;  
select employee_id, first_name, last_name, salary from employees where salary BETWEEN 2500 and 4500;  

select employee_id, first_name, last_name, salary, commission_pct from employees where commission_pct = 0.3 or commission_pct = 0.05 or commission_pct = 0.1;
select employee_id, first_name, last_name, salary, commission_pct from employees where commission_pct in (0.3,0.05,0.1);

-- 10. Like연산자(_ : 1글자이고 (여기에 무엇이 와도 상관이 없다)) (%: 1글자이상 무엇이와도 상관이 없다.)
-- 이름 중에 K로 시작하는 사원
select * from employees where first_name like 'K%';

-- 이름 중에 k를 포함하는 사원
select * from employees where last_name like '%k%';

-- 이름이 k로 끝나는 사원
select * from employees where first_name like '%k';

-- 이름의 두번째 글자가 d인 사원
select * from employees where first_name like '_d%';

select employee_id, first_name, last_name from employees where first_name not like '%a%'; 

-- 11. NULL은 (연산, 할당, 비교가 불가능)하다.
-- 커미션을 받지 않는 사원에 대한 검색(비교안됨 commission_pct = NULL => ommission_pct is NULL )
select * from employees where commission_pct = NULL;      -- 틀림
select * from employees where commission_pct is NULL;     -- 맞음
select * from employees where commission_pct is not NULL; -- 맞음

select first_name, last_name, job_id, employee_id from employees where manager_id is NULL;

-- 12. order by 필드명 asc, oder by 필드명 desc
-- 사번을 기준으로 오름차순으로 정렬
select * from employees order by employee_id asc;

-- 사번을 기준으로 오름차순으로 정렬 부서번호가 100이 아닌 부서
select * from employees where department_id != 100 order by employee_id asc;

select employee_id, first_name, last_name, salary from employees order by salary desc;

select employee_id, first_name, last_name, hire_date from employees order by hire_date desc;

