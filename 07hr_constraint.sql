-- 무결성 제약조건(not null, unique, primary key, check, foreign key)

-- 1.not null(제약조건 컬럼레벨방식으로 구현, 테이블 레벨방식으로 안됨)
-- 2.unique 제약조건 == primary key 제약조건과 똑같다. (다른것 : null허용)

-- emp02 생성한다(employees복사)
drop table emp02;

create table emp02
as
select * from employees;

desc emp02;
-- 제약조건설정 employee_id primary key 제약조건을 설정한다.
-- 제약조건설정 phone_number unique 제약조건을 설정한다.

alter table emp02 add CONSTRAINT pk_emp02_id primary key(employee_id); 

alter table emp02 add CONSTRAINT uk_emp02_phone unique(phone_number);


-- phone_number not null 제약조건을 설정한다.
alter table emp02
    modify phone_number varchar2(20) constraint nn_emp02_phone not null;
    
-- phone_number not null 제약조건을 삭제
alter table emp02
    drop CONSTRAINT nn_emp02_phone;

desc emp02;
   
-- 데이터 딕셔너리 (dba_XXX, all_XXX, user_XXX : user_tables, user_constraints, user_cons_columns)
select * from user_constraints where table_name = 'EMP02'; 
select * from user_cons_columns where table_name = 'EMP02';
select * from user_tables;

-- 테이블 emp03 생성
create table emp03(
    empno number(4),
    empname varchar2(20) not null,
    job varchar2(20),
    CONSTRAINT uk_emp03_no UNIQUE(empno)
);

insert into emp03 VALUES(null, 'dkj', 'programmer');
insert into emp03 VALUES(1234, 'dkj', 'programmer');
insert into emp03 VALUES(null, 'dkj2', 'db developer');
delete from emp03 where job = 'db developer';
select * from emp03;

UPDATE emp03 set empno = 0 where empno is null;
alter table emp03 
    MODIFY empno number(4) not null;
    
-- 3. primary key(null 허용없음, 중복허용하지 않음) == 자동 인덱스설정

-- 4. foreign key (참조 무결성 제약조건)

-- 테이블설계 부서(dep) 설계테이블 (부서번호: deptno pk, 부서명: deptname unique, 지역명: deptloc not null)
-- 제약조건이름(pk: pk_테이블명_칼럼명약어, not null: nn_~~, unique: uk_~~
drop table dept;
select * from user_tables where table_name = 'DEPT';

create table dept(
    deptno number(7),
    deptname varchar2(30),
    deptloc varchar2(30) CONSTRAINT nn_dept_loc not null,
    CONSTRAINT pk_dept_no primary key(deptno),
    CONSTRAINT uk_dept_name UNIQUE(deptloc)
);
insert into dept values(10, '관리과', '서울');
insert into dept values(20, '관리과2', '서울2');
insert into dept values(30, '관리과3', '서울3');
insert into dept values(40, '관리과4', '서울4');
select * from dept;

delete from dept where deptno = 10;

-- 사원테이블(emp) dept 참조테이블설정,(사원번호(pk):empid, 사원명:empname, 직급:jobid, 급여:salary, 부서번호(fk):deptno)
create table emp(
    empid number(5),
    emname char(5) not null,
    jobid varchar2(7),
    salary number(5),
    deptno number(7),
    CONSTRAINT pk_emp_id primary key(empid),
    CONSTRAINT fk_emp_dept_no FOREIGN key(deptno) REFERENCES dept(deptno) 
);

-- 제약조건수정(fk_emp_dept_no 삭제를 하고, 다시 재설정)
-- on delete cascade;
alter table emp
    drop CONSTRAINT fk_emp_dept_no;
alter table emp
    add CONSTRAINT fk_emp_dept_no FOREIGN key(deptno) REFERENCES dept(deptno) on delete set null;

insert into emp values(1, 'kdj', '부장', 10000, null);
insert into emp values(2, 'kdj2', null, null, 10);
update emp set deptno = 50 where empid = 1;
select * from emp;
delete from emp where empid = 1;
select * from user_constraints;
    
drop table emp;

-- check 제약조건

-- emp 테이블에 gender char(1) default 'M' 추가하시오.
alter table emp
add gender char(1) DEFAULT 'M';

-- emp 테이블에 gender check 제약조건을 넣어주세요.('M', 'F', 'O') 
alter table emp
add CONSTRAINT ck_emp_gender check(gender in ('M', 'F', 'O'));

select * from user_constraints where table_name = 'EMP';
select * from user_cons_columns where table_name = 'EMP';

-- emp 테이블에 gender check 제약조건이 작동되는지 확인할것.
select * from emp;
-- check 'A'제약조건에 위배가 된다.
insert into emp values(3, 'kdj3', '부장3', 10000, null, 'A');

-- emp 테이블에 score number(4) 여기 체크제약조건을 걸어주시오(0~100)
alter table emp
add score number(4) CONSTRAINT ck_emp_score check(score between 0 and 100);

--foreign key 옵션 5가지
-- 1.NO ACTION : 참조 테이블에 변화가 있어도 기본 테이블에는 아무 조취를 취하지 않는다.
-- 2.CASCADE : 참조 테이블의 튜플이 삭제되면 기본 테이블의 관련 튜플도 삭제되고, 속성이 변경되면 관련 튜플의 속성 값도 모두 변경된다.
-- 3.SET NULL : 참조 테이블에 변화가 있으면 기본 테이블의관련 튜플의 속성 값을 NULL로 변경한다.
-- 4.SET DEFAULT : 참조 테이블에 변화가 있으면 기본 테이블의 관련 튜플의 속성 값을 기본값으로 변경한다.
-- 5.RESTRICT : 참조 테이블에 변화(삭제,수정)가 있으면 , 기본테이블경우 데이터 삭제나 수정 불가
alter table emp
    drop CONSTRAINT fk_emp_dept_no;
alter table emp
    add CONSTRAINT fk_emp_dept_no FOREIGN key(deptno) REFERENCES dept(deptno) on delete set null;
        
insert into emp values(5, 'kdj5', '부장5', 10000, 40, 'F', 10);
select * from dept;

delete from dept where deptno = 40;

create table gogek(
    gogek_code number(5),
    gogek_name varchar2(20) not null,
    gogek_age number(3),
    gogek_addr varchar2(50),
    gogek_tel varchar2(20),
    CONSTRAINT pk_gogek_code PRIMARY key(gogek_code)
);

create table video(
    v_code number(5),
    v_title varchar2(50) not null,
    v_genre varchar2(30),
    v_pay number(7) not null,
    v_lend_state number(1),
    v_make_company varchar2(50),
    v_make_date date,
    v_view_age number(1),
    CONSTRAINT pk_video_code PRIMARY key(v_code)
);

select * from video;

create table lend(
    lr_code number(5),
    gogek_code number(5),
    v_code number(5),
    l_date date,
    r_plan_date date,
    l_total_pat number(7),
    CONSTRAINT pk_lend_lr PRIMARY key(lr_code),
    CONSTRAINT fk_lend_gogek_code FOREIGN key(gogek_code) REFERENCES gogek(gogek_code) on DELETE set null,
    CONSTRAINT fk_lend_video_code FOREIGN key(v_code) REFERENCES video(v_code) on DELETE set null
);