
------------------------------------------------------------
--  Create all the tables and other schema elements you want
------------------------------------------------------------

---------------------------
--  DDL for Table Addresses
---------------------------

	create table Addresses 
	(
        Id int4 not null,
        Area varchar(50),
        City varchar(50),
        Country varchar(30),
        House varchar(40),
        State varchar(40),
        Street varchar(40),
        Zip_Code int4,
        primary key (Id)
    );
    
     CREATE UNIQUE INDEX "ADDRESSES_UNIQUE" ON Addresses (Id);

---------------------------
--  DDL for Table Answer
---------------------------
    create table Answer 
    (
        answerType varchar(31) not null,
        id int4 not null,
        date_value timestamp,
        textarea_value varchar(255),
        textbox_value varchar(255),
        formId int4,
        memberId int4,
        primary key (id)
    );
    

    CREATE UNIQUE INDEX "ANSWER_UNIQUE" ON Answer (id);

    --------------------------------------------------------
	--  Constraints for Table Answer
	--------------------------------------------------------
     alter table Answer add constraint FKf6ofc87u4wjyf300c3aisy6el 
        foreign key (formId) 
        references forms;
        
     alter table Answer add constraint FK32j5552csr2itnpo37g5ht57f 
        foreign key (memberId) 
        references Members;

--------------------------------
--  DDL for Table Answer_choices
--------------------------------
    create table Answer_choices 
    (
        MultipleChoiceAnswer_id int4 not null,
        choiceAnswers_id int4 not null
    );

    CREATE UNIQUE INDEX "ANSWER-CHOICES_UNIQUE" ON Answer (id);

    --------------------------------------------------------
	--  Constraints for Table Answer_choices
	--------------------------------------------------------
    
    alter table Answer_choices add constraint UK_5pytliwcfpu4s3ackf198rxr4 
    	unique (choiceAnswers_id);
        
   	 alter table Answer_choices add constraint FK9j0b9drih3acthy5ll4nms74m 
        foreign key (choiceAnswers_id) 
        references choices;

    alter table Answer_choices add constraint FKt1oirg3nqfenxouwed7jv8keu 
        foreign key (MultipleChoiceAnswer_id) 
        references Answer;
        
--------------------------------
--  DDL for Table choices
--------------------------------

    create table choices 
    (
        id int4 not null,
        text varchar(255),
        primary key (id)
    );
    
--------------------------------
--  DDL for Table FormElement
--------------------------------


    create table FormElement 
    (
        elementType varchar(31) not null,
        id int4 not null,
        is_enabled boolean,
        is_multiple_answer_allowed boolean,
        is_required boolean,
        name varchar(255),
        title varchar(255),
        group_Id int4,
        default_value varchar(255),
        max_length int4,
        size int4,
        column_value int4,
        min_length int4,
        row_value int4,
        date_format varchar(255),
        default_date timestamp,
        multiple_choice_type int4,
        number_of_allowed_select int4,
        form_Id int4,
        pdfElement_pdfElement_Id int4,
        primary key (id)
    );
    
    --------------------------------------------------------
	--  Constraints for Table FormElement
	--------------------------------------------------------
    
   	alter table FormElement add constraint FK7koo28nnw76tn0mi9ao61pqtx 
        foreign key (form_Id) 
        references forms;

    alter table FormElement add constraint FKlf1d6pyyndrmx87qy8tt1p95j 
        foreign key (pdfElement_pdfElement_Id) 
        references PDFElement;
    
-------------------------------------
--  DDL for Table formElement_answers
-------------------------------------
    
    create table formElement_answers 
    (
        formElement_id int4 not null,
        answer_id int4 not null
    );    
    
   	--------------------------------------------------------
	--  Constraints for Table formElement_answers
	-------------------------------------------------------- 
    alter table formElement_answers add constraint FK9r71yurusbyvv29ljcumj105i 
        foreign key (answer_id) 
        references Answer;

    alter table formElement_answers add constraint FKqdr9wqcki5m6anpnlqdx5m1pb 
        foreign key (formElement_id) 
        references FormElement;

-------------------------------------
--  DDL for Table FormElement_choices
-------------------------------------
    create table FormElement_choices 
    (
        MultipleChoice_id int4 not null,
        choices_id int4 not null
    );
   	
    --------------------------------------------------------
	--  Constraints for Table FormElement_choices
	--------------------------------------------------------     
     alter table FormElement_choices add constraint UK_e27wl75sqvy7w9phqms4so4l 
     	unique (choices_id);
        
     alter table FormElement_choices add constraint FK6byatdcdbtuf0p94mhyp4vn2m 
        foreign key (choices_id) 
        references choices;

    alter table FormElement_choices add constraint FKmrir97g7bblth4wcfxios49of 
        foreign key (MultipleChoice_id) 
        references FormElement;

