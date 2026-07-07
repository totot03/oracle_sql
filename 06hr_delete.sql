-- delete
-- DELETE FROM table_name WHERE conditions;

-- (dept)부서 테이블의 모두 삭제한다(delete, truncat 차이점)
-- delete rollback 진행됨, truncat 삭제하면 진행안됨
select * from user_tables;
drop table dept;

create table dept
as
select * from departments;

select * from dept;
delete from dept;

TRUNCATE table dept;

ROLLBACK;

-- dept 30번부서를 삭제하시오
select * from dept where department_id = 30;
delete from dept where department_id = 30;

create table EMP01(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10) NOT NULL,
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE NOT NULL,
    SAL NUMBER(7,2) NOT NULL,
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) NOT NULL,   
    CONSTRAINT pk_emp01_no primary key(empno)
);
DROP TABLE EMP01;
SELECT * FROM EMP01;
INSERT INTO EMP01 VALUES (7369, 'SMITH', 'CLEAK', 7836, '1980-12-17', 800, NULL, 20);
INSERT INTO EMP01 VALUES (7499, 'ALLEN', 'SALESMAN', 7369, '1987-12-20', 1600, 300, 30);
INSERT INTO EMP01 VALUES (7839, 'KING', 'PRESIDENT', NULL, '1981-02-08', 5000, NULL, 10);

CREATE TABLE MEMBERS (
    ID VARCHAR2(20) PRIMARY KEY,
    NAME VARCHAR2(20) NOT NULL,
    REGNO VARCHAR2(14) NOT NULL,
    HP VARCHAR2(13) NOT NULL,
    ADDRESS VARCHAR2(100) NOT NULL
);
SELECT * FROM MEMBERS;
DROP TABLE MEMBERS;
INSERT INTO MEMBERS VALUES ('KIM123', '김철수', '123456-7898765', '010-9876-5432', '경기도 성남시');

CREATE TABLE BOOKS(
    CODE NUMBER(4) PRIMARY KEY,
    TITLE VARCHAR2(50) NOT NULL,
    COUNT NUMBER(6) NOT NULL,
    PRICE NUMBER(10) NOT NULL,
    PUBLISH VARCHAR2(50) NOT NULL
);
