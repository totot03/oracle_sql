select * from board;

select * from board where boardno > 0 order by regdate desc;
desc board;

select * from board where boardno = 8;
delete from board where boardno = 2;
rollback;

update board set title = 'aaa', content = 'aaa', writer = 'aaaa' where boardno = 8;


