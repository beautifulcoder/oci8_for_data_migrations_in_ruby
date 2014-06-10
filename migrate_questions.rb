require 'oci8'

QUESTION_TYPE_IDS = { "CHK" => 1, "MLT" => 2 }

src = OCI8.new('eadvisor/ZwKLXfL_lY5guMZ@explt')
tgt = OCI8.new('eadvisor/ZwKLXfL_lY5guMZ@explt')
tgt.autocommit = true
src.exec("SELECT question_id,
            (
              SELECT answer.answer_type
              FROM answer
              WHERE answer.question_id = question.question_id
                AND ROWNUM = 1
            ) question_type,
            question_text,
            placement,
            updt_date
          FROM question") do |qr|
  tgt.exec("SELECT questions_seq.nextval FROM dual") do |qid|
    tgt.exec("INSERT INTO questions (
                id,
                type_id,
                placement,
                text,
                created_at,
                updated_at
                )
              VALUES (
                :1,
                :2,
                :3,
                :4,
                :5,
                :6
                )",
      qid[0].to_i,
      QUESTION_TYPE_IDS[qr[1]].to_i,
      qr[3].to_i,
      qr[2].to_s[0..30],
      qr[4].to_date,
      qr[4].to_date)
    src.exec("SELECT answer_id,
                answer_sequence,
                answer_text,
                updt_date
              FROM answer
              WHERE question_id = :1", qr[0].to_i) do |ar|
      tgt.exec("SELECT answers_seq.nextval FROM dual") do |aid|
        tgt.exec("INSERT INTO answers (
                    id,
                    question_id,
                    placement,
                    text,
                    created_at,
                    updated_at
                    )
                  VALUES (
                    :1,
                    :2,
                    :3,
                    :4,
                    :5,
                    :6
                    )",
          aid[0].to_i,
          qid[0].to_i,
          ar[1].to_i,
          ar[2].to_s[0..30],
          ar[3].to_date,
          ar[3].to_date)
      end
    end
  end
end
src.logoff
tgt.logoff