-----------------------------------------
--  DDL for Table FormElement_FormElement
-----------------------------------------

    create table FormElement_FormElement (
        GroupElement_id int4 not null,
        groupFormElements_id int4 not null
    );
	
    -------------------------------------------------
	--  Constraints for Table FormElement_FormElement
	--------------------------------------------------     
    alter table FormElement_FormElement add constraint FKfvkfckkc5p9iafwmihafbkmn7 
        foreign key (groupFormElements_id) 
        references FormElement;

    alter table FormElement_FormElement add constraint FKoxvs3bg2w2osogxuq06xt4q3v 
        foreign key (GroupElement_id) 
        references FormElement;
        
------------------------
--  DDL for Table forms
------------------------
    
    create table forms 
    (
        Id int4 not null,
        Created_Date timestamp,
        Description varchar(100),
        Modified_Date timestamp,
        Submission_Date timestamp,
        Title varchar(40),
        ownerId int4,
        primary key (Id)
    );
    
    -------------------------------------------------
	--  Constraints for Table forms
	--------------------------------------------------    
    
      alter table forms add constraint FKkwdwbg91iugvww1i1exsohuuy foreign key (ownerId) 
        references Members;

        
------------------------------
--  DDL for Table member_roles
------------------------   -----


    create table member_roles 
    (
        member_id int4 not null,
        role_id int4 not null
    );
    
    -------------------------------------------------
	--  Constraints for Table member_roles
	--------------------------------------------------        
    
    alter table member_roles 
        add constraint FK5h9y7jfa0x18ffnnuicfpr78m foreign key (role_id) 
        references Roles;

    alter table member_roles 
        add constraint FK2540hlyieprylcidoaniysi68 foreign key (member_id) 
        references Members;

------------------------------
--  DDL for Table Members
------------------------------        
    
   create table Members 
   (
        Id int4 not null,
        Email varchar(255),
        First_Name varchar(255),
        Last_Name varchar(255),
        Middle_Name varchar(255),
        Passcode varchar(30),
        address_Id int4,
        primary key (Id)
    );
    
    
    alter table Members add constraint FK7fj6n2lr2xr32o18bxuwft5wm 
        foreign key (address_Id) 
        references Addresses;

------------------------------
--  DDL for Table page_formElements
------------------------------           
    create table page_formElements 
    (
        page_id int4 not null,
        formElement_id int4 not null
    );
    
    alter table page_formElements add constraint FK3iruri89oijg6u3np0l9pssrs 
        foreign key (formElement_id) 
        references FormElement;

    alter table page_formElements add constraint FK3j68h33t25ww0frl2j2s6exbh 
        foreign key (page_id) 
        references pages;
        
------------------------------
--  DDL for Table pages
------------------------------         
    create table pages 
    (
        Page_Id int4 not null,
        Is_Submitted boolean,
        Page_Number int2,
        Form_Id int4,
        primary key (Page_Id)
    );
    
      alter table pages add constraint FKlsq56jsg42mm80q2cr7evs6xj 
        foreign key (Form_Id) 
        references forms;

        
------------------------------
--  DDL for Table PDFElement
------------------------------ 
    create table PDFElement 
    (
        pdfElement_Id int4 not null,
        name varchar(255),
        formElement_id int4,
        primary key (pdfElement_Id)
    );
    
     alter table PDFElement add constraint FK4ipq5n6otm49stsj9t3iic6hx 
        foreign key (formElement_id) 
        references FormElement;
        
------------------------------
--  DDL for Table PDFForm
------------------------------ 
    create table PDFForm 
    (
        pdfForm_Id int4 not null,
        path varchar(255),
        form_Id int4,
        owner_Id int4,
        primary key (pdfForm_Id)
    );    
    
     alter table PDFForm add constraint FKeecbtcl8aqy7rtbgko0gxfct3 
        foreign key (form_Id) 
        references forms;

    alter table PDFForm add constraint FK49wbs09vujlgdt9i1yvnirofn 
        foreign key (owner_Id) 
        references Members;
        
------------------------------
--  DDL for Table Roles
------------------------------ 

    create table Roles
    (
        Role_Id int4 not null,
        Name varchar(255),
        primary key (Role_Id)
    );

 
