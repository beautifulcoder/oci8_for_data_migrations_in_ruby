CREATE TABLE answer (
  answer_id NUMBER PRIMARY KEY,
  question_id NUMBER,
  answer_sequence NUMBER,
  answer_type VARCHAR2(7),
  answer_text VARCHAR2(31),
  updt_date DATE
  );
CREATE TABLE question (
  question_id NUMBER PRIMARY KEY,
  question_text VARCHAR2(31),
  placement NUMBER,
  updt_date DATE
  );
CREATE TABLE answers (
  id NUMBER CONSTRAINT answers_pk PRIMARY KEY,
  question_id NUMBER,
  placement NUMBER,
  text VARCHAR2(31),
  created_at DATE,
  updated_at DATE
  );
CREATE TABLE questions (
  id NUMBER CONSTRAINT questions_pk PRIMARY KEY,
  type_id NUMBER,
  placement NUMBER,
  text VARCHAR2(31),
  created_at DATE,
  updated_at DATE
  );
CREATE TABLE question_types (
  id NUMBER CONSTRAINT question_types_pk PRIMARY KEY,
  name VARCHAR(7),
  created_at DATE,
  updated_at DATE
  );
CREATE SEQUENCE answers_seq;
CREATE SEQUENCE questions_seq;
commit;
exit
