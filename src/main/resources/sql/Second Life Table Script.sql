--CREATE USER C##SECONDLIFE IDENTIFIED BY SECONDLIFE;

--GRANT RESOURCE, CONNECT, UNLIMITED TABLESPACE TO C##SECONDLIFE;

---------------------------------------------------------------------
DROP TABLE PROFILE_IMG;
DROP TABLE CHAT_MESSAGE;
DROP TABLE REVIEW;
DROP TABLE FAVORITE_LIST;
DROP TABLE REPORT_IMG;
DROP TABLE BOARD_IMG;
DROP TABLE CHAT_ROOM;
DROP TABLE REPORT;
DROP TABLE BOARD;
DROP TABLE MEMBER;
DROP TABLE CATEGORY;
DROP TABLE TRADE_CATEGORY;
---------------------------------------------------------------------

DROP SEQUENCE SEQ_MEMBER_NO;
DROP SEQUENCE SEQ_PROFILE_IMG_NO;
DROP SEQUENCE SEQ_BOARD_NO;
DROP SEQUENCE SEQ_BOARD_IMG_NO;
DROP SEQUENCE SEQ_CATEGORY_NO;
DROP SEQUENCE SEQ_TRADE_CATEGORY_NO;
DROP SEQUENCE SEQ_CHAT_ROOM_NO;
DROP SEQUENCE SEQ_FAVORITE_LIST_NO;
DROP SEQUENCE SEQ_REPORT_NO;
DROP SEQUENCE SEQ_REPORT_IMG_NO;
DROP SEQUENCE SEQ_REVIEW_NO;
---------------------------------------------------------------------

CREATE SEQUENCE SEQ_MEMBER_NO START WITH 0 MINVALUE 0;
CREATE SEQUENCE SEQ_PROFILE_IMG_NO START WITH 0 MINVALUE 0;
CREATE SEQUENCE SEQ_BOARD_NO START WITH 0 MINVALUE 0;
CREATE SEQUENCE SEQ_BOARD_IMG_NO START WITH 0 MINVALUE 0;
CREATE SEQUENCE SEQ_CATEGORY_NO START WITH 0 MINVALUE 0;
CREATE SEQUENCE SEQ_TRADE_CATEGORY_NO START WITH 0 MINVALUE 0;
CREATE SEQUENCE SEQ_CHAT_ROOM_NO START WITH 0 MINVALUE 0;
CREATE SEQUENCE SEQ_FAVORITE_LIST_NO START WITH 0 MINVALUE 0;
CREATE SEQUENCE SEQ_REPORT_NO START WITH 0 MINVALUE 0;
CREATE SEQUENCE SEQ_REPORT_IMG_NO START WITH 0 MINVALUE 0;
CREATE SEQUENCE SEQ_REVIEW_NO START WITH 0 MINVALUE 0;

-- 회원 테이블
CREATE TABLE MEMBER (
   MEMBER_NO      NUMBER    NOT NULL,
   ID    VARCHAR2(45)    NOT NULL,
   PWD    VARCHAR2(300)    NOT NULL,
   NICKNAME    VARCHAR2(30)    NOT NULL,
   NAME    VARCHAR2(15)    NOT NULL,
   ADDRESS    VARCHAR2(120),
   PHONE    VARCHAR2(15)    NOT NULL,
   EMAIL    VARCHAR2(30)    NOT NULL,
   STATUS    CHAR(1 CHAR)    DEFAULT 'Y',
   CREATE_DATE    DATE    DEFAULT SYSDATE,
   MODIFY_DATE    DATE    DEFAULT SYSDATE,
   REPORT_COUNT    NUMBER    DEFAULT 0,
   ADMIN_AUTH    CHAR(1 CHAR)    DEFAULT 'N',

   CONSTRAINT PK_MEMBER_MN PRIMARY KEY (MEMBER_NO),
   CONSTRAINT UQ_MEMBER_ID UNIQUE (ID),
   CONSTRAINT UQ_MEMBER_NICKNAME UNIQUE (NICKNAME),
   CONSTRAINT UQ_MEMBER_EMAIL UNIQUE (EMAIL)
);

