-----회원 테이블------------------------------------------------------------------------------
SELECT * FROM PET_MEMBER
DROP TABLE PET_MEMBER

CREATE TABLE PET_MEMBER(
	id varchar2(100) primary key,			-- 아이디
	name varchar2(100) not null,			-- 이름
	addressCode varchar2(100) not null,		-- 우편번호
	address varchar2(100) not null,				-- 주소
	detailAddress varchar2(100) not null,		-- 상세주소
	gender varchar2(100) not null,			-- 성별
	email varchar2(100) not null,			-- 메일주소
	password varchar2(100) not null,		-- 비밀번호
	tel varchar2(100) not null,				-- 연락처
	job varchar2(100) not null,				-- 직업
	rank varchar2(100) not null,
	existence varchar2(100) not null,
	enabled number not null					-- 2016.07.05 추가된 컬럼, 탈퇴상태를 나타냄
												-- 0 : 탈퇴상태  1 : 현재 회원
)

-- 회원이 입력하는 pet 정보 테이블--------------------------------------------------
CREATE sequence petNo_seq
DROP sequence petNo_seq

SELECT * FROM PET
DROP TABLE PET

CREATE TABLE PET(
	petNo number primary key, 				-- 펫 고유 번호(시퀀스)
 	petName varchar2(100) not null,	 		-- 펫이름
	petAge number not null,					-- 펫나이
   	petType varchar2(100) not null,			-- 펫종류(개, 고양이, 기타 등등)
   	petGender varchar2(100) not null,		-- 펫성별
   	petNeutral varchar2(100) not null,		-- 펫중성화 여부
   	petImg varchar2(100) not null,			-- 펫사진
   	petSize varchar2(100) not null,			-- 펫크기
   	etc clob not null,						-- 특이사항(기타)
   	id varchar2(100) not null,				-- 회원의 아이디			
   	constraint fk_pet_id foreign key(id) references PET_MEMBER(id) on delete cascade
)
------펫시터 테이블-----------------------------------------------------------------------------
CREATE sequence petsitterNo_seq
DROP sequence petsitterNo_seq

SELECT * FROM PETSITTER
DROP TABLE PETSITTER cascade constraint

CREATE TABLE PETSITTER(
   petsitterNo number primary key,		-- 돌보미의 고유 번호(시퀀스)
   petNumber number default 0,			-- 임보가능한 동물의 수		
   service varchar2(100) not null,		-- 서비스(픽업,산책,목욕 등등)
   price number not null,				-- 맡기는 가격
   petSize varchar2(100) not null,		-- 자신이 원하는 펫크기
   petType varchar2(100) not null,		-- 펫 타입
   houseImg varchar2(100) not null,		-- 집 사진
   petsitterImg varchar2(100) not null, -- 펫시터 사진
   adminRecog varchar2(50) not null,	-- 인증 받은 여부
   id varchar2(100) not null,			-- PET_MEMBER의 아이디 FK
   petsitter_enabled number not null, -- petsitter 상태 ( 0 :  추방 , 1: 펫시터 기능 사용 가능 )
   constraint fk_member_id foreign key(id) references PET_MEMBER(id) on delete cascade
)

-----펫시터 보드 테이블--------------------------------------------------------------------------------
CREATE sequence petsitterboard_no_seq
DROP sequence petsitterboard_no_seq

SELECT * FROM PETSITTERBOARD
DROP TABLE PETSITTERBOARD

CREATE TABLE PETSITTERBOARD(
   petsitterboard_no number primary key,			-- 게시물 번호(시퀀스)
   petsitterboard_title varchar2(100) not null,		-- 게시물 제목( 간략하게 자신 어필 )
   petsitterboard_contents clob not null,			-- 게시물 내용
   startDay varchar2(100) not null,
   endDay varchar2(100) not null,
   petsitterNo number not null,						-- 게시글을 올린 돌보미의 번호(foreign key)
   constraint fk_petsitterNo foreign key(petsitterNo) references petsitter(petsitterNo) on delete cascade
)

-----예약테이블---------------------------------------------------------------------------------------
CREATE sequence reserve_no_seq
DROP sequence reserve_no_seq

SELECT * FROM RESERVE
DROP TABLE RESERVE

CREATE TABLE RESERVE(
	reserve_no number primary key,			-- 예약 번호(시퀀스)
	reserve_price number not null,			-- 예약시 예약한 가격
	reserve_recog varchar2(100) not null,	-- 예약대기,예약완료,처리중,처리완료 4단계
	petCheckNumber number not null,
	id varchar2(100) not null,				-- 회원의 아이디 ( foreign key )
	petNo number not null,					-- 펫정보 테이블에 있는 펫의 고유 번호(시퀀스)
	petsitterboard_no number not null,		-- 예약한 게시글의 primary key인 no
	constraint fk_member2_id foreign key(id) references PET_MEMBER(id) on delete cascade,
	constraint fk_petNo foreign key(petNo) references pet(petNo) on delete cascade,
	constraint fk_petsitterboard_no foreign key(petsitterboard_no) references petsitterboard(petsitterboard_no) on delete cascade
)

------펫시터가 예약 가능한 기간을 설정 하는 테이블 ----------------------------------------------------------
CREATE sequence pet_calNO_seq
DROP sequence pet_calNO_seq

SELECT * FROM PET_CALENDAR
DROP TABLE PET_CALENDAR

