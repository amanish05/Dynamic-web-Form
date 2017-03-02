--------------------------------------------------------
--  Add three users: one administrator, one staff, and one regular user.
--------------------------------------------------------

--FIRST MEMBER
INSERT INTO public.members(member_id, email, first_name, last_name, middle_name, passcode)
    VALUES ('1', 'test@test.com', 'Manish', '', 'Kumar', 'Xyz@123');

INSERT INTO public.addresses(address_id, area, city, country, house, state, street, zip_code, member_id)
    VALUES ('1', 'College Square', 'Los Angeles', 'United States', '3', 'CA', 'Street', '90032', '1');

INSERT INTO public.roles(role_id, name, member_id)
    VALUES ('1', 'Admin', '1');
    
    
--SECOND MEMBER
INSERT INTO public.members(member_id, email, first_name, last_name, middle_name, passcode)
    VALUES ('2', 'test@test.com', 'Kumar', '', 'Manish', 'Xyz@123');

INSERT INTO public.addresses(address_id, area, city, country, house, state, street, zip_code, member_id)
    VALUES ('2', 'College Square', 'Los Angeles', 'United States', '3', 'CA', 'Street', '90032', '2');

INSERT INTO public.roles(role_id, name, member_id)
    VALUES ('2', 'Staff', '2');
    
    
--THIRD MEMBER
INSERT INTO public.members(member_id, email, first_name, last_name, middle_name, passcode)
    VALUES ('3', 'test@test.com', 'Manish', '', 'Kumar', 'Xyz@123');

INSERT INTO public.addresses(address_id, area, city, country, house, state, street, zip_code, member_id)
    VALUES ('3', 'College Square', 'Los Angeles', 'United States', '3', 'CA', 'Street', '90032', '3');

INSERT INTO public.roles( role_id, name, member_id)
    VALUES ('3', 'User', '3');
    


------------------------------------------------------------------------
--  Add one form which includes Fields 1-9 of the VISA INFO SHEET form.
------------------------------------------------------------------------

-- Form for fields 1-9
INSERT INTO forms(id, Description, Title, ownerId)
VALUES(1, 'Divorce Papers', 'CONSULAR PROCESSING GENERAL INFORMATION', 1)
    
-- 1. Text Box for Name Of Applicant
INSERT INTO FormElement(id, name, title, value)
	VALUES(1, 'name', 'NAME OF APPLICANT (Last, First, Middle):', 'Trump, Donald, John');

-- 2. DateText for Date of Birth
INSERT INTO FormElement(id, name, title, date_format, value)
	VALUES(2, 'date', 'DATE OF BIRTH (Mo./Day/Year):', 'mm/dd/yyyy', '06/14/1946');

-- 3. Text Box for Place of Birth
INSERT INTO FormElement(id, name, title, value)
	VALUES(3, 'placeOfbirth', 'PLACE OF BIRTH (City and Country):', 'New York, United States of America');

-- 4. Text Box for Nationality
INSERT INTO FormElement(id, name, title, value)
	VALUES(4, 'nationality', 'NATIONALITY:', 'American');

-- 5. Group Element with Text Boxes for Contact Information
INSERT INTO FormElement(id, name, title, value, group_Id)
	VALUES(5, 'priphonenumber', 'Primary Phone Number:', '(111) 111-1111', 1);

INSERT INTO FormElement(id, name, title, value, group_Id)
	VALUES(6, 'secphonenumber', 'Secondary Phone Number:', '(222) 222-2222', 1);

INSERT INTO FormElement(id, name, title, value, group_Id)
	VALUES(7, 'workphonenumber', 'Work Phone Number:', '(333) 333-3333', 1);
	
INSERT INTO FormElement(id, name, title, value, group_Id)
	VALUES(8, 'email', 'Email Address:', 'donaldjtrump@gmail.com', 1);

-- 6. Group Element with Text Boxes for Current Residence
INSERT INTO FormElement(id, name, title, value, group_Id)
	VALUES(9, 'homeaddress', 'Street Address:', '123 Fake Street', 2);
	
