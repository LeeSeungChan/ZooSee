alter table petsitterboard drop column petsitterboard_price;
alter table petsitterboard drop column petsitterboard_petsize;
alter table petsitterboard drop column petsitterboard_pettype;

delete tablename where condition
delete pet_member where id='java' cascade CONSTRAINTS

-- 펫 고유 번호(시퀀스)
create sequence petNo_seq;
drop sequence petNo_seq;

select count(*) from  petsitterboard pb, petsitter pt, pet_member m
where pt.petsitterNo = pb.petsitterNo and pt.id=m.id and m.address like '서울'

-- 게시물 번호(시퀀스)
create sequence petsitterboard_no_seq;
drop sequence petsitterboard_no_seq;

-- 돌보미의 고유 번호(시퀀스)
create sequence petsitterNo_seq;
drop sequence petsitterNo_seq;

 -- 게시물 번호(시퀀스)
create sequence petbook_no_seq;
drop sequence petbook_no_seq;

delete petsitter where petsitterNo=2
-- 일련번호(시퀀스)
create sequence pet_calNO_seq;
drop sequence pet_calNO_seq;
commit
select * from pet_member
select * from pet
select * from petsitter
select * from petsitterboard
select * from pet_calendar
select * from reserve
select * from tradeinfo
drop table pet_member  cascade CONSTRAINTS; 
drop table pet
drop table petsitter
drop table petsitterboard
drop table pet_calendar
drop table reserve
drop table tradeinfo
commit
-- 회원 테이블
CREATE TABLE PET_MEMBER(
	-- 아이디
	id varchar2(100) primary key,
	-- 이름
	name varchar2(100) not null,
	-- 주소
	addressCode varchar2(100) not null,
	address varchar2(100) not null,
	detailAddress varchar2(100) not null,
	-- 성별
	gender varchar2(100) not null,
	-- 메일주소
	email varchar2(100) not null,
	-- 비밀번호
	password varchar2(100) not null,
	-- 연락처
	tel varchar2(100) not null,
	-- 직업
	job varchar2(100) not null,
	-- 회원등급 ( 0 : 일반 회원 , 1 : 펫정보를 입력한 회원)
	-- varchar2(50) 으로 할 시 스트링으로 임의의 값을 입력함
	--  판매자는 펫정보를 입력 안해도 되는경우가 있음
	rank varchar2(100) not null,
	existence varchar2(100) not null
)
select *from pet
-- 회원이 입력하는 pet 정보 테이블
CREATE TABLE PET
(
   -- 펫 고유 번호(시퀀스)
   petNo number primary key,
   -- 펫이름
   petName varchar2(100) not null,
   -- 펫나이
   petAge number not null,
   -- 펫종류(개, 고양이, 기타 등등)
   petType varchar2(100) not null,
   -- 펫성별
   petGender varchar2(100) not null,
   -- 펫중성화 여부
   petNeutral varchar2(100) not null,
   -- 펫사진
   petImg varchar2(100) not null,
   -- 펫크기
   petSize varchar2(100) not null,
   -- 특이사항(기타)
   etc clob not null,
    -- 회원의 아이디
   id varchar2(100) not null,
   --회원의 아이디를받아 foreign key로 설정
   constraint fk_pet_id foreign key(id) references PET_MEMBER(id) on delete cascade
)

-- 회원에서 petsitter(돌보미) 로 등록 시 돌보미테이블
create table petsitter
(
   -- 돌보미의 고유 번호(시퀀스)
   petsitterNo number primary key,
   -- 임보가능한 동물의 수
   petNumber number default 0,
   -- 서비스(픽업,산책,목욕 등등)
   service varchar2(100) not null,
   -- 1박당 가격
   price number not null,
   -- 자신이 원하는 펫크기
   petSize varchar2(100) not null,
   -- 자신의 원하는 펫종류
   petType varchar2(100) not null,
   -- 집 사진
   houseImg varchar2(100) not null,
   -- 돌보미의 사진
   petsitterImg varchar2(100) not null,
   -- 관리자의 승인
   adminRecog varchar2(50) not null,
   -- 회원의 아이디
   id varchar2(100) not null,
   -- 회원의 아이디를 가져와 foreign key 로 설정
   constraint fk_member_id foreign key(id) references PET_MEMBER(id) on delete cascade
)
-- 돌보미들이 업로드하는  게시글 테이블
create table petsitterboard
(
   -- 게시물 번호(시퀀스)
   petsitterboard_no number primary key,
   -- 게시물 제목( 간략하게 자신 어필 )
   petsitterboard_title varchar2(100) not null,
   -- 게시물 내용
   petsitterboard_contents varchar2(100) not null,
   -- 게시글을 올린 돌보미의 번호(foreign key)
   petsitterNo number not null,
   -- 돌보미의 primary key 인 no 를 foreign key 로 설정
   constraint fk_petsitterNo foreign key(petsitterNo) references petsitter(petsitterNo) on delete cascade
)

