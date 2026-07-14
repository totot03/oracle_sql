create table board(
    boardNo number, 
	title varchar2(200) not null, 
	content varchar2(1000), 
	writer varchar2(100) not null, 
	regDate date DEFAULT sysdate not null,
    CONSTRAINT pk_board_no primary key(boardNo)
);

create sequence board_seq
start with 1
increment by 1
NOCYCLE
CACHE 2;

insert into board(boardNo, title, content, writer) values(board_seq.nextval, 'title', 'content', 'zeus');
select * from board;
rollback;

select * from user_tables;
select * from user_sequences;
select * from user_constraints;

select * from board where boardno > 0 order by regdate desc;

update board set title = 'aaa', content = 'aaa', writer = 'aaaa' where boardno = 8;

-- jpa
-- jpaboard
drop table jpaboard;
create table jpaboard(
    board_no number, 
	title varchar2(200) not null, 
	content varchar2(1000), 
	writer varchar2(100) not null, 
	reg_date date DEFAULT sysdate not null,
    CONSTRAINT pk_jpaboard_no primary key(board_no)
);

desc jpaboard;
drop SEQUENCE jpaboard_seq;
create sequence JPABOARD_SEQ
start with 1
increment by 1;

CREATE TABLE mybatisboard( 
board_no NUMBER,
title VARCHAR2(100) NOT NULL,
content VARCHAR2(500) NULL,
writer VARCHAR2(50) NOT NULL,
reg_date DATE DEFAULT SYSDATE,
CONSTRAINT pk_mybatisboard_no PRIMARY KEY(board_no)
);

create sequence mybatisboard_seq
start with 1
increment by 1;

select * from mybatisboard;
