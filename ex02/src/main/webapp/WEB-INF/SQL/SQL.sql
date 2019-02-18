
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
alter table tbl_board add constraint pk_board primary key(bno);


drop table tbl_board purge;

drop sequence seq_board;



select * from ALL_USERS;

insert into TBL_BOARD (bno, title, content, writer)
values (seq_board.nextval, '테스트 제목', '테스트 내용', 'user00');

select * from tbl_board;

commit

select * from tbl_board order by  bno desc;
select * from tbl_board where bno > 0 order by bno asc
select * from tbl_board where bno > 0 order by bno desc;

select * from user_sequences;

select seq_board.nextval from dual;

select sequence_name, min_value, max_value, increment_by, last_number from user_sequences;

select sequence_name, cache_size from user_sequences;

alter sequence SEQ_BOARD nocache;

select
	/*+ INDEX_DESC(tbl_board pk_board) */
	*
 from
 	tbl_board
 	where bno > 0;
 	
 	select * from user_constraints where table_name = 'tbl_board';
 	
 	select * from tbl_board order by bno desc;
 	
 	select /*+INDEX_DESC (tbl_board pk_board) */*
 	from tbl_board;
 	
 	select /*+ FULL(tbl_board) */ * from tbl_board order by bno desc;
 	
 	select /*+ INDEX_ASC(tbl_board pk_board) */ * from tbl_board 
 	 where bno >0;
 	 
 	 select /*+ FULL(tbl_board) */
 	  rownum rn, bno, title
 	 from tbl_board where bno>0
 	 order by bno;
 	 
 	 select /*+ INDEX_ASC(tbl_board pk_board)  */
 	 	rownum rn , bno, title, content
 	 from tbl_board;
 	 
 	 select
 	 /*+ INDEX_DESC(tbl_board pk_board) */
 	 rownum rn, bno, title, content
 	 from tbl_board
 	 where bno > 0;
 	 
 	 select /*+ INDEX_DESC(tbl_board pk_board) */
 	 	rownum rn, bno, title, content
 	 from
 	 	tbl_board
 	 where rownum <= 10;
 	 
 /* 아래의 SQL문은  사용이 불가함 */	 
 	 select /*+ INDEX_DESC(tbl_board pk_board) */
 	 	rownum rn, bno, title, content
 	 from
 	 	tbl_board
 	 where rownum > 10 and rownum <= 20;
 	 
 	-- ROWNUM은 반드시 1이 포함되도록 해야 한다. 
 	 select /*+ INDEX_DESC(tbl_board pk_board) */
 	 	rownum rn, bno, title, content
 	 from
 	 	tbl_board
 	 	where rownum <= 20;
 	 	
 --    먼저 20개의 데이터를 가져오고 인라인뷰를 통해서 2페이지에 해당하는 10개만을 추출	 	
 	 	select
 	 		bno, title, content
 	 		from
 	 			(
 	 			select /*+ INDEX_DESC(tbl_board pk_board) */
 	 				rownum rn, bno, title, content
 	 			from
 	 				tbl_board
 	 			where rownum <= 20
 	 			)
 	 		where rn > 10;	
 	 		
 	 		select bno, title, content, writer, regdate, updatedate from ( select /*+ INDEX_DESC(tbl_board 
pk_board) */ rownum rn, bno, title, content, writer, regdate, updatedate from tbl_board where 
rownum <= 3 * 10 ) where rn > (3 -1) * 10 

commit