INSERT INTO FormElement(id, name, title, value, group_Id)
	VALUES(10, 'hcity', 'City:', 'Los Angeles', 2);
	
INSERT INTO FormElement(id, name, title, value, group_Id)
	VALUES(11, 'hstate', 'State:', 'CA', 2);
	
INSERT INTO FormElement(id, name, title, value, group_Id)
	VALUES(12, 'hzip', 'Zip:', '11111', 2);
	
INSERT INTO FormElement(id, name, title, value, group_Id)
	VALUES(13, 'hcountry', 'Country:', 'USA', 2);

-- 7. Group Element with Text Boxes and Date Texts for Current Occupation
INSERT INTO FormElement(id, name, title, value, group_Id)
	VALUES(14, 'companyname','Company Name:', 'Donald Trump', 3);
	
INSERT INTO FormElement(id, name, title, value, group_Id)
	VALUES(15, 'companyaddress', 'Street Address:', '123 Real Street', 3);
	
INSERT INTO FormElement(id, name, title, value, group_Id)
	VALUES(16, 'citystate', 'City/State:', 'Los Angeles, CA' 3);
	
INSERT INTO FormElement(id, name, title, value, group_Id)
	VALUES(17, 'companyzip', 'Zip/ Postal Code (If any):', '12345', 3);
	
INSERT INTO FormElement(id, name, title, value, group_Id)
	VALUES(18, 'occupation', 'Occupation:', 'Freeloader', 3);
	
INSERT INTO FormElement(id, name, title, date_format, value, group_Id)
	VALUES(19, 'comstartdate', 'From (Mo./Day/Year):', 'mm/dd/yyyy', '01/01/1946', 3);
	
INSERT INTO FormElement(id, name, title, date_format, value, group_Id)
	VALUES(20, 'comenddate', 'To (Mo./Day/Year):', 'mm/dd/yyyy', '03/01/2017', 3);

-- 8. Multiple Choice for Marital Status
INSERT INTO choices(id, text)
	VALUES(1, 'Single');
	
INSERT INTO choices(id, text)
	VALUES(2, 'Married');
	
INSERT INTO choices(id, text)
	VALUES(3, 'Divorced');
	
INSERT INTO choices(id, text)
	VALUES(4, 'Widowed');
	
INSERT INTO FormElement(id, name, title, multiple_choice_type, number_of_allowed_select)
	VALUES(21, 'martialstatus', 'MARITAL STATUS:', 'RadioButton', 1);

-- 9. Text Box for Number of Marriages
INSERT INTO FormElement(id, name, title, value)
	VALUES(22, 'numofmarriages', 'HOW MANY TIMES HAVE YOU BEEN MARRIED?', '500 times');
	
	
------------------------------------------------------------------------
--  Add one set of answers to the form by a user.
------------------------------------------------------------------------

-- Answer and Form Elements table insert
INSERT INTO Answer_FormElement(Answer_id, formElements_form_element_id)
	VALUES('1', 1);

-- Form Elements and Answer table insert
INSERT INTO FormElement_Answer(FormElement_form_element_id, answers_id)
	VALUES(1, '1');

-- Multiple Choice and Multiple Choice Answer Table insert
INSERT INTO multiplechoice_multiplechoiceanswers(MultipleChoice_form_element_id, multiAnswers_id) 
	VALUES(1, '1');

-- Multiple Choice Answer table insert
INSERT INTO multiplechoiceanswers(id, user, form_Form_Id) 
	VALUES('1', '100', '1');

-- Multiple Choice Answer and Choices Table insert
INSERT INTO multiplechoiceanswers_choices(MultipleChoiceAnswer_id, choiceAnswers_id) 
	VALUES('1', '1');

-- Text Area Answer insert
INSERT INTO textareaanswers(id, user, form_Form_Id, value)
	VALUES('1', '100', '1', 'text area test');

-- Text Box Answer insert
INSERT INTO textboxanswers(id, user, form_Form_Id, value)
	VALUES('1', '100', '1', 'text box test');

