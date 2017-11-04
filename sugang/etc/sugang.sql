DROP TABLE ENROLLMENT CASCADE CONSTRAINTS;

/* 개인별수강신청 */
CREATE TABLE ENROLLMENT (
   STUDENT_ID NUMBER(8),/* 학번 */
   SUBJECT_ID NUMBER(6), /* 과목코드 */
   constraint pk_ENROLLMENT primary key(STUDENT_ID, SUBJECT_ID)
--   constraint fk_student_class_ foreign key(STUDENT_ID) references student 
   );

DROP TABLE STUDENT CASCADE CONSTRAINTS;
/* 학생 */
CREATE TABLE STUDENT (
   STUDENT_ID NUMBER(8), /* 학번 */
   STUDENT_NAME VARCHAR2(30) not null, /* 학생이름 */
   MAJOR VARCHAR2(30) not null, /* 학과 */
   STUDENT_PW VARCHAR2(30) not null, /* 비밀번호 */
   GRADE NUMBER(1) not null, /* 학년 */
   MAX_CREDIT NUMBER(2) DEFAULT 0,  /* 제한학점 */
   constraint pk_student_STUDENT_ID primary key(STUDENT_ID)
);

/* 교과목 */
DROP TABLE SUBJECT CASCADE CONSTRAINTS;

/* 교과목 */
CREATE TABLE SUBJECT (
   SUBJECT_ID NUMBER(6), /* 과목코드 */
   SUBJECT_NAME VARCHAR2(30) not null, /* 과목이름 */
   SUBJECT_CREDIT NUMBER(1) not null, /* 학점수 */
   COMPLETION VARCHAR2(12) not null, /*이수구분*/
   MAX_STUDENT NUMBER(2) not null, /*수강최대인원*/
   DAY VARCHAR2(3), /* 요일 */
   SUBJECT_TIME VARCHAR2(3), /* 시간 */
   constraint pk_subject_subject_id primary key(subject_id)
);

select * from subject;


ALTER TABLE ENROLLMENT
   ADD
      CONSTRAINT SUBJECT_TO_ENROLLMENT_FK
      FOREIGN KEY (
         SUBJECT_ID
      )
      REFERENCES SUBJECT (
         SUBJECT_ID
      );

ALTER TABLE ENROLLMENT
   ADD
      CONSTRAINT STUDENT_TO_ENROLLMENT_FK
      FOREIGN KEY (
         STUDENT_ID
      )
      REFERENCES STUDENT (
         STUDENT_ID
      );

--create sequence student_class_id_seq;

-- 20120001번 학생이 수강신청 한 강좌 모두 조회
select *
from ENROLLMENT, SUBJECT
where ENROLLMENT.STUDENT_ID = '20120001' 
      and ENROLLMENT.SUBJECT_ID = SUBJECT.SUBJECT_ID;
      
-- 20120001번 학생이 '자바'라는 과목을 수강신청 취소할 경우 삭제
delete from ENROLLMENT 
where ENROLLMENT.SUBJECT_ID = 0001 
      and ENROLLMENT.student_id='20120001';

-- 20120008번 학생을 삭제! 1. 먼저 수강신청 테이블에 값들을 지운다. 2. 학생 테이블에서 지운다.
delete from ENROLLMENT
where ENROLLMENT.STUDENT_ID='20120008';
delete from STUDENT
where STUDENT.STUDENT_ID='20120008';

-- 과목명이 '자바'인 강좌 조회
select *
from SUBJECT
where SUBJECT.SUBJECT_NAME like '%자바%';

-- 과목코드가 0001 강좌 조회
select *
from SUBJECT
where SUBJECT.SUBJECT_ID = 0001;

-- 등록된 학생 정보 모두 조회
select *
from STUDENT;

-- '20120001'학생의 비밀번호를 20120001로 변경
update STUDENT 
set STUDENT.STUDENT_PW = '20120001' 
where STUDENT.STUDENT_ID = '20120001';

-- '0001'과목을 수강신청 학생의 총수
select count(student_id)
from ENROLLMENT
where SUBJECT_id = '0001';

select SUBJECT_id,STUDENT_ID
from enrollment
where    SUBJECT_id = '0001'
      AND STUDENT_ID='20120001';
      
