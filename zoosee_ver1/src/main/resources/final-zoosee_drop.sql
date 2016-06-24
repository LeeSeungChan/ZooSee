-- 펫 고유 번호(시퀀스)
drop sequence petNo_seq;

-- 게시물 번호(시퀀스)
drop sequence petsitterboard_no_seq;

-- 돌보미의 고유 번호(시퀀스)
drop sequence petsitterNo_seq;

 -- 게시물 번호(시퀀스)
drop sequence petbook_no_seq;

-- 일련번호(시퀀스)
drop sequence pet_calNO_seq;

-- 회원 테이블
drop table pet_member 

-- 회원이 입력하는 pet 정보 테이블
drop table pet

-- 회원에서 petsitter(돌보미) 로 등록 시 돌보미테이블
drop table petsitter

-- 돌보미들이 업로드하는  게시글 테이블
drop table petsitterboard

-- 예약테이블
drop table reserve

-- 펫시터가 예약 가능한 기간을 설정 하는 테이블
drop table pet_calendar

-- 거래내역 테이블
drop table tradeinfo

-- 질문게시판 시퀀스
drop sequence qnaboard_seq;

-- qna게시판
drop table qnaboard;

-- 자유게시판 시퀀스
drop sequence freeboard_seq;

-- 자유게시판
drop table freeboard;

--자유게시판 댓글 시퀀스
drop sequence freeboard_reply_seq;

--자게 댓글테이블 드롭
drop table freeboard_reply;

--메세지_넘버 시퀀스
drop sequence message_seq;

--알림 메세지 테이블
drop table message;
