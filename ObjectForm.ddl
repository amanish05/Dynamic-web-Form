create sequence hibernate_sequence start 1 increment 1;

    create table form (
        FORM_ID int4 not null,
        CREATED_DATE timestamp,
        DESCRIPTION varchar(255),
        MODIFIED_DATE timestamp,
        MEMBER bytea,
        ROLE bytea,
        SUBMISSION_DATE timestamp,
        TITLE varchar(255),
        primary key (FORM_ID)
    );

    create table page (
        PAGE_ID int4 not null,
        IS_SUBMITTED boolean,
        PAGE_NUMBER int2,
        FORM_ID int4,
        primary key (PAGE_ID)
    );

    alter table page 
        add constraint FKlubbwfffy30v3j0705yfswwjn 
        foreign key (FORM_ID) 
        references form;