COMMENT ON COLUMN MEMBER.ID IS 'UNIQUE 제약 조건';
COMMENT ON COLUMN MEMBER.NICKNAME IS 'UNIQUE 제약 조건';
COMMENT ON COLUMN MEMBER.EMAIL IS 'UNIQUE 제약 조건(계정 인증 수단)';


-- 프로필 사진
CREATE TABLE PROFILE_IMG (
   PROFILE_NO    NUMBER    NOT NULL,
   MEMBER_NO    NUMBER    NOT NULL,
   CHANGE_NAME    VARCHAR2(30)    NOT NULL,
   PROFILE_PATH    VARCHAR2(300)    NOT NULL,
   STATUS    CHAR(1 CHAR)    DEFAULT 'Y',
   CREATE_DATE    DATE,
   MODIFY_DATE    DATE,
   
   CONSTRAINT PK_PROFILE_IMG_PN PRIMARY KEY (PROFILE_NO),
   CONSTRAINT FK_PROFILE_IMG_MN FOREIGN KEY (MEMBER_NO)
      REFERENCES MEMBER (MEMBER_NO)
);


-- 거래글 카테고리 테이블
CREATE TABLE CATEGORY (
    CATEGORY_NO   NUMBER   NOT NULL,
    CATEGORY_NAME   VARCHAR2(45) NOT NULL, 
    
    CONSTRAINT PK_CATEGORY_CNO PRIMARY KEY(CATEGORY_NO),
    CONSTRAINT UQ_CATEGORY_CNA UNIQUE(CATEGORY_NAME)
);

COMMENT ON COLUMN CATEGORY.CATEGORY_NAME IS 'UNIQUE 제약조건';


-- 거래방식 카테고리
CREATE TABLE TRADE_CATEGORY (
   TRADE_CATEGORY_NO NUMBER NOT NULL,
   TRADE_METHOD VARCHAR2(30) NOT NULL,

   CONSTRAINT UQ_TRADE_CATEGORY_TM UNIQUE (TRADE_METHOD),
   CONSTRAINT PK_TRADE_CATEGORY_TCN PRIMARY KEY (TRADE_CATEGORY_NO)
);

COMMENT ON COLUMN TRADE_CATEGORY.TRADE_METHOD IS 'UNIQUE 제약조건';

-- 판매, 구매 내역 관리를 위해 구매자 속성(PURCHASER) 추가
--ALTER TABLE BOARD ADD PURCHASER NUMBER;

-- 거래글 테이블
CREATE TABLE BOARD(
   BOARD_NO   NUMBER   NOT NULL,
   CATEGORY_NO   NUMBER   NOT NULL,
   BOARD_WRITER   NUMBER   NOT NULL,
   TRADE_CATEGORY_NO   NUMBER   NOT NULL,
   PRODUCT_NAME   VARCHAR2(60)   NOT NULL,
   PRICE   NUMBER   NOT NULL,
   CONDITION   NUMBER   NOT NULL,
   CONTENT   VARCHAR2(3000)   NOT NULL,
   CREATE_DATE   DATE   DEFAULT SYSDATE,
   MODIFY_DATE   DATE    DEFAULT SYSDATE,
   PURCHASER   NUMBER,
   SALE_CONDITION   CHAR(1 CHAR) DEFAULT 'N',
   COUNT NUMBER DEFAULT 0,
<<<<<<< HEAD
   STATUS   CHAR(1 CHAR) DEFAULT 'Y',
=======
>>>>>>> origin/kgc
    
   CONSTRAINT PK_BOARD_BN PRIMARY KEY(BOARD_NO),
   CONSTRAINT FK_BOARD_CN FOREIGN KEY(CATEGORY_NO)
   REFERENCES CATEGORY (CATEGORY_NO), 
   CONSTRAINT FK_BOARD_BW FOREIGN KEY(BOARD_WRITER)
   REFERENCES MEMBER (MEMBER_NO),
   CONSTRAINT FK_BOARD_TCN FOREIGN KEY(TRADE_CATEGORY_NO)
   REFERENCES TRADE_CATEGORY (TRADE_CATEGORY_NO)
);

