-- �ܷ�Ű�� ���� ���̺��� ���� ����
DROP TABLE lecture;
DROP TABLE enroll;
DROP TABLE student;

-- �ܷ�Ű�� ���� ���̺��� ���߿� ����
DROP TABLE course;
DROP TABLE professor;


-- 1. professor ���̺�
CREATE TABLE professor (
    professor_no VARCHAR2(5),  -- �⺻Ű
    professor_name VARCHAR2(30),
    professor_major VARCHAR2(30)
);


-- 2. course ���̺�
CREATE TABLE course (
    course_no VARCHAR2(10),  -- �⺻Ű
    course_name VARCHAR2(30),
    course_unit NUMBER(1)
);


-- 3. student ���̺�
CREATE TABLE student (
    student_no VARCHAR2(10),  -- �⺻Ű
    student_name VARCHAR2(30),
    student_address VARCHAR2(100),
    student_grade NUMBER(1),
    professor_no VARCHAR2(5)  -- professor ���̺��� professor_no�� �����ϴ� �ܷ�Ű
);


-- 4. enroll ���̺�
CREATE TABLE enroll (
    enroll_no NUMBER,
    student_no VARCHAR2(10),  -- student ���̺��� student_no�� �����ϴ� �ܷ�Ű
    course_no VARCHAR2(10),  -- course ���̺��� course_no�� �����ϴ� �ܷ�Ű
    enroll_date DATE
);


-- 5. lecture ���̺�
CREATE TABLE lecture (
    lecture_no NUMBER,  -- �⺻Ű
    professor_no VARCHAR2(5),  -- professor ���̺��� professor_no�� �����ϴ� �ܷ�Ű
    enroll_no NUMBER,  -- enroll ���̺��� enroll_no�� �����ϴ� �ܷ�Ű
    lecture_name VARCHAR2(100),
    lecture_lab VARCHAR2(30)
);


-- 6. �⺻Ű �������� �߰�
ALTER TABLE professor ADD CONSTRAINT professor_pk PRIMARY KEY(professor_no);
ALTER TABLE course ADD CONSTRAINT course_pk PRIMARY KEY(course_no);
ALTER TABLE student ADD CONSTRAINT student_pk PRIMARY KEY(student_no);
ALTER TABLE enroll ADD CONSTRAINT enroll_pk PRIMARY KEY(enroll_no);
ALTER TABLE lecture ADD CONSTRAINT lecture_pk PRIMARY KEY(lecture_no);


-- 7. �ܷ�Ű �������� �߰�
ALTER TABLE student ADD CONSTRAINT student_professor_fk FOREIGN KEY(professor_no) REFERENCES professor(professor_no);
ALTER TABLE enroll ADD CONSTRAINT enroll_student_fk FOREIGN KEY(student_no) REFERENCES student(student_no);
ALTER TABLE enroll ADD CONSTRAINT enroll_course_fk FOREIGN KEY(course_no) REFERENCES course(course_no);
ALTER TABLE lecture ADD CONSTRAINT lecture_professor_fk FOREIGN KEY(professor_no) REFERENCES professor(professor_no);
ALTER TABLE lecture ADD CONSTRAINT lecture_enroll_fk FOREIGN KEY(enroll_no) REFERENCES enroll(enroll_no);


-- 8. professor ���̺� ������ �Է�
INSERT INTO professor VALUES ('AB000', '���ӽ�', '����');
INSERT INTO professor VALUES ('AB200', '�ٸ���', 'ȸ��');
INSERT INTO professor VALUES ('JJ100', '���̽�', '��ȭ');

-- 9. course ���̺� ������ �Է�
INSERT INTO course VALUES ('11', '�ڹ�', 3);
INSERT INTO course VALUES ('22', '�����ͺ��̽�', 3);
INSERT INTO course VALUES ('33', '�������α׷�', 3);

-- 10. student ���̺� ������ �Է�
INSERT INTO student VALUES ('10101', '���л�', '����', 1, 'AB000');
INSERT INTO student VALUES ('10102', '���л�', '����', 1, 'AB000');
INSERT INTO student VALUES ('10103', '���л�', '����', 1, 'AB200');

-- 11. enroll ���̺� ������ �Է�
INSERT INTO enroll VALUES (100, '10101', '11', SYSDATE);
INSERT INTO enroll VALUES (101, '10101', '22', SYSDATE);
INSERT INTO enroll VALUES (102, '10101', '33', SYSDATE);

-- 12. lecture ���̺� ������ �Է�
INSERT INTO lecture VALUES (11, 'AB000', 100, '�ڹٿ�������', 'A101');
INSERT INTO lecture VALUES (12, 'AB000', 101, '�����ͺ��̽���������', 'B101');
INSERT INTO lecture VALUES (13, 'AB000', 102, '�������α׷��ֿ�������', 'C104');


-- 13. ����� ������ DB�� �����Ѵ�.
COMMIT;  -- INSERT, UPDATE, DELETE ���� �ʿ