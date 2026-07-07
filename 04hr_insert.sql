-- 1. insert문
-- INSERT INTRO table_name (column_value, ...) VALUES(column_value, ...)
-- 주의: 컬럼명 정확히 지켜라, 컬럼명갯수와 values개수가 맞아야한다.
-- 컬럼명타입과 values 타입이 같아야한다.
-- not null, primary key 제약조건을 체크할것

CREATE TABLE DEPT(
    DEPTNO NUMBER(2) PRIMARY KEY,
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13) not null
);

-- 칼럼 DEPTNO에 10번 부서, DNAME에는 ‘ACCOUNTING’을, LOC에는 ‘NEW YORK’을 추가하자
insert into dept(deptno, dname, loc) values(10,'accounting','new york');
insert into dept values(11,'accounting1','new york1');
insert into dept values(13, null, 'new york3');
insert into dept values(14, '', 'new york4');
insert into dept(deptno ,dname, loc) values(12, 'accounting2','new york2');

select * from dept;

drop table DEPT;

select * from tab where tname = 'dept';

-- dname null값을 '임의값'으로 변경했다.
update dept set dname = '임시값' where dname is null;

-- 컬럼 deptno 사이즈 4로 변경, dname을 not null 변경하세요
alter table dept 
    modify(deptno number(4), dname varchar2(30) not null);   
desc dept;

CREATE TABLE TB_HUMAN(
    customer_cd number(7) PRIMARY key,
    customer_nm varchar2(9) NOT NULL,
    mw_flg VARCHAR2(1) NOT NULL,
    birth_day DATE NOT NULL,
    phone_number CHAR(13),
    email VARCHAR2(20) NOT NULL,
    TOTAL_POINT NUMBER(10) NOT NULL,
    REG_DTTM TIMESTAMP NOT NULL
);

INSERT INTO TB_HUMAN VALUES (2017042, '강원진', 'M', DATE '1981-06-03', '010-8202-8790', 'wjgang#navi.com', 280300, TIMESTAMP '2017-01-23 13:24:32');
INSERT INTO TB_HUMAN VALUES (2017053, '나경숙', 'W', DATE '1989-12-25', '010-4509-0043', 'ksna#boram.co.kr', 4500, TIMESTAMP '2017-02-10 18:09:30');
INSERT INTO TB_HUMAN VALUES (2017108, '박승대', 'M', DATE '1971-12-30', NULL, 'sdpark#haso.com', 23450, TIMESTAMP '2017-05-08 20:34:50');

select * from TB_HUMAN;

drop table tb_human;

SELECT CUSTOMER_CD, CUSTOMER_NM, MW_FLG, BIRTH_DAY, PHONE_NUMBER, EMAIL, TOTAL_POINT, TO_CHAR(REG_DTTM, 'YYYY-MM-DD HH24:MI:SS') AS REG_DTTM FROM TB_HUMAN;

