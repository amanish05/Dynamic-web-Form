
    create table Addresses (
        Id  serial not null,
        Area varchar(50),
        City varchar(50),
        Country varchar(30),
        House varchar(40),
        State varchar(40),
        Street varchar(40),
        Zip_Code int4,
        primary key (Id)
    );

    create table Answer (
        answerType varchar(31) not null,
        id  serial not null,
        textarea_value varchar(255),
        textbox_value varchar(255),
        date_value timestamp,
        formId int4,
        memberId int4,
        primary key (id)
    );

    create table Answer_choices (
        MultipleChoiceAnswer_id int4 not null,
        choiceAnswers_id int4 not null
    );

    create table choices (
        id  serial not null,
        text varchar(255),
        primary key (id)
    );

    create table FormElement (
        elementType varchar(31) not null,
        id  serial not null,
        is_enabled boolean,
        is_multiple_answer_allowed boolean,
        is_required boolean,
        name varchar(255),
        title varchar(255),
        column_value int4,
        default_value varchar(255),
        max_length int4,
        min_length int4,
        row_value int4,
        multiple_choice_type int4,
        number_of_allowed_select int4,
        size int4,
        group_Id int4,
        date_format varchar(255),
        default_date timestamp,
        form_Id int4,
        pdfElement_pdfElement_Id int4,
        primary key (id)
    );

    create table formElement_answers (
        answer_id int4 not null,
        formElement_id int4 not null
    );

    create table FormElement_choices (
        MultipleChoice_id int4 not null,
        choices_id int4 not null
    );

    create table FormElement_FormElement (
        GroupElement_id int4 not null,
        groupFormElements_id int4 not null
    );

    create table forms (
        Id  serial not null,
        Created_Date timestamp,
        Description varchar(100),
        Modified_Date timestamp,
        Submission_Date timestamp,
        Title varchar(40),
        ownerId int4,
        primary key (Id)
    );

    create table member_roles (
        member_id int4 not null,
        role_id int4 not null
    );

    create table Members (
        Id  serial not null,
        Email varchar(255),
        First_Name varchar(255),
        Last_Name varchar(255),
        Middle_Name varchar(255),
        Passcode varchar(30),
        address_Id int4,
        primary key (Id)
    );

    create table page_formElements (
        page_id int4 not null,
        formElement_id int4 not null
    );

    create table pages (
        Page_Id  serial not null,
        Description varchar(255),
        Page_Number int2,
        Form_Id int4,
        primary key (Page_Id)
    );

    create table PDFElement (
        pdfElement_Id  serial not null,
        name varchar(255),
        formElement_id int4,
        primary key (pdfElement_Id)
    );

    create table PDFForm (
        pdfForm_Id  serial not null,
        path varchar(255),
        form_Id int4,
        owner_Id int4,
        primary key (pdfForm_Id)
    );

    create table Roles (
        Role_Id  serial not null,
        Name varchar(255),
        primary key (Role_Id)
    );

    alter table Answer_choices 
        add constraint UK_5pytliwcfpu4s3ackf198rxr4 unique (choiceAnswers_id);

    alter table FormElement_choices 
        add constraint UK_e27wl75sqvy7w9phqms4so4l unique (choices_id);

    alter table Answer 
        add constraint FKf6ofc87u4wjyf300c3aisy6el 
        foreign key (formId) 
        references forms;

    alter table Answer 
        add constraint FK32j5552csr2itnpo37g5ht57f 
        foreign key (memberId) 
        references Members;

    alter table Answer_choices 
        add constraint FK9j0b9drih3acthy5ll4nms74m 
        foreign key (choiceAnswers_id) 
        references choices;

    alter table Answer_choices 
        add constraint FKt1oirg3nqfenxouwed7jv8keu 
        foreign key (MultipleChoiceAnswer_id) 
        references Answer;

    alter table FormElement 
        add constraint FK7koo28nnw76tn0mi9ao61pqtx 
        foreign key (form_Id) 
        references forms;

    alter table FormElement 
        add constraint FKlf1d6pyyndrmx87qy8tt1p95j 
        foreign key (pdfElement_pdfElement_Id) 
        references PDFElement;

    alter table formElement_answers 
        add constraint FKqdr9wqcki5m6anpnlqdx5m1pb 
        foreign key (formElement_id) 
        references FormElement;

    alter table formElement_answers 
        add constraint FK9r71yurusbyvv29ljcumj105i 
        foreign key (answer_id) 
        references Answer;

    alter table FormElement_choices 
        add constraint FK6byatdcdbtuf0p94mhyp4vn2m 
        foreign key (choices_id) 
        references choices;

    alter table FormElement_choices 
        add constraint FKmrir97g7bblth4wcfxios49of 
        foreign key (MultipleChoice_id) 
        references FormElement;

    alter table FormElement_FormElement 
        add constraint FKfvkfckkc5p9iafwmihafbkmn7 
        foreign key (groupFormElements_id) 
        references FormElement;

    alter table FormElement_FormElement 
        add constraint FKoxvs3bg2w2osogxuq06xt4q3v 
        foreign key (GroupElement_id) 
        references FormElement;

    alter table forms 
        add constraint FKkwdwbg91iugvww1i1exsohuuy 
        foreign key (ownerId) 
        references Members;

    alter table member_roles 
        add constraint FK5h9y7jfa0x18ffnnuicfpr78m 
        foreign key (role_id) 
        references Roles;

    alter table member_roles 
        add constraint FK2540hlyieprylcidoaniysi68 
        foreign key (member_id) 
        references Members;

    alter table Members 
        add constraint FK7fj6n2lr2xr32o18bxuwft5wm 
        foreign key (address_Id) 
        references Addresses;

    alter table page_formElements 
        add constraint FK3iruri89oijg6u3np0l9pssrs 
        foreign key (formElement_id) 
        references FormElement;

    alter table page_formElements 
        add constraint FK3j68h33t25ww0frl2j2s6exbh 
        foreign key (page_id) 
        references pages;

    alter table pages 
        add constraint FKlsq56jsg42mm80q2cr7evs6xj 
        foreign key (Form_Id) 
        references forms;

    alter table PDFElement 
        add constraint FK4ipq5n6otm49stsj9t3iic6hx 
        foreign key (formElement_id) 
        references FormElement;

    alter table PDFForm 
        add constraint FKeecbtcl8aqy7rtbgko0gxfct3 
        foreign key (form_Id) 
        references forms;

    alter table PDFForm 
        add constraint FK49wbs09vujlgdt9i1yvnirofn 
        foreign key (owner_Id) 
        references Members;
        
