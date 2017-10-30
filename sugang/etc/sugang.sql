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
   MAX_CREDIT NUMBER(2),  /* 제한학점 */
   constraint pk_student_STUDENT_ID primary key(STUDENT_ID)
);

/* 교과목 */
DROP TABLE SUBJECT CASCADE CONSTRAINTS;

/* 교과목 */
CREATE TABLE SUBJECT (
   SUBJECT_ID NUMBER(6), /* 과목코드 */
   SUBJECT_NAME VARCHAR2(30) not null, /* 과목이름 */
   SUBJECT_CREDIT NUMBER(1) not null, /* 학점수 */
   COMPLETION VARCHAR2(12), /*이수구분*/
   MAX_STUDENT NUMBER(2), /*수강최대인원*/
   DAY VARCHAR2(3), /* 요일 */
   SUBJECT_TIME VARCHAR2(3), /* 시간 */
   constraint pk_subject_subject_id primary key(subject_id)
);

DROP TABLE CODE CASCADE CONSTRAINTS;

/* 코드 */
CREATE TABLE CODE (
   CODE VARCHAR2(3), /* 코드 */
   CODE_VALUE VARCHAR2(3), /* 코드값 */
   DIV VARCHAR2(6), /* 구분 */
   constraint pk_code_code primary key(code)
);

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

-- 학생등록
insert into student values(20120001,'홍길동','컴퓨터공학과','20120001',1,19);
insert into student values(20120002,'김명희','경영학과','20120002',2,19);
insert into student values(20120003,'박병호','무역학과','20120003',3,19);
insert into student values(20120004,'박보검','심리학과','20120004',4,19);
insert into student values(20120005,'박명희','경제학과','20120005',2,19);
insert into student values(20120006,'김철수','소프트웨어과','20120006',2,19);
insert into student values(20120007,'최영희','신소재학과','20120007',3,19);
insert into student values(20120008,'장철수','물리학과','20120008',2,19);
insert into student values(20120009,'박기동','화학과','20120009',4,19);
insert into student values(20120010,'도다리','사회학과','20120010',3,19);

-- 강좌 등록
insert into subject(subject_id,subject_name,subject_credit,COMPLETION) values(0001,'자바의정석',3,'전공선택');
insert into subject(subject_id,subject_name,subject_credit,COMPLETION) values(0002,'집에',3,'전공필수');
insert into subject(subject_id,subject_name,subject_credit,COMPLETION) values(0003,'가고싶다',3,'전공선택');
insert into subject(subject_id,subject_name,subject_credit,COMPLETION) values(0004,'이딴거',3,'전공필수');
insert into subject(subject_id,subject_name,subject_credit,COMPLETION) values(0005,'졸라',3,'교양필수');
insert into subject(subject_id,subject_name,subject_credit,COMPLETION) values(0006,'시러',3,'교양필수');
insert into subject(subject_id,subject_name,subject_credit,COMPLETION) values(0007,'아아아아아아',3,'전공선택');
insert into subject(subject_id,subject_name,subject_credit,COMPLETION) values(0008,'오라클',3,'전공선택');
insert into subject(subject_id,subject_name,subject_credit,COMPLETION) values(0009,'언제까지',3,'전공필수');
insert into subject(subject_id,subject_name,subject_credit,COMPLETION) values(0010,'해야하나',3,'교양선택');

-- 학생이 수강신청을 등록한다. values('학생','과목코드')
insert into ENROLLMENT values(20120001, 0001);
insert into ENROLLMENT values(20120001, 0002);
insert into ENROLLMENT values(20120001, 0003);
insert into ENROLLMENT values(20120001, 0004);
insert into ENROLLMENT values(20120001, 0005);
insert into ENROLLMENT values(20120002, 0001);
insert into ENROLLMENT values(20120002, 0002);
insert into ENROLLMENT values(20120003, 0009);
insert into ENROLLMENT values(20120003, 0008);
insert into ENROLLMENT values(20120003, 0004);
insert into ENROLLMENT values(20120004, 0005);
insert into ENROLLMENT values(20120004, 0001);
insert into ENROLLMENT values(20120008, 0002);
insert into ENROLLMENT values(20120008, 0009);
insert into ENROLLMENT values(20120007, 0008);
insert into ENROLLMENT values(20120007, 0004);
insert into ENROLLMENT values(20120008, 0004);

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
