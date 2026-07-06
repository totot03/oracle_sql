-- 1.사용자가 정의한 테이블 생성하기 (emp01) 속성(사원번호, 이름, 연봉)
create table EMP01(
    empno number(4),
    name VARCHAR2(20),
    salary number(7,2)
);

select * from EMP01;

-- 2.기존테이블 복사(employees -> employees2)
create table employees2
as
select * from employees;

-- 3.테이블에 대한 정보가 기록된 테이블(tab)
select * from tab;

-- 4. 테이블 컬럼수정(추가 alter add 컬럼, 수정 alter modify 컬럼, 삭제 alter drop 컬럼)

-- ALTER TABLE table_name ADD(column_name data_type expr, …);

-- EMPoyees2 테이블에 문자 타입의 직급 칼럼을 추가
desc employees2;
alter table employees2 add(job VARCHAR2(10));

-- <문제> 이미 존재하는 EMP01 테이블에 입사일 칼럼(CREDATE)을 날짜형으로 추가하라.
alter table employees2 add(CREDATE date);

-- ALTER TABLE로 기존 칼럼 수정
-- ALTER TABLE명령어에 MODIFY절을 사용하여 칼럼을 수정한다. 데이터의 타입, 크기를 변경할수있다.

-- ALTER TABLE table_name MODIFY(column_name    data_type expr, …);
-- <예> employees2 직급을 최대 30자까지 입력할 수 있도록 크기 수정
select * from employees2;
desc employees2;
alter table employees2 modify(job varchar2(20));

-- <예> employees2 직급(job)을 타입을 number 수정
alter table employees2 modify(job number(10));

-- ALTER TABLE로 기존 칼럼명 변경
-- ALTER TABLE table_name
-- RENAME COLUMN old_name TO new_name;
-- employees2 직급(job)을 컬러명을 job_copy 변경하시오.
alter table employees2
    rename COLUMN job TO job_copy;
    
-- alter table 기존 칼럼삭제    
-- ALTER TABLE table_name 
-- DROP COLUMN column_name;
-- employees2 직급(job_copy)을 컬러명을 삭제하시오.
alter table employees2
    drop COLUMN job_copy;

-- 5. 테이블 삭제
-- drop table 테이블명;
-- employees2 테이블을 삭제하시오.
drop table employees2;
desc employees2;

-- 6. 테이블명을 변경한다.
-- rename 이전 테이블명 to 현재 변경할 테이블명;
-- employees2 테이블이름을 employees3 변경하시오.
rename employees2 to employees3;
select * from tab;

-- 7. 테이블의 모든 로우를 제거하는 TRUNCATE문
-- DROP TABLE EMPLOYEES3;
-- TRUNCATE TABLE EMPLOYEES3;

select * from employees3;
TRUNCATE TABLE employees3;
desc employees3;

drop table employees3;

-- 논리적 테이블 구조를 보고, 물리적 테이블을 설계하시오
CREATE TABLE TB_CUSTOMER(
    customer_cd char(7) NOT NULL PRIMARY KEY,
    costomer_nm varchar2(20) NOT NULL,
    MW_FLG char(1) NOT NULL,
    BIRTH_DAY CHAR(8) NOT NULL,
    PHONE_NUMBER VARCHAR2(16),
    EMAIL VARCHAR2(30),
    TOTAL_POINT NUMBER(10),
    REG_DTTM CHAR(14)
);

desc TB_CUSTOMER;

-- 학생 성적 테이블을 만들어 봅시다.
-- 1.학번의 (숫자)데이터는 중복되거나 null값을 허용하면 안 되고
-- 2.이름은 문자데이터며 null값을 허용하지 않고
-- 3.국어, 영어, 수학 컬럼을 number 타입으로 가지고 모두 다 null값을 허용하지 않습니다.
-- 4.단, 국어,영어,수학 컬럼에 데이터를 넣지 않으면 기본값으로 0을 갖습니다. DEFAULT 0;
-- 5.총점과 평균 컬럼은 기본값을 0을 갖습니다.


CREATE TABLE TB_STUDENT(
    stu_num number(10) PRIMARY KEY,
    stu_name VARCHAR2(4) NOT NULL,
    kor_num number(3) DEFAULT 0 NOT NULL,
    math_num number(3) DEFAULT 0 NOT NULL,
    eng_num number(3) DEFAULT 0 NOT NULL,
    stu_total number(3) DEFAULT 0,
    stu_avg number(3) DEFAULT 0
);

desc TB_STUDENT;

