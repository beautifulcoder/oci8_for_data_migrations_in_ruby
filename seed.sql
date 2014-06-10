INSERT INTO question (
  question_id,
  question_text,
  placement,
  updt_date
  )
VALUES (
  1,
  'A question',
  1,
  sysdate
  );
INSERT INTO answer (
  answer_id,
  question_id,
  answer_sequence,
  answer_type,
  answer_text,
  updt_date
  )
VALUES (
  1,
  1,
  1,
  'MLT',
  'First answer',
  sysdate
  );
INSERT INTO answer (
  answer_id,
  question_id,
  answer_sequence,
  answer_type,
  answer_text,
  updt_date
  )
VALUES (
  2,
  1,
  2,
  'MLT',
  'Second answer',
  sysdate
  );
INSERT INTO answer (
  answer_id,
  question_id,
  answer_sequence,
  answer_type,
  answer_text,
  updt_date
  )
VALUES (
  3,
  1,
  3,
  'MULTI',
  'Third answer',
  sysdate
  );
INSERT INTO question (
  question_id,
  question_text,
  placement,
  updt_date
  )
VALUES (
  2,
  'Another question',
  2,
  sysdate
  );
INSERT INTO answer (
  answer_id,
  question_id,
  answer_sequence,
  answer_type,
  answer_text,
  updt_date
  )
VALUES (
  4,
  2,
  1,
  'CHK',
  'First answer',
  sysdate
  );
INSERT INTO answer (
  answer_id,
  question_id,
  answer_sequence,
  answer_type,
  answer_text,
  updt_date
  )
VALUES (
  5,
  2,
  2,
  'CHK',
  'Second answer',
  sysdate
  );
commit;
exit
