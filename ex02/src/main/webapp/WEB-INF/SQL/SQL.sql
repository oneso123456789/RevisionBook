
create sequence seq_board
start with 1
increment by 1
maxvalue 999999999;

create table tbl_board(
	bno number(10,0),
	title varchar2(200) not null,
	content varchar2(2000) not null,
	writer varchar2(50) not null,
	regdate date default sysdate,
	updatedate date default sysdate
);

drop table tbl_board purge;

drop sequence seq_board;

alter table tbl_board add constraint pk_board primary key(bno);

select * from ALL_USERS;

insert into TBL_BOARD (bno, title, content, writer)
values (seq_board.nextval, '테스트 제목', '테스트 내용', 'user00');

select * from tbl_board;

commit

select * from tbl_board order by  bno desc;

select * from tbl_board where bno > 0 order by bno desc;

select * from user_sequences;

select seq_board.nextval from dual;