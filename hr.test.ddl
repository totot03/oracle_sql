-- 생성자 Oracle SQL Developer Data Modeler 24.3.1.347.1153
--   위치:        2026-07-08 12:35:22 KST
--   사이트:      Oracle Database 21c
--   유형:      Oracle Database 21c



CREATE USER hr IDENTIFIED BY account

unlock;

GRANT
    CREATE DATABASE LINK,
    CREATE SEQUENCE,
    CREATE VIEW,
    CREATE SYNONYM,
    UNLIMITED TABLESPACE,
    ALTER SESSION,
    CREATE SESSION
TO hr;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE department2 (
    departid    INTEGER NOT NULL,
    departname  VARCHAR2(30) NOT NULL,
    departloc   VARCHAR2(30),
    departphone CHAR(14) NOT NULL
)
LOGGING;

ALTER TABLE department2 ADD CONSTRAINT department2_pk PRIMARY KEY ( departid );

CREATE TABLE employee2 (
    empid    INTEGER NOT NULL,
    empname  CHAR(4 CHAR) NOT NULL,
    empemail VARCHAR2(50 BYTE) NOT NULL,
    departid INTEGER NOT NULL
)
LOGGING;

ALTER TABLE employee2 ADD CONSTRAINT employee2_pk PRIMARY KEY ( empid );

CREATE TABLE hr.gogek (
    gogek_code NUMBER(5) NOT NULL,
    gogek_name VARCHAR2(20 BYTE) NOT NULL,
    gogek_age  NUMBER(3),
    gogek_addr VARCHAR2(50 BYTE),
    gogek_tel  VARCHAR2(20 BYTE)
)
PCTFREE 10
PCTUSED 40
TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

CREATE UNIQUE INDEX hr.pk_gogek_code ON
    hr.gogek (
        gogek_code
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE (
                PCTINCREASE
            0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE hr.gogek
    ADD CONSTRAINT pk_gogek_code PRIMARY KEY ( gogek_code )
        USING INDEX hr.pk_gogek_code;

CREATE TABLE hr.lend (
    lr_code     NUMBER(5) NOT NULL,
    gogek_code  NUMBER(5),
    v_code      NUMBER(5),
    l_date      DATE,
    r_plan_date DATE,
    l_total_pat NUMBER(7)
)
PCTFREE 10
PCTUSED 40
TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

CREATE UNIQUE INDEX hr.pk_lend_lr ON
    hr.lend (
        lr_code
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE (
                PCTINCREASE
            0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE hr.lend
    ADD CONSTRAINT pk_lend_lr PRIMARY KEY ( lr_code )
        USING INDEX hr.pk_lend_lr;

CREATE TABLE hr.video (
    v_code         NUMBER(5) NOT NULL,
    v_title        VARCHAR2(50 BYTE) NOT NULL,
    v_genre        VARCHAR2(30 BYTE),
    v_pay          NUMBER(7) NOT NULL,
    v_lend_state   NUMBER(1),
    v_make_company VARCHAR2(50 BYTE),
    v_make_date    DATE,
    v_view_age     NUMBER(1)
)
PCTFREE 10
PCTUSED 40
TABLESPACE users
LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

CREATE UNIQUE INDEX hr.pk_video_code ON
    hr.video (
        v_code
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE (
                PCTINCREASE
            0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE hr.video
    ADD CONSTRAINT pk_video_code PRIMARY KEY ( v_code )
        USING INDEX hr.pk_video_code;

ALTER TABLE employee2
    ADD CONSTRAINT employee2_department2_fk
        FOREIGN KEY ( departid )
            REFERENCES department2 ( departid )
            NOT DEFERRABLE;

ALTER TABLE hr.lend
    ADD CONSTRAINT fk_lend_gogek_code
        FOREIGN KEY ( gogek_code )
            REFERENCES hr.gogek ( gogek_code )
                ON DELETE SET NULL
            NOT DEFERRABLE;

ALTER TABLE hr.lend
    ADD CONSTRAINT fk_lend_video_code
        FOREIGN KEY ( v_code )
            REFERENCES hr.video ( v_code )
                ON DELETE SET NULL
            NOT DEFERRABLE;



-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             3
-- ALTER TABLE                              8
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              1
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