select count(ENROLLMENT.SUBJECT_id)
	  from enrollment, SUBJECT
	  where ENROLLMENT.student_id = 20170001 
			 and ENROLLMENT.SUBJECT_ID = SUBJECT.SUBJECT_ID
			 and not subject.subject_id = 22
			 and SUBJECT.DAY = (select SUBJECT.DAY
		  						from SUBJECT
								where SUBJECT.SUBJECT_ID = 0022);

	select count(ENROLLMENT.SUBJECT_id)
	  from enrollment, SUBJECT
	  where ENROLLMENT.student_id = 20170001
			 and ENROLLMENT.SUBJECT_ID = SUBJECT.SUBJECT_ID
			 and not subject.subject_id = 22
			 and SUBJECT.SUBJECT_TIME = (select SUBJECT.SUBJECT_TIME
		  								from SUBJECT
										where SUBJECT.SUBJECT_ID = 0022)
			 and SUBJECT.DAY = (select SUBJECT.DAY
		  						from SUBJECT
								where SUBJECT.SUBJECT_ID = 0022);							

select sum(SUBJECT.SUBJECT_CREDIT) 
from ENROLLMENT, SUBJECT
where ENROLLMENT.STUDENT_ID = '20140001' 
      and ENROLLMENT.SUBJECT_ID = SUBJECT.SUBJECT_ID;
      
      
insert into student values(20140001,'김호규','경영학과','20140001',4,4);
insert into student values(20170002,'김호현','사회학과','20170002',3,19);
insert into student values(20170003,'박현준','신소재공학과','20170003',2,19);
insert into student values(20170004,'정수찬','컴퓨터공학과','20170004',1,19);
insert into student values(20170005,'장길웅','소프트웨어','20170005',4,19);
insert into student values(20170006,'손경심','조선해양학과','20170006',3,19);
insert into student values(20170007,'이수정','컴퓨터공학과','20170007',2,19);
insert into student values(20170008,'최태은','컴퓨터공학과','20170008',1,19);
insert into student values(20170009,'이효주','정보통신공학과','20170009',4,19);
insert into student values(20170010,'엄태경','컴퓨터공학과','20170010',3,19);
insert into student values(20170011,'윤규석','경영학과','20170011',2,19);
insert into student values(20170012,'최윤규','컴퓨터공학과','20170012',1,19);
insert into student values(20170013,'윤동웅','관광학과','20170013',4,19);
insert into student values(20170014,'이유리','정보통신공학과','20170014',3,19);
insert into student values(20170015,'이동엽','컴퓨터공학과','20170015',2,19);
insert into student values(20170016,'윤한울','심리학과','20170016',1,19);
insert into student values(20170017,'이수일','컴퓨터공학과','20170017',4,19);
insert into student values(20170018,'장은정','정보통신공학과','20170018',3,19);
insert into student values(20170019,'이지수','정보통신공학과','20170019',2,19);
insert into student values(20170020,'이예진','컴퓨터공학과','20170020',1,19);
insert into student values(1000,'관리자','행정','admin',4,2);



select 	SUBJECT.SUBJECT_ID, SUBJECT.SUBJECT_NAME,
		SUBJECT.SUBJECT_CREDIT, SUBJECT.MAX_STUDENT, 
		SUBJECT.DAY, SUBJECT.SUBJECT_TIME
from SUBJECT,ENROLLMENT
where ENROLLMENT.STUDENT_ID = 20170001 
	and ENROLLMENT.SUBJECT_ID = SUBJECT.SUBJECT_ID;
	

/* 강의 Dummy Data */
insert into subject values(0001,'강좌3',3,'전공선택', 5, '수', 2);
insert into subject values(0002,'강좌3',3,'전공필수', 5, '수', 3);
insert into subject values(0003,'강좌1',3,'전공선택', 5, '수', 8);
insert into subject values(0004,'강좌3',3,'전공필수', 5, '수', 8);
insert into subject values(0005,'강좌1',3,'교양필수', 5, '수', 2);
insert into subject values(0006,'강좌3',3,'교양필수', 5, '목', 2);
insert into subject values(0007,'강좌1',3,'전공선택', 5, '목', 2);
insert into subject values(0008,'강좌2',3,'전공선택', 5, '목', 2);
insert into subject values(0009,'강좌2',3,'전공필수', 5, '목', 5);
insert into subject values(0010,'강좌2',3,'교양선택', 5, '목', 5);

insert into subject values(0013,'강좌1',3,'전공필수', 3, '월', 1);
insert into subject values(0014,'강좌2',3,'교양선택', 2, '금', 1);
insert into subject values(0015,'강좌1',3,'전공필수', 3, '월', 1);
insert into subject values(0016,'강좌2',3,'교양선택', 2, '금', 1);
insert into subject values(0017,'강좌1',3,'전공필수', 3, '월', 1);
insert into subject values(0018,'강좌2',3,'교양선택', 2, '금', 1);