-- 사진 원본명 속성 삭제...
--ALTER TABLE BOARD_IMG DROP COLUMN ORIGIN_NAME;

-- 거래글 사진
CREATE TABLE BOARD_IMG (
   BOARD_IMG_NO NUMBER NOT NULL,
   BOARD_NO NUMBER NOT NULL,
   ORIGIN_NAME VARCHAR2(30) NOT NULL,
   CHANGE_NAME VARCHAR2(30) NOT NULL,
   IMG_PATH VARCHAR2(300) NOT NULL,
   STATUS CHAR(1 CHAR) DEFAULT 'Y',
   CREATE_DATE DATE DEFAULT SYSDATE,
   MODIFY_DATE DATE DEFAULT SYSDATE,

   CONSTRAINT PK_BOARD_IMG_BIN PRIMARY KEY (BOARD_IMG_NO),
   CONSTRAINT FK_BOARD_IMG_BN FOREIGN KEY (BOARD_NO)
   REFERENCES BOARD (BOARD_NO),
   CONSTRAINT UQ_BOARD_IMG_CN UNIQUE (CHANGE_NAME)
);

COMMENT ON COLUMN BOARD_IMG.IMG_PATH IS '파일명 외의 경로명만 관리';


-- 채팅방
CREATE TABLE CHAT_ROOM (
   CHAT_ROOM_NO NUMBER NOT NULL,
   BOARD_NO NUMBER NOT NULL,
   SECOND_MEMBER_NO NUMBER NOT NULL,
   FIRST_MEMBER_NO NUMBER  NOT NULL,
   CREATE_DATE DATE DEFAULT SYSDATE,
   STATUS CHAR(1 CHAR) DEFAULT 'Y',
   NOTICE CHAR(1 CHAR) DEFAULT 'N',
   CONSTRAINT PK_CHAT_ROOM_CRN PRIMARY KEY (CHAT_ROOM_NO),
   CONSTRAINT FK_CHAT_ROOM_BN FOREIGN KEY (BOARD_NO)
      REFERENCES BOARD (BOARD_NO)
);


-- 채팅 메세지
CREATE TABLE CHAT_MESSAGE (
   CHAT_MESSAGE_NO NUMBER NOT NULL,
   CHAT_ROOM_NO NUMBER NOT NULL,
   MESSAGE VARCHAR2(600) NOT NULL,
   MEMBER_NO NUMBER  NOT NULL,
   CREATE_DATE DATE DEFAULT SYSDATE,
   STATUS CHAR(1 CHAR),
   CONSTRAINT PK_CHAT_MESSAGE_CMN_CRN PRIMARY KEY (CHAT_MESSAGE_NO, CHAT_ROOM_NO),
   CONSTRAINT FK_CHAT_MESSAGE_NO_CRN FOREIGN KEY (CHAT_ROOM_NO)
      REFERENCES CHAT_ROOM (CHAT_ROOM_NO)
);

COMMENT ON COLUMN CHAT_MESSAGE.CHAT_MESSAGE_NO IS '해당 NO만 SEQ가 아닌, 해당 채팅방 메세지 갯수 + 1로 설정';


-- 리뷰
CREATE TABLE REVIEW (
   REVIEW_NO NUMBER NOT NULL,
   BOARD_NO NUMBER NOT NULL,
   REVIEW_MEMBER_NO NUMBER NOT NULL,
   CONTENT VARCHAR2(3000) NOT NULL,
   CREATE_DATE DATE DEFAULT SYSDATE,
   MODIFY_DATE DATE DEFAULT SYSDATE,
   SCORE NUMBER NOT NULL,
   STATUS CHAR(1 CHAR) DEFAULT 'Y',
   
   CONSTRAINT PK_REVIEW_RN PRIMARY KEY (REVIEW_NO),
   CONSTRAINT FK_REVIEW_BN FOREIGN KEY (BOARD_NO)
   REFERENCES BOARD (BOARD_NO),
   CONSTRAINT FK_REVIEW_RMN FOREIGN KEY (REVIEW_MEMBER_NO)
   REFERENCES MEMBER (MEMBER_NO)
);