-- 예약테이블
CREATE TABLE reserve
(
	-- 예약 번호(시퀀스)
	reserve_no number primary key,
	-- 예약시 예약한 가격
	reserve_price number not null,
	-- 맡기는 사람이 예약 신청 할 시 돌보미가 신청한 정보를 보고 승인을 내림
	-- 예약대기,예약완료,처리중,처리완료 4단계
	reserve_recog varchar2(100) not null,
	-- 회원의 아이디 ( foreign key )
	id varchar2(100) not null,
	-- 펫정보 테이블에 있는 펫의 고유 번호(시퀀스)
	petNo number not null,
	-- 예약한 게시글의 primary key인 no
	petsitterboard_no number not null,
	-- 회원의 아이디를 foreign key 로 설정
	constraint fk_member2_id foreign key(id) references PET_MEMBER(id) on delete cascade,
	-- 펫 테이블의 고유 번호를 foreign key 로 설정
	constraint fk_petNo foreign key(petNo) references pet(petNo) on delete cascade,
	-- 게시글의 번호를 foreign key 로 설정
	constraint fk_petsitterboard_no foreign key(petsitterboard_no) references petsitterboard(petsitterboard_no) on delete cascade
)

-- 펫시터가 예약 가능한 기간을 설정 하는 테이블
create table pet_calendar
(
	-- 돌보미 마다 기간이 다름
	-- 고유 번호를 주어 경계를 구분함
	-- 일련번호
	pet_calNo number primary key,
	-- 예약 가능 날짜
	pet_calDate varchar2(100) not null,
	-- 예약 여부
	pet_reserve varchar2(100),
	-- 게시판 번호
	petsitterboard_no number not null,
	-- 예약번호
	reserve_no number not null,
	constraint fk_petsitterboard2_no foreign key(petsitterboard_no) references petsitterboard(petsitterboard_no) on delete cascade,
	constraint fk_pet_reserveNo foreign key(reserve_no) references reserve(reserve_no) on delete cascade
)

-- 거래내역 테이블
create table tradeinfo
(
	-- 거래내역 번호(시퀀스)
	tradeinfo_no number primary key,
	-- 거래내역 정보
	tradeinfo_info varchar2(100) not null,
	-- 거래기간
	tradeinfo_period varchar2(100) not null,
	-- 거래상태
	tradeinfo_state varchar2(100) not null,
	-- 회원의 아이디
	id varchar2(100) not null,
	-- 돌보미 번호
	pesitterNo number not null,
	constraint fk_pet2_id foreign key(id) references PET_MEMBER(id) on delete cascade,
	constraint fk_pesitterNo foreign key(pesitterNo) references petsitter(petsitterNo) on delete cascade
)
-- qna게시판
-- 질문게시판 시퀀스
select * from QNABOARD
create sequence qnaboard_seq;
drop sequence qnaboard_seq;
drop table qnaboard;
-- 질문게시판(1:1)
create table QNABOARD
(
	qnaboard_no number primary key not null,
	qnaboard_title varchar2(100) not null,
	qnaboard_question clob not null,
	time_posted date not null,
	time_answered date,
	qnaboard_answer clob,
	id varchar2(100) not null,
	constraint fk_qnaboard_id foreign key(id) references PET_MEMBER(id) on delete cascade
)  
-- 자유게시판 시퀀스
create sequence freeboard_seq;
drop sequence freeboard_seq;
drop table freeboard;
-- 자유게시판
create table freeboard
(
   freeboard_no number primary key,
   freeboard_title varchar2(100) not null,
   freeboard_contents clob not null,
   freeboard_hits number default 0 not null,
   freeboard_timePosted date not null,
   id varchar2(100) not null,
   constraint fk_freeboard_id foreign key(id) references PET_MEMBER(id) on delete cascade
)


--자유게시판 댓글 시퀀스
create sequence freeboard_reply_seq;
drop sequence freeboard_reply_seq;

--자게 댓글테이블 드롭
drop table freeboard_reply;

--자유게시판 댓글
create table freeboard_reply(
   --댓글 번호
   reply_no number primary key,
   --댓글 내용
   content clob not null,
   --댓글 작성시간
   time_posted date not null,
   --댓글의 그룹
   grp number default 0,
   --댓글의 레벨
   lvl number default 0,
   --댓글의 상태(삭제)
   con number default 0,
   --작성자 아이디
   id varchar2(100) not null,
   --게시판 게시글 번호
   ref number default 0,
   constraint fk_pet2_id foreign key(id) references pet_member(id) on delete cascade,
   constraint fk_freeboard_reply_ref foreign key(ref) references freeboard(freeboard_no) on delete cascade
)

--메세지_넘버 시퀀스
create sequence message_seq nocache;
drop sequence message_seq;
drop table message;

--알림 메세지 테이블
create table message(
   --메세지 NO
   message_no number primary key,
   --타이틀
   title varchar2(100) not null,
   --메세지 내용
   content clob not null,
   --메세지 작성시간
   time_posted date not null,
     --메세지 read or not (안읽은 메세지 갯수를 가져오기 위해)
   checked number default 0,
  --메세지 작성 id
   id varchar2(100) not null,
   --게시판 게시글 번호
   constraint fk_pet3_id foreign key(id) references pet_member(id) on delete cascade
)


	select fb.freeboard_no,fb.freeboard_title,fb.freeboard_hits,fb.freeBoardTimePosted,pm.id ,pm.name
		from(
		     select  freeboard_no,freeboard_title, freeBoardTimePosted,freeboard_hits ,ceil(rownum/5) as page, id
			 from(
				select freeboard_no,freeboard_title,to_char(freeboard_timePosted,'YYYY.MM.DD') as freeBoardTimePosted ,freeboard_hits,id
				from freeboard order by freeboard_no desc
				) 
		) fb, pet_member pm where fb.id=pm.id and page=1