create sequence hibernate_sequence minvalue 100;

CREATE TABLE t_question
(
    c_id integer NOT NULL,
    c_description varchar(1000) ,
    c_type integer,
    CONSTRAINT t_question_pkey PRIMARY KEY (c_id)
)

insert into t_question values (1, 'description', 1, 1);
insert into t_question values (2, '2_description', 2, 2);

CREATE TABLE t_options
(
    c_id integer NOT NULL,
    c_content varchar(1000),
    c_questionid integer,
    CONSTRAINT t_options_pkey PRIMARY KEY (c_id),
    CONSTRAINT fkdnt6gtiu0uxmb3929bpt0hqs1 FOREIGN KEY (c_questionid)
        REFERENCES t_question (c_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

insert into t_options values (1, 'options', 1, 1);
insert into t_options values (2, '2_options', 2, 2);

