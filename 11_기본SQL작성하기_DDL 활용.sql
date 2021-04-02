DROP TABLE customer;
DROP TABLE bank;

CREATE TABLE bank
(
    bank_code VARCHAR2(20),
    bank_name VARCHAR2(30)
);
CREATE TABLE customer
(
    NO NUMBER,
    NAME VARCHAR2(30) NOT NULL,
    phone VARCHAR2(30),
    age NUMBER,
    bank_code VARCHAR2(20)
);

-- ���̺� ���� Ȯ��
DESC bank;
DESC customer;



-- ���̺� ���� (Į���� �߰�, ����, ���� ��)



-- Į���� �߰�
-- ALTER TABLE ���̺� ADD Į���� Ÿ�� [��������];

-- 1. bank ���̺� bank_phone Į���� �߰��Ѵ�.
ALTER TABLE bank ADD bank_phone VARCHAR2(15);



-- Į���� ����
-- ALTER TABLE ���̺� MODIFY Į���� Ÿ�� [��������];

-- 1. bank ���̺��� bank_name Į���� varchar2(15)�� �����Ѵ�.
ALTER TABLE bank MODIFY bank_name VARCHAR2(15);

-- 2. customer ���̺��� age Į���� number(3)�� �����Ѵ�.
ALTER TABLE customer MODIFY age NUMBER(3);

-- 3. customer ���̺��� phone Į���� NOT NULL�� �����Ѵ�.
ALTER TABLE customer MODIFY phone VARCHAR2(30) NOT NULL;

-- 4. customer ���̺��� phone Į���� NULL�� �����Ѵ�.
ALTER TABLE customer MODIFY phone VARCHAR2(30) NULL;



-- Į���� ����
-- ALTER TABLE ���̺� DROP COLUMN Į����;

-- 1. bank ���̺��� bank_phone Į���� �����Ѵ�.
ALTER TABLE bank DROP COLUMN bank_phone;



-- Į���� �̸� ����
-- ALTER TABLE ���̺� RENAME COLUMN �⺻Į���� TO �ű�Į����;

-- 1. customer ���̺��� phone Į������ contact ���� �����Ѵ�.
ALTER TABLE customer RENAME COLUMN phone TO contact;



-- ALTER TABLE ���̺� (ADD, DROP, MODIFY ��)

ALTER TABLE bank ADD CONSTRAINT bank_pk PRIMARY KEY(bank_code);
ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY(NO);
ALTER TABLE customer ADD CONSTRAINT customer_phone_uq UNIQUE(phone);
ALTER TABLE customer ADD CONSTRAINT customer_age_ck CHECK(age BETWEEN 0 AND 100);
ALTER TABLE customer ADD CONSTRAINT customer_bank_fk FOREIGN KEY(bank_code) REFERENCES bank(bank_code);