INSERT INTO addresses(id, area, city, country, house, state, street, zip_code)
    VALUES (1001, 'Los Angeles', 'Los Angeles', 'United States', '1111', 'CA', 'Fake Street', '90032');
    
INSERT INTO members(id, email, first_name, last_name, middle_name, passcode, address_ID)
    VALUES (1001, 'bob@gmail.com', 'Bob', 'Hill', 'Steve', 'Xyz@123', 1001);

INSERT INTO roles(role_id, name)
    VALUES (1001, 'ADMIN');
    
INSERT INTO member_roles(member_id, role_id)
    VALUES (1001, 1001);
        
INSERT INTO forms(id, Description, Title)
VALUES(1, 'Divorce Papers', 'CONSULAR PROCESSING GENERAL INFORMATION');

INSERT INTO FormElement(elementType, id, name, title, form_Id)
	VALUES('TextBox', 01, 'name', 'NAME OF APPLICANT (Last, First, Middle):', 1);

INSERT INTO FormElement(elementType, id, name, title, date_format, form_Id)
	VALUES('DateText', 02, 'date', 'DATE OF BIRTH (Mo./Day/Year):', 'mm/dd/yyyy', 1);

INSERT INTO FormElement(elementType, id, name, title, form_Id)
	VALUES('TextBox', 03, 'placeOfbirth', 'PLACE OF BIRTH (City and Country):', 1);

INSERT INTO FormElement(elementType, id, name, title, form_Id)
	VALUES('TextBox', 04, 'nationality', 'NATIONALITY:', 1);

INSERT INTO FormElement(elementType, id, name, title, group_Id, form_Id)
	VALUES('Group', 05, 'CONTACT_INFORMATION', 'CONTACT INFORMATION', 1, 1);