CREATE TABLE PET_CALENDAR(
	pet_calNo number primary key,		-- 일련번호
	pet_calDate varchar2(100) not null,	-- 예약 가능 날짜
	pet_reserve varchar2(100),			-- 예약 여부
	petsitterboard_no number not null,	-- 게시판 번호
	reserve_no number not null,			-- 예약번호
	constraint fk_petsitterboard2_no foreign key(petsitterboard_no) references petsitterboard(petsitterboard_no) on delete cascade,
	constraint fk_pet_reserveNo foreign key(reserve_no) references reserve(reserve_no) on delete cascade
)

-------거래내역 테이블------------------------------------------------------------------------------------------
CREATE sequence tradeinfo_no_seq nocache
DROP sequence tradeinfo_no_seq

SELECT * FROM TRADEINFO
DROP TABLE TRADEINFO

CREATE TABLE TRADEINFO(
	tradeinfo_no number primary key, -- 거래내역 번호(시퀀스)
	tradeSdate varchar2(100) not null, -- 거래기간
	tradeEdate varchar2(100) not null, -- 거래기간
	tradePrice number not null, -- 거래가격
	id varchar2(100) not null, -- 회원(petmom)의 아이디
	petsitterNo number not null, -- 돌보미(petsitter) 번호
	petsitterboard_no number not null,
	constraint fk_petmember_id foreign key(id) references PET_MEMBER(id) on delete cascade,
	constraint fk_petsitterNo2 foreign key(petsitterNo) references petsitter(petsitterNo) on delete cascade,
	constraint fk_petsitterboard3_no foreign key(petsitterboard_no) references petsitterboard(petsitterboard_no) on delete cascade
)

-- qna게시판--------------------------------------------------------------
create sequence qnaboard_seq;
-- 질문게시판(1:1)
CREATE TABLE QNABOARD(
	qnaboard_no number primary key not null, 	--게시물 번호
	qnaboard_title varchar2(100) not null,		--제목
	qnaboard_question clob not null,				--질문
	time_posted date not null,					--작성시간
	time_answered date,							--답변시간
	qnaboard_answer clob,						--답변
	id varchar2(100) not null,					--아이디
	constraint fk_qnaboard_id foreign key(id) references PET_MEMBER(id) on delete cascade
)  

-- 자유게시판 시퀀스---------------------------------------------------------
create sequence freeboard_seq;
-- 자유게시판
CREATE TABLE freeboard(
   freeboard_no number primary key,
   freeboard_title varchar2(100) not null,
   freeboard_contents clob not null,
   freeboard_hits number default 0 not null,
   freeboard_timePosted date not null,
   id varchar2(100) not null,
   constraint fk_freeboard_id foreign key(id) references PET_MEMBER(id) on delete cascade
)


--------자유게시판 댓글 시퀀스----------------------------------------------------------
create sequence freeboard_reply_seq;

create table freeboard_reply(
   reply_no number primary key,		--댓글 번호
   content clob not null,			--댓글 내용
   time_posted date not null,		--댓글 작성시간
   grp number default 0,			--댓글의 그룹
   lvl number default 0,			--댓글의 레벨
   con number default 0,			--댓글의 상태(삭제)
   id varchar2(100) not null,		--작성자 아이디
   ref number default 0,			--게시판 게시글 번호
   constraint fk_pet4_id foreign key(id) references pet_member(id) on delete cascade,
   constraint fk_freeboard_reply_ref2 foreign key(ref) references freeboard(freeboard_no) on delete cascade
)

---------메세지_넘버 시퀀스------------------------------------------------------------
create sequence message_seq nocache;

create table message(
   message_no number primary key,		--메세지 NO
   title varchar2(100) not null,		--타이틀
   content clob not null,				--메세지 내용
   time_posted date not null,			--메세지 작성시간
   checked number default 0,			--메세지 read or not (안읽은 메세지 갯수를 가져오기 위해)
   id varchar2(100) not null,			--메세지 작성 id
   constraint fk_pet3_id foreign key(id) references pet_member(id) on delete cascade
)

--------------------------------리뷰-------------------------------------------
create sequence review_seq nocache;
drop sequence review_seq;
drop table review

create table review(
   review_no number primary key,		--리뷰 NO
   content clob not null,					--리뷰 내용
   time_posted date not null,			--리뷰 작성시간
   star_rate number default 0,						--별점 
   id varchar2(100) not null,			--리뷰 작성 id
   ref_id varchar2(100) not null,		--작성대상자의 id
   constraint fk_pet5_id foreign key(id) references pet_member(id) on delete cascade,
   constraint fk_pet6_id foreign key(ref_id) references pet_member(id) on delete cascade
)
-------------------------------------------------------
-- 2016.07.05 추가된 테이블
-- 권한 테이블
/*
 * SECURITY는 권한이 일치하는 대상에 대해 권한을 주기 때문에 
   관리자 권한 즉, ROLE_ADMIN을 보유하고 있더라도 
   사용자 권한인 ROLE_USER를 보유하고 있지 않을 경우 접근을 못하게 된다 
   따라서 한 유저는 여러개의 권한(1:n)을 보유할 수 있어야 하므로 테이블을 생성한다 
   authorities
 */
select * from authorities
drop table authorities;
create table authorities(
	username varchar2(100) not null,
	authority varchar(30) not null,
	constraint fk_authorities foreign key(username) references pet_member(id)
)

-------------------------------------------------------
