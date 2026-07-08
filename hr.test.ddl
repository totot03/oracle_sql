



CREATE TABLE department2 (
    departid    INTEGER NOT NULL,
    departname  VARCHAR2(30) NOT NULL,
    departloc   VARCHAR2(30),
    departphone CHAR(14) NOT NULL
)


ALTER TABLE department2 ADD CONSTRAINT department2_pk PRIMARY KEY ( departid );

CREATE TABLE employee2 (
    empid    INTEGER NOT NULL,
    empname  CHAR(4 CHAR) NOT NULL,
    empemail VARCHAR2(50 BYTE) NOT NULL,
    departid INTEGER NOT NULL
)
LOGGING;

ALTER TABLE employee2 ADD CONSTRAINT employee2_pk PRIMARY KEY ( empid );


ALTER TABLE employee2
    ADD CONSTRAINT employee2_department2_fk
        FOREIGN KEY ( departid )
            REFERENCES department2 ( departid )
            NOT DEFERRABLE;