INSERT INTO FormElement(elementType, id, name, title, form_Id)
	VALUES('TextBox', 06, 'priphonenumber', 'Primary Phone Number:', 1);

INSERT INTO FormElement_FormElement(GroupElement_id, groupFormElements_id)
	VALUES (5, 6);	

INSERT INTO FormElement(elementType, id, name, title, form_Id)
	VALUES('TextBox', 07, 'secphonenumber', 'Secondary Phone Number:', 1);

INSERT INTO FormElement_FormElement(GroupElement_id, groupFormElements_id)
	VALUES (5, 7);	

INSERT INTO FormElement(elementType, id, name, title, form_Id)
	VALUES('TextBox', 08, 'workphonenumber', 'Work Phone Number:', 1);

INSERT INTO FormElement_FormElement(GroupElement_id, groupFormElements_id)
	VALUES (5, 8);	
	
INSERT INTO FormElement(elementType, id, name, title, form_Id)
	VALUES('TextBox', 09, 'email', 'Email Address:', 1);

INSERT INTO FormElement_FormElement(GroupElement_id, groupFormElements_id)
	VALUES (5, 9);

INSERT INTO FormElement(elementType, id, name, title, group_Id, form_Id)
	VALUES('Group', 10, 'CURRENT RESIDENCE', 'CURRENT RESIDENCE', 2, 1);	
	
INSERT INTO FormElement(elementType, id, name, title, form_Id)
	VALUES('TextBox', 11, 'homeaddress', 'Street Address:', 1);
	
INSERT INTO FormElement_FormElement(GroupElement_id, groupFormElements_id)
	VALUES (10, 11);	
	
INSERT INTO FormElement(elementType, id, name, title, form_Id)
	VALUES('TextBox', 12, 'city', 'City:', 1);
	
INSERT INTO FormElement_FormElement(GroupElement_id, groupFormElements_id)
	VALUES (10, 12);	
	
INSERT INTO FormElement(elementType, id, name, title, form_Id)
	VALUES('TextBox', 13, 'state', 'State:', 1);
	
INSERT INTO FormElement_FormElement(GroupElement_id, groupFormElements_id)
	VALUES (10, 13);		
	
INSERT INTO FormElement(elementType, id, name, title, form_Id)
	VALUES('TextBox', 14, 'zip', 'Zip:', 1);

INSERT INTO FormElement_FormElement(GroupElement_id, groupFormElements_id)
	VALUES (10, 14);	
	
INSERT INTO FormElement(elementType, id, name, title, form_Id)
	VALUES('TextBox', 15, 'country', 'Country:', 1);

INSERT INTO FormElement_FormElement(GroupElement_id, groupFormElements_id)
	VALUES (10, 15);

INSERT INTO FormElement(elementType, id, name, title, group_Id, form_Id)
	VALUES('Group', 16, 'CURRENT_OCCUPATION', 'CURRENT OCCUPATION', 3, 1);		
	
INSERT INTO FormElement(elementType, id, name, title, form_Id)
	VALUES('TextBox', 17, 'companyname','Company Name:', 1);
	
INSERT INTO FormElement_FormElement(GroupElement_id, groupFormElements_id)
	VALUES (16, 17);	
	
INSERT INTO FormElement(elementType, id, name, title, form_Id)
	VALUES('TextBox', 18, 'companyaddress', 'Street Address:', 1);
	
INSERT INTO FormElement_FormElement(GroupElement_id, groupFormElements_id)
	VALUES (16, 18);	
	
INSERT INTO FormElement(elementType, id, name, title, form_Id)
	VALUES('TextBox', 19, 'citystate', 'City/State:', 1);
	
INSERT INTO FormElement_FormElement(GroupElement_id, groupFormElements_id)
	VALUES (16, 19);	
	
INSERT INTO FormElement(elementType, id, name, title, form_Id)
	VALUES('TextBox', 20, 'companyzip', 'Zip/ Postal Code (If any):', 1);
	
INSERT INTO FormElement_FormElement(GroupElement_id, groupFormElements_id)
	VALUES (16, 20);	
	
INSERT INTO FormElement(elementType, id, name, title, form_Id)
	VALUES('TextBox', 21, 'occupation', 'Occupation:', 1);
	
