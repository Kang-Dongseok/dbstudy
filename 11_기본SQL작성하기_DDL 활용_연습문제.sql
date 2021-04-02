-- 1. ����(nation) ���̺�
CREATE TABLE nation
(
    nation_code NUMBER(3),
    nation_name VARCHAR2(30),
    nation_prev_rank NUMBER,
    nation_curr_rank NUMBER,
    nation_parti_person NUMBER,
    nation_parti_event NUMBER
);

-- 2. ����(event) ���̺�
CREATE TABLE event
(
    event_code NUMBER(5),
    event_name VARCHAR2(30),
    event_info VARCHAR2(1000),
    event_first_year NUMBER(4)
);

-- 3. ����(player) ���̺�
CREATE TABLE player
(
    player_code NUMBER(5),
    nation_code NUMBER(3),
    event_code NUMBER(5),
    player_name VARCHAR2(30),
    player_age NUMBER(3),
    player_rank NUMBER
);

-- 4. ����(schedule) ���̺�
CREATE TABLE schedule
(
    nation_code NUMBER(3),
    event_code NUMBER(5),
    schedule_info VARCHAR2(1000),
    schedule_begin DATE,
    schedule_end DATE
);



-- �� ���̺� �⺻Ű�� �߰��ϱ�
ALTER TABLE nation ADD CONSTRAINT nation_pk PRIMARY KEY(nation_code);
ALTER TABLE event ADD CONSTRAINT event_pk PRIMARY KEY(event_code);
ALTER TABLE player ADD CONSTRAINT player_pk PRIMARY KEY(player_code);
ALTER TABLE schedule ADD CONSTRAINT schedule_pk PRIMARY KEY(nation_code, event_code);

-- ����(player)���̺� �ܷ�Ű �߰��ϱ�
ALTER TABLE player ADD CONSTRAINT player_nation_fk FOREIGN KEY(nation_code) REFERENCES nation(nation_code);
ALTER TABLE player ADD CONSTRAINT player_event_fk FOREIGN KEY(event_code) REFERENCES event(event_code);

-- ����(schedule)���̺� �ܷ�Ű �߰��ϱ�
ALTER TABLE schedule ADD CONSTRAINT schedule_nation_fk FOREIGN KEY(nation_code) REFERENCES nation(nation_code);
ALTER TABLE schedule ADD CONSTRAINT schedule_event_fk FOREIGN KEY(event_code) REFERENCES event(event_code);


-- ���������� ����
-- ALTER TABLE ���̺� DROP CONSTRAINT ��������;
ALTER TABLE player DROP CONSTRAINT player_nation_fk;
ALTER TABLE schedule DROP CONSTRAINT schedule_nation_fk;
ALTER TABLE nation DROP CONSTRAINT nation_pk;  -- nation_pk�� �����ϴ� �ܷ�Ű�� ���� ����ϴ�.

ALTER TABLE player DROP CONSTRAINT player_event_fk;
ALTER TABLE schedule DROP CONSTRAINT schedule_event_fk;
ALTER TABLE event DROP CONSTRAINT event_pk;  -- event_pk�� �����ϴ� �ܷ�Ű�� ���� ����ϴ�.

ALTER TABLE player DROP CONSTRAINT player_pk;

ALTER TABLE schedule DROP CONSTRAINT schedule_pk;


-- ���������� Ȯ��
-- ���������� �����ϰ� �ִ� DD(Data Dictionary) : USER_CONSTRAINTS ���̺�
DESC user_constraints; -- ����Ȯ��

SELECT constraint_name, table_name FROM user_constraints;
SELECT constraint_name, table_name FROM user_constraints WHERE table_name = 'PLAYER';  -- ���̺��̸��� �빮�ڷ� �ۼ��ؾ� �մϴ�.


-- ���������� ��Ȱ��ȭ
ALTER TABLE PLAYER DISABLE CONSTRAINT PLAYER_NATION_FK;

-- ���������� Ȱ��ȭ
ALTER TABLE PLAYER ENABLE CONSTRAINT PLAYER_NATION_FK;
