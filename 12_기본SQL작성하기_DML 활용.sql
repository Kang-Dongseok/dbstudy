DROP TABLE employee;
DROP TABLE department;

CREATE TABLE department
(
    dept_no NUMBER,
    dept_name VARCHAR2(15) NOT NULL,
    location VARCHAR2(15) NOT NULL
);

CREATE TABLE employee
(
    emp_no NUMBER,
    NAME VARCHAR2(20) NOT NULL,
    depart NUMBER,
    position VARCHAR2(20),
    gender CHAR(2),
    hire_date DATE,
    salary NUMBER
);

ALTER TABLE department ADD CONSTRAINT department_pk PRIMARY KEY(dept_no);
ALTER TABLE employee ADD CONSTRAINT employee_pk PRIMARY KEY(emp_no);
ALTER TABLE employee ADD CONSTRAINT employee_department_fk FOREIGN KEY(depart) REFERENCES department(dept_no);

INSERT INTO department (dept_no, dept_name, location) VALUES (1, '������', '�뱸');
INSERT INTO department (dept_no, dept_name, location) VALUES (2, '�λ��', '����');
INSERT INTO department (dept_no, dept_name, location) VALUES (3, '�ѹ���', '�뱸');
INSERT INTO department (dept_no, dept_name, location) VALUES (4, '��ȹ��', '����');

-- ��¥ Ÿ�� �ۼ� ���
-- 1. '2021-04-02'
-- 2. '21-04-02'
-- 3. '2021/04/02'
-- 4. '21/04/02' -- ����Ŭ �⺻��
INSERT INTO employee VALUES (1001, '��â��', 1, '����', 'M', '95-05-01', 5000000);
INSERT INTO employee VALUES (1002, '��μ�', 1, '���', 'M', '17-09-01', 2500000);
INSERT INTO employee VALUES (1003, '������', 2, '����', 'F', '90-09-01', 5500000);
INSERT INTO employee VALUES (1004, '�Ѽ���', 2, '����', 'M', '93-04-01', 5000000);



-- ��(Row) ����
-- 1. '������'�� ��ġ(location)�� '��õ'���� �����Ͻÿ�.
UPDATE department SET location = '��õ' WHERE dept_name = '������';
UPDATE department SET location = '��õ' WHERE dept_no = 1;  -- WHERE�������� �����ϸ� PK�� ����ϴ� ���� ����.

-- 2. '����'�� '����'�� ����(salary)�� 10% �λ��Ͻÿ�.
UPDATE employee SET salary = salary * 1.1 WHERE POSITION = '����' OR POSITION = '����';
UPDATE employee SET salary = salary * 1.1 WHERE POSITION IN('����', '����');  -- ��õ

-- 3. '�ѹ���'->'�Ѱ���', '�뱸'->'����'�� �����Ͻÿ�.
UPDATE department SET LOCATION = '����', dept_name = '�Ѱ���' WHERE dept_no = 3;



-- ��(Row) ����
-- 1. ��� employee�� �����Ѵ�.
DELETE FROM employee;  -- ROLLBACK���� ����� �� �ִ�.
TRUNCATE TABLE employee;  -- ������ ���������� ��Ұ� �Ұ����ϴ�. (DDL)

-- 2. '��ȹ��'�� �����Ѵ�.
DELETE FROM department WHERE dept_no = 4;