--------------------------------------------------------
--  Add three users: one administrator, one staff, and one regular user.
--------------------------------------------------------

--FIRST MEMBER
INSERT INTO addresses(id, area, city, country, house, state, street, zip_code)
    VALUES ('1', 'College Square', 'Los Angeles', 'United States', '1', 'CA', 'Street', '90032');
    
INSERT INTO members(id, email, first_name, last_name, middle_name, passcode,address_ID)
    VALUES ('1', 'm.vahedi@gmail.com', 'Mohammad', 'Vahedi', '', 'Xyz@123',1);

INSERT INTO roles(role_id, name)
    VALUES ('1', 'Admin');
    
INSERT INTO member_roles(member_id, role_id)
    VALUES ('1', '1');
        
--SECOND MEMBER
INSERT INTO addresses(id, area, city, country, house, state, street, zip_code)
    VALUES ('2', 'College Square', 'Los Angeles', 'United States', '2', 'CA', 'Street', '90032');
    
INSERT INTO members(id, email, first_name, last_name, middle_name, passcode,address_Id)
    VALUES ('2', 'mkumar4@calstatela.edu', 'Manish', 'Kumar', '', 'Xyz@123','2');

INSERT INTO roles(role_id, name)
    VALUES ('2', 'Staff');
    
INSERT INTO member_roles(member_id, role_id)
    VALUES ('2', '2');    


--THIRD MEMBER
INSERT INTO addresses(id, area, city, country, house, state, street, zip_code)
    VALUES ('3', 'College Square', 'Los Angeles', 'United States', '3', 'CA', 'Street', '90032');

INSERT INTO members(id, email, first_name, last_name, middle_name, passcode, address_Id)
    VALUES ('3', 'test@test.com', 'Steve', 'James', '', 'Xyz@123','3');

INSERT INTO roles( role_id, name)
    VALUES ('3', 'User');
    
INSERT INTO member_roles(member_id, role_id)
    VALUES ('3', '3');    
   
    

------------------------------------------------------------------------
--  Add one form which includes Fields 1-9 of the VISA INFO SHEET form.
------------------------------------------------------------------------

-- Form for fields 1-9
INSERT INTO forms(id, Description, Title, ownerId)
VALUES(1, 'Divorce Papers', 'CONSULAR PROCESSING GENERAL INFORMATION', 1);
    
-- 1. Text Box for Name Of Applicant
INSERT INTO FormElement(elementType, id, name, title)
	VALUES('TextBox', 01, 'name', 'NAME OF APPLICANT (Last, First, Middle):');

-- 2. DateText for Date of Birth
INSERT INTO FormElement(elementType, id, name, title, date_format, value)
	VALUES('DateText', 02, 'date', 'DATE OF BIRTH (Mo./Day/Year):', 'mm/dd/yyyy', '06/14/1946');

-- 3. Text Box for Place of Birth
INSERT INTO FormElement(elementType, id, name, title)
	VALUES('TextBox', 03, 'placeOfbirth', 'PLACE OF BIRTH (City and Country):');

-- 4. Text Box for Nationality
INSERT INTO FormElement(elementType, id, name, title)
	VALUES('TextBox', 04, 'nationality', 'NATIONALITY:');

-- 5. Group Element with Text Boxes for Contact Information
INSERT INTO FormElement(elementType, id, name, title, group_Id)
	VALUES('TextBox', 05, 'priphonenumber', 'Primary Phone Number:', 1);

INSERT INTO FormElement(elementType, id, name, title, group_Id)
	VALUES('TextBox', 06, 'secphonenumber', 'Secondary Phone Number:', 1);

INSERT INTO FormElement(elementType, id, name, title, group_Id)
	VALUES('TextBox', 07, 'workphonenumber', 'Work Phone Number:', 1);
	
INSERT INTO FormElement(elementType, id, name, title, group_Id)
	VALUES('TextBox', 08, 'email', 'Email Address:', 1);

-- 6. Group Element with Text Boxes for Current Residence
INSERT INTO FormElement(elementType, id, name, title, group_Id)
	VALUES('TextBox', 09, 'homeaddress', 'Street Address:', 2);
	
INSERT INTO FormElement(elementType, id, name, title, group_Id)
	VALUES('TextBox', 10, 'hcity', 'City:', 2);
	
INSERT INTO FormElement(elementType, id, name, title, group_Id)
	VALUES('TextBox', 11, 'hstate', 'State:', 2);
	