INSERT INTO FormElement_FormElement(GroupElement_id, groupFormElements_id)
	VALUES (16, 21);	
	
INSERT INTO FormElement(elementType, id, name, title, date_format, form_Id)
	VALUES('DateText', 22, 'comstartdate', 'From (Mo./Day/Year):', 'mm/dd/yyyy', 1);
	
INSERT INTO FormElement_FormElement(GroupElement_id, groupFormElements_id)
	VALUES (16, 22);	
	
INSERT INTO FormElement(elementType, id, name, title, date_format, form_Id)
	VALUES('DateText', 23, 'comenddate', 'To (Mo./Day/Year):', 'mm/dd/yyyy', 1);
	
INSERT INTO FormElement_FormElement(GroupElement_id, groupFormElements_id)
	VALUES (16, 23);	

INSERT INTO choices(id, text)
	VALUES(1, 'Single');
	
INSERT INTO choices(id, text)
	VALUES(2, 'Married');
	
INSERT INTO choices(id, text)
	VALUES(3, 'Divorced');
	
INSERT INTO choices(id, text)
	VALUES(4, 'Widowed');
	
INSERT INTO FormElement(elementType, id, name, title, multiple_choice_type, number_of_allowed_select, form_Id)
	VALUES('MultipleChoice', 24, 'martialstatus', 'MARITAL STATUS:', 1, 1, 1);
	
INSERT INTO FormElement_choices( MultipleChoice_id, choices_id)	
	VALUES(24, 1);

INSERT INTO FormElement_choices( MultipleChoice_id, choices_id)	
	VALUES(24, 2);

INSERT INTO FormElement_choices( MultipleChoice_id, choices_id)	
	VALUES(24, 3);

INSERT INTO FormElement_choices( MultipleChoice_id, choices_id)	
	VALUES(24, 4);

INSERT INTO FormElement(elementType, id, name, title, form_Id)
	VALUES('TextBox', 25, 'numofmarriages', 'HOW MANY TIMES HAVE YOU BEEN MARRIED?', 1);

	
	
INSERT INTO Answer(answerType, id, textarea_value, textbox_value ,formId, memberId)
	VALUES('TextBox', 1,'','Hopkins,Steven', 1,1);
	
INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(1, 1);	

INSERT INTO Answer(answerType, id, date_value, formId, memberId)
	VALUES('TextDateA', 2,'09/23/1985', 1, 1);

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(2, 2);

INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 3,'Los Angeles, United States', 1, 1);

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(3, 3);

INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 4,'American', 1, 1);

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(4, 4);
	
INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 5,'(606)-432-2223', 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(6, 5);	

INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 6,'(606)-563-8732', 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(7, 6);

INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 7,'(324)-621-6547', 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(8, 7);
	
INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 8,'steven12@yahoo.com', 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(9, 8);

INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 9,'1212 Fair Oaks', 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(11, 9);

INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 10,'Passadena', 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(12, 10);
	
INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 11,'California', 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(13, 11);
	
INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 12,'90122', 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(14, 12);		
			
INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 13, 'United States', 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(15, 13);
	
INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 14,'Hido Co.', 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(17, 14);					
	
INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 15,'22 Fare Oaks', 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(18, 15);
	
INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 16,'Passadena', 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(19, 16);		
	
INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 17,'90101', 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(20, 17);			
	
INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 18,'Software Engineer', 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(21, 18);
	
INSERT INTO Answer(answerType, id, date_value, formId, memberId)
	VALUES('TextBox', 19,'01/01/2015', 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(22, 19);							
	
INSERT INTO Answer(answerType, id, date_value, formId, memberId)
	VALUES('TextBox', 20,'01/12/2016', 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(23, 20);	
	
INSERT INTO Answer(answerType, id, formId, memberId)
	VALUES('MultipleChoice', 21, 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(24, 21);		
	
INSERT INTO Answer_choices(MultipleChoiceAnswer_id, choiceAnswers_id)
	VALUES(21, 2);		
	
INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 22, 'One', 1, 1);	

INSERT INTO formElement_answers(formElement_id,answer_id)
	VALUES(25, 22);