-- 찜하기
CREATE TABLE FAVORITE_LIST (
   MEMBER_NO    NUMBER    NOT NULL,
   BOARD_NO    NUMBER    NOT NULL,
   CREATE_DATE    DATE    DEFAULT SYSDATE,
   
   CONSTRAINT FK_FAVORITE_LIST_MN FOREIGN KEY (MEMBER_NO)
      REFERENCES MEMBER (MEMBER_NO),
   CONSTRAINT FK_FAVORITE_LIST_BN FOREIGN KEY (BOARD_NO)
      REFERENCES BOARD (BOARD_NO),
   CONSTRAINT PK_FAVORITE_LIST_MN_BN PRIMARY KEY (MEMBER_NO, BOARD_NO)
);


-- 신고
CREATE TABLE REPORT (
   REPORT_NO NUMBER NOT NULL,
   TARGET_NO NUMBER NOT NULL,
   WRITER_NO NUMBER NOT NULL,
   CONTENT VARCHAR2(3000) NOT NULL,
   CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
   STATUS CHAR(1 CHAR) DEFAULT 'Y' NOT NULL,
   
   CONSTRAINT PK_REPORT_RN PRIMARY KEY (REPORT_NO),
   CONSTRAINT FK_REPORT_TN FOREIGN KEY (TARGET_NO) REFERENCES BOARD (BOARD_NO),
   CONSTRAINT FK_REPORT_WN FOREIGN KEY (WRITER_NO) REFERENCES MEMBER (MEMBER_NO)
);


-- 신고 이미지
CREATE TABLE REPORT_IMG (
   REPORT_IMG_NO    NUMBER    NOT NULL,
   REPORT_NO    NUMBER    NOT NULL,
   CHANGE_NAME    VARCHAR2(30)    NOT NULL,
   REPORT_PATH    VARCHAR2(300),
   STATUS    CHAR(1 CHAR)    DEFAULT 'Y',
   CREATE_DATE    DATE,
   MODIFY_DATE    DATE,
   
   CONSTRAINT PK_REPORT_IMG_RIN PRIMARY KEY (REPORT_IMG_NO),
   CONSTRAINT FK_REPORT_IMG_RN FOREIGN KEY (REPORT_NO)
      REFERENCES REPORT (REPORT_NO)
);

-- 거래글 카테고리
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY_NO.NEXTVAL, '수입명품');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY_NO.NEXTVAL, '패션의류');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY_NO.NEXTVAL, '패션잡화');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY_NO.NEXTVAL, '도서/음반/문구');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY_NO.NEXTVAL, '출산/유아동');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY_NO.NEXTVAL, '모바일/태블릿');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY_NO.NEXTVAL, '가전제품');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY_NO.NEXTVAL, '노트북/PC');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY_NO.NEXTVAL, '가구/인테리어');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY_NO.NEXTVAL, '리빙/생활');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY_NO.NEXTVAL, '게임');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY_NO.NEXTVAL, '오토바이');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY_NO.NEXTVAL, '무료나눔');

COMMIT; 

-- 거래방식 카테고리 

INSERT INTO TRADE_CATEGORY VALUES(SEQ_TRADE_CATEGORY_NO.NEXTVAL, '택배거래');
INSERT INTO TRADE_CATEGORY VALUES(SEQ_TRADE_CATEGORY_NO.NEXTVAL, '직거래');
INSERT INTO TRADE_CATEGORY VALUES(SEQ_TRADE_CATEGORY_NO.NEXTVAL, '모두');

COMMIT;