INSERT INTO FormElement(elementType, id, name, title, group_Id)
	VALUES('TextBox', 12, 'hzip', 'Zip:', 2);
	
INSERT INTO FormElement(elementType, id, name, title, group_Id)
	VALUES('TextBox', 13, 'hcountry', 'Country:', 2);

-- 7. Group Element with Text Boxes and Date Texts for Current Occupation
INSERT INTO FormElement(elementType, id, name, title, group_Id)
	VALUES('TextBox', 14, 'companyname','Company Name:', 3);
	
INSERT INTO FormElement(elementType, id, name, title, group_Id)
	VALUES('TextBox', 15, 'companyaddress', 'Street Address:', 3);
	
INSERT INTO FormElement(elementType, id, name, title, group_Id)
	VALUES('TextBox', 16, 'citystate', 'City/State:', 3);
	
INSERT INTO FormElement(elementType, id, name, title, group_Id)
	VALUES('TextBox', 17, 'companyzip', 'Zip/ Postal Code (If any):', 3);
	
INSERT INTO FormElement(elementType, id, name, title, group_Id)
	VALUES('TextBox', 18, 'occupation', 'Occupation:', 3);
	
INSERT INTO FormElement(elementType, id, name, title, date_format, group_Id)
	VALUES('DateText', 19, 'comstartdate', 'From (Mo./Day/Year):', 'mm/dd/yyyy', 3);
	
INSERT INTO FormElement(elementType, id, name, title, date_format, group_Id)
	VALUES('DateText', 20, 'comenddate', 'To (Mo./Day/Year):', 'mm/dd/yyyy', 3);

-- 8. Multiple Choice for Marital Status
INSERT INTO choices(id, text)
	VALUES(1, 'Single');
	
INSERT INTO choices(id, text)
	VALUES(2, 'Married');
	
INSERT INTO choices(id, text)
	VALUES(3, 'Divorced');
	
INSERT INTO choices(id, text)
	VALUES(4, 'Widowed');
	
INSERT INTO FormElement(elementType, id, name, title, multiple_choice_type, number_of_allowed_select)
	VALUES('MultipleChoice', 21, 'martialstatus', 'MARITAL STATUS:', 1, 1);

-- 9. Text Box for Number of Marriages
INSERT INTO FormElement(elementType, id, name, title)
	VALUES('TextBox', 22, 'numofmarriages', 'HOW MANY TIMES HAVE YOU BEEN MARRIED?');
	
	
------------------------------------------------------------------------
--  Add one set of answers to the form by a user.
------------------------------------------------------------------------

-- TextBox Answer Insert
INSERT INTO Answer(answerType, id, date_value, textarea_value, textbox_value ,formId, memberId)
	VALUES('TextBox', 1,,,'Hopkins,Steven', 1,3);
	
INSERT INTO formElement_answers(formElement_id,answer_id)
	VALUES(1,1)	


INSERT INTO Answer(answerType, id, date_value, textarea_value, textbox_value ,formId, memberId)
	VALUES('TextDateA', 2,'09/23/1985',,, 1, 3);

INSERT INTO formElement_answers(formElement_id,answer_id)
	VALUES(2,2)	

INSERT INTO Answer(answerType, id, date_value, textarea_value, textbox_value ,formId, memberId)
	VALUES('TextBox', 3,,,'Los Angeles, United States', 1, 3);

INSERT INTO formElement_answers(formElement_id,answer_id)
	VALUES(3,3)	

INSERT INTO Answer(answerType, id, date_value, textarea_value, textbox_value ,formId, memberId)
	VALUES('TextBox', 4,,,'American', 1, 3);

INSERT INTO formElement_answers(formElement_id,answer_id)
	VALUES(4,4)
	
INSERT INTO Answer(answerType, id, date_value, textarea_value, textbox_value ,formId, memberId)
	VALUES('TextBox', 5,,,'(606)-432-2223', 1, 3);	

INSERT INTO formElement_answers(formElement_id,answer_id)
	VALUES(6,5)	

INSERT INTO Answer(answerType, id, date_value, textarea_value, textbox_value ,formId, memberId)
	VALUES('TextBox', 6,,,'(606)-563-8732', 1, 3);	

INSERT INTO formElement_answers(formElement_id,answer_id)
	VALUES(7,6)

INSERT INTO Answer(answerType, id, date_value, textarea_value, textbox_value ,formId, memberId)
	VALUES('TextBox', 7,,,'(324)-621-6547', 1, 3);	

