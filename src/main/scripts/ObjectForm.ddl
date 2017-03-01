create sequence hibernate_sequence start 1 increment 1;

    create table Addresses (
        Address_Id varchar(255) not null,
        Area varchar(50),
        City varchar(50),
        Country varchar(30),
        House varchar(40),
        State varchar(40),
        Street varchar(40),
        Zip_Code int4,
        Member_Id varchar(255),
        primary key (Address_Id)
    );

    create table Answer_FormElement (
        Answer_id varchar(255) not null,
        formElements_form_element_id int4 not null
    );

    create table choices (
        id varchar(255) not null,
        text varchar(255),
        multipleChoiceAnswers_id varchar(255),
        primary key (id)
    );

    create table datetext (
        form_element_id int4 not null,
        is_enabled boolean,
        is_multiple_answer_allowed boolean,
        is_required boolean,
        name varchar(255),
        title varchar(255),
        form_Form_Id int4,
        pages_Page_Id int4,
        date_format varchar(255),
        default_date timestamp,
        primary key (form_element_id)
    );

    create table FormElement_Answer (
        FormElement_form_element_id int4 not null,
        answers_id varchar(255) not null
    );

    create table forms (
        Form_Id int4 not null,
        Created_Date timestamp,
        Description varchar(100),
        Modified_Date timestamp,
        Submission_Date timestamp,
        Title varchar(40),
        primary key (Form_Id)
    );

    create table GroupElement (
        id int4 not null,
        primary key (id)
    );

    create table GroupElement_FormElement (
        GroupElement_id int4 not null,
        groupFormElements_form_element_id int4 not null
    );

    create table Members (
        Member_Id varchar(255) not null,
        Email varchar(255),
        First_Name varchar(255),
        Last_Name varchar(255),
        Middle_Name varchar(255),
        Passcode varchar(30),
        primary key (Member_Id)
    );

    create table multiplechoice (
        form_element_id int4 not null,
        is_enabled boolean,
        is_multiple_answer_allowed boolean,
        is_required boolean,
        name varchar(255),
        title varchar(255),
        form_Form_Id int4,
        pages_Page_Id int4,
        multiple_choice_type int4,
        number_of_allowed_select int4,
        primary key (form_element_id)
    );

    create table multiplechoice_choices (
        MultipleChoice_form_element_id int4 not null,
        choices_id varchar(255) not null
    );

    create table multiplechoice_multiplechoiceanswers (
        MultipleChoice_form_element_id int4 not null,
        multiAnswers_id varchar(255) not null
    );

    create table multiplechoiceanswers (
        id varchar(255) not null,
        user bytea,
        form_Form_Id int4,
        primary key (id)
    );

    create table multiplechoiceanswers_choices (
        MultipleChoiceAnswer_id varchar(255) not null,
        choiceAnswers_id varchar(255) not null
    );

    create table pages (
        Page_Id int4 not null,
        Is_Submitted boolean,
        Page_Number int2,
        Form_Id int4,
        primary key (Page_Id)
    );

    create table Roles (
        Role_Id varchar(255) not null,
        Name varchar(255),
        Member_Id varchar(255),
        primary key (Role_Id)
    );

    create table textarea (
        form_element_id int4 not null,
        is_enabled boolean,
        is_multiple_answer_allowed boolean,
        is_required boolean,
        name varchar(255),
        title varchar(255),
        form_Form_Id int4,
        pages_Page_Id int4,
        column int4,
        default_value varchar(255),
        max_length int4,
        min_length int4,
        row int4,
        text_value varchar(255),
        textareaAnswer_id varchar(255),
        primary key (form_element_id)
    );

    create table textareaanswers (
        id varchar(255) not null,
        user bytea,
        form_Form_Id int4,
        value varchar(255),
        primary key (id)
    );

    create table textbox (
        form_element_id int4 not null,
        is_enabled boolean,
        is_multiple_answer_allowed boolean,
        is_required boolean,
        name varchar(255),
        title varchar(255),
        form_Form_Id int4,
        pages_Page_Id int4,
        value varchar(255),
        default_value varchar(255),
        max_length int4,
        size int4,
        textboxAnswer_id varchar(255),
        primary key (form_element_id)
    );

    create table textboxanswers (
        id varchar(255) not null,
        user bytea,
        form_Form_Id int4,
        value varchar(255),
        primary key (id)
    );

    alter table GroupElement_FormElement 
        add constraint UK_lda5h9wth8w8xngn74gvfcdv1 unique (groupFormElements_form_element_id);

    alter table multiplechoice_choices 
        add constraint UK_7n4s5lk7p47jp7nx9x6xygteq unique (choices_id);

    alter table multiplechoice_multiplechoiceanswers 
        add constraint UK_dh7woqkkirjhfepe429le19ex unique (multiAnswers_id);

    alter table multiplechoiceanswers_choices 
        add constraint UK_m1fnyuutpyxp2ult8gj5qjyb3 unique (choiceAnswers_id);

    alter table Addresses 
        add constraint FKmkbynwpsuvdogtfq3uxlx7x0k 
        foreign key (Member_Id) 
        references Members;

    alter table choices 
        add constraint FKmac8h330hq3jqcoybb97c75ps 
        foreign key (multipleChoiceAnswers_id) 
        references multiplechoiceanswers;

    alter table datetext 
        add constraint FK_kqgf8ygu95k4oklb5664qqr7y 
        foreign key (form_Form_Id) 
        references forms;

    alter table datetext 
        add constraint FK_r5lobrshcpohomobd9yivhr22 
        foreign key (pages_Page_Id) 
        references pages;

    alter table GroupElement_FormElement 
        add constraint FKi1njf9lkla22svilm2bnn0vvo 
        foreign key (GroupElement_id) 
        references GroupElement;

    alter table multiplechoice 
        add constraint FK_79iswoibityqw0xmro0ev9qxm 
        foreign key (form_Form_Id) 
        references forms;

    alter table multiplechoice 
        add constraint FK_sp79oyiww0ibqbyc64xvtr4e7 
        foreign key (pages_Page_Id) 
        references pages;

    alter table multiplechoice_choices 
        add constraint FKkarx35aeo13nkhhuwhbyu0hdk 
        foreign key (choices_id) 
        references choices;

    alter table multiplechoice_choices 
        add constraint FK8gq6w0udoxswetfvdcs2y8cx4 
        foreign key (MultipleChoice_form_element_id) 
        references multiplechoice;

    alter table multiplechoice_multiplechoiceanswers 
        add constraint FKlpmdvmr5q75vawh02hb8h9m7s 
        foreign key (multiAnswers_id) 
        references multiplechoiceanswers;

    alter table multiplechoice_multiplechoiceanswers 
        add constraint FKvo60425f597k4fedfn6mk92c 
        foreign key (MultipleChoice_form_element_id) 
        references multiplechoice;

    alter table multiplechoiceanswers 
        add constraint FK_fpm0vnh65hwst1i3ykjrq4n3b 
        foreign key (form_Form_Id) 
        references forms;

    alter table multiplechoiceanswers_choices 
        add constraint FKcsp8i4lqdvoqiom8v5yqmrqes 
        foreign key (choiceAnswers_id) 
        references choices;

    alter table multiplechoiceanswers_choices 
        add constraint FKg1t296wqr1qysj534ltbrjoan 
        foreign key (MultipleChoiceAnswer_id) 
        references multiplechoiceanswers;

    alter table pages 
        add constraint FKlsq56jsg42mm80q2cr7evs6xj 
        foreign key (Form_Id) 
        references forms;

    alter table Roles 
        add constraint FKp0f01rratl5yc46efmgj2tqej 
        foreign key (Member_Id) 
        references Members;

    alter table textarea 
        add constraint FK8iet9gxg1cj87ojvgrhytm5si 
        foreign key (textareaAnswer_id) 
        references textareaanswers;

    alter table textarea 
        add constraint FK_la9j6i54c72pknojfax5bpgvr 
        foreign key (form_Form_Id) 
        references forms;

    alter table textarea 
        add constraint FK_8cadq3wqn09maupevjnsond4r 
        foreign key (pages_Page_Id) 
        references pages;

    alter table textareaanswers 
        add constraint FK_1986n8p1yu6o6epwtpa0s12ko 
        foreign key (form_Form_Id) 
        references forms;

    alter table textbox 
        add constraint FKs600s0qxyptxmydb2we9nl4bv 
        foreign key (textboxAnswer_id) 
        references textboxanswers;

    alter table textbox 
        add constraint FK_fofuje92hm0013lnlw6q0anth 
        foreign key (form_Form_Id) 
        references forms;

    alter table textbox 
        add constraint FK_cahb1eo4rntyhikkk5hbjcjs0 
        foreign key (pages_Page_Id) 
        references pages;

    alter table textboxanswers 
        add constraint FK_qb7qbkqe92u2q8fod2uedccdj 
        foreign key (form_Form_Id) 
        references forms;
