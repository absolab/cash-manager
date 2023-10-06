-- 사용자
INSERT INTO `USER`(`id`, `pw`)
VALUES ('admin', SHA2('admin', 512));

-- 기본 코드
INSERT INTO `CODE_GROUP` (`code`, `name`)
VALUES ('INCOME', '수입'), ('EXPENSE', '지출');

INSERT INTO `CODE_DETAIL` (`group`, `code`, `name`)
VALUES  ('INCOME',  'INCM_BASE', '기본 소득'),
        ('INCOME',  'INCM_ADED', '추가 소득'),
        ('EXPENSE', 'EXPN_BASE', '고정 지출'),
        ('EXPENSE', 'EXPN_CARD', '카드 대금'),
        ('EXPENSE', 'EXPN_PLAN', '할부'),
        ('EXPENSE', 'EXPN_ADED', '추가 지출');