INSERT INTO formElement_answers(formElement_id,answer_id)
	VALUES(8,7)
	
INSERT INTO Answer(answerType, id, date_value, textarea_value, textbox_value ,formId, memberId)
	VALUES('TextBox', 8,,,'steven12@yahoo.com', 1, 3);	

INSERT INTO formElement_answers(formElement_id,answer_id)
	VALUES(9,8)

INSERT INTO Answer(answerType, id, date_value, textarea_value, textbox_value ,formId, memberId)
	VALUES('TextBox', 9,,,'12 Fare Oaks', 1, 3);	

INSERT INTO formElement_answers(formElement_id,answer_id)
	VALUES(11,9)	


INSERT INTO Answer(answerType, id, date_value, textarea_value, textbox_value ,formId, memberId)
	VALUES('TextBox', 10,,,'Passadena', 1, 3);	

INSERT INTO formElement_answers(formElement_id,answer_id)
	VALUES(12,10)	
	
INSERT INTO Answer(answerType, id, date_value, textarea_value, textbox_value ,formId, memberId)
	VALUES('TextBox', 11,,,'California', 1, 3);	

INSERT INTO formElement_answers(formElement_id,answer_id)
	VALUES(13,11)	
	
INSERT INTO Answer(answerType, id, date_value, textarea_value, textbox_value ,formId, memberId)
	VALUES('TextBox', 12,,,'90122', 1, 3);	

INSERT INTO formElement_answers(formElement_id,answer_id)
	VALUES(14,12)		
			
INSERT INTO Answer(answerType, id, date_value, textarea_value, textbox_value ,formId, memberId)
	VALUES('TextBox', 13,,,'United States', 1, 3);	

INSERT INTO formElement_answers(formElement_id,answer_id)
	VALUES(15,13)
	
INSERT INTO Answer(answerType, id, date_value, textarea_value, textbox_value ,formId, memberId)
	VALUES('TextBox', 14,,,'Hido Co.', 1, 3);	

INSERT INTO formElement_answers(formElement_id,answer_id)
	VALUES(17,14)						
	
INSERT INTO Answer(answerType, id, date_value, textarea_value, textbox_value ,formId, memberId)
	VALUES('TextBox', 15,,,'22 Fare Oaks', 1, 3);	

INSERT INTO formElement_answers(formElement_id,answer_id)
	VALUES(18,15)
	
INSERT INTO Answer(answerType, id, date_value, textarea_value, textbox_value ,formId, memberId)
	VALUES('TextBox', 16,,,'Passadena', 1, 3);	

INSERT INTO formElement_answers(formElement_id,answer_id)
	VALUES(19,16)			
	
INSERT INTO Answer(answerType, id, date_value, textarea_value, textbox_value ,formId, memberId)
	VALUES('TextBox', 17,,,'90101', 1, 3);	

INSERT INTO formElement_answers(formElement_id,answer_id)
	VALUES(20,17)				
	
INSERT INTO Answer(answerType, id, date_value, textarea_value, textbox_value ,formId, memberId)
	VALUES('TextBox', 18,,,'Software Engineer', 1, 3);	

INSERT INTO formElement_answers(formElement_id,answer_id)
	VALUES(21,18)
	
INSERT INTO Answer(answerType, id, date_value, textarea_value, textbox_value ,formId, memberId)
	VALUES('TextBox', 19,'01/01/2015',,, 1, 3);	

INSERT INTO formElement_answers(formElement_id,answer_id)
	VALUES(22,19)							
	
INSERT INTO Answer(answerType, id, date_value, textarea_value, textbox_value ,formId, memberId)
	VALUES('TextBox', 20,'01/12/2016',,, 1, 3);	

INSERT INTO formElement_answers(formElement_id,answer_id)
	VALUES(23,20)		
	
INSERT INTO Answer(answerType, id, date_value, textarea_value, textbox_value ,formId, memberId)
	VALUES('MultipleChoice', 21,,,, 1, 3);	

INSERT INTO formElement_answers(formElement_id,answer_id)
	VALUES(24,21)		
	
INSERT INTO Answer_choices(MultipleChoiceAnswer_id,choiceAnswer_id)
	VALUES(21,2)		

INSERT INTO Answer(answerType, id, date_value, textarea_value, textbox_value ,formId, memberId)
	VALUES('TextBox', 22,,,'One', 1, 3);	

INSERT INTO formElement_answers(formElement_id,answer_id)
	VALUES(25,22)