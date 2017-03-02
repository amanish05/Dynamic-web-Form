--------------------------------------------------------
--  Add three users: one administrator, one staff, and one regular user.
--------------------------------------------------------

--FIRST MEMBER
INSERT INTO members(id, email, first_name, last_name, middle_name, passcode)
    VALUES ('1', 'test@test.com', 'Manish', '', 'Kumar', 'Xyz@123');

INSERT INTO addresses(id, area, city, country, house, state, street, zip_code)
    VALUES ('1', 'College Square', 'Los Angeles', 'United States', '3', 'CA', 'Street', '90032');

INSERT INTO roles(role_id, name)
    VALUES ('1', 'Admin');
    
    
--SECOND MEMBER
INSERT INTO members(id, email, first_name, last_name, middle_name, passcode)
    VALUES ('2', 'test@test.com', 'Kumar', '', 'Manish', 'Xyz@123');

INSERT INTO addresses(id, area, city, country, house, state, street, zip_code)
    VALUES ('2', 'College Square', 'Los Angeles', 'United States', '3', 'CA', 'Street', '90032');

INSERT INTO roles(role_id, name)
    VALUES ('2', 'Staff');
    
    
--THIRD MEMBER
INSERT INTO members(id, email, first_name, last_name, middle_name, passcode)
    VALUES ('3', 'test@test.com', 'Manish', '', 'Kumar', 'Xyz@123');

INSERT INTO addresses(id, area, city, country, house, state, street, zip_code)
    VALUES ('3', 'College Square', 'Los Angeles', 'United States', '3', 'CA', 'Street', '90032');

INSERT INTO roles( role_id, name)
    VALUES ('3', 'User');
    


------------------------------------------------------------------------
--  Add one form which includes Fields 1-9 of the VISA INFO SHEET form.
------------------------------------------------------------------------

-- Form for fields 1-9
INSERT INTO forms(id, Description, Title, ownerId)
VALUES(1, 'Divorce Papers', 'CONSULAR PROCESSING GENERAL INFORMATION', 1);
    
-- 1. Text Box for Name Of Applicant
INSERT INTO FormElement(elementType, id, name, title, value)
	VALUES('TextBox', 01, 'name', 'NAME OF APPLICANT (Last, First, Middle):', 'Trump, Donald, John');

-- 2. DateText for Date of Birth
INSERT INTO FormElement(elementType, id, name, title, date_format, value)
	VALUES('DateText', 02, 'date', 'DATE OF BIRTH (Mo./Day/Year):', 'mm/dd/yyyy', '06/14/1946');

-- 3. Text Box for Place of Birth
INSERT INTO FormElement(elementType, id, name, title, value)
	VALUES('TextBox', 03, 'placeOfbirth', 'PLACE OF BIRTH (City and Country):', 'New York, United States of America');

-- 4. Text Box for Nationality
INSERT INTO FormElement(elementType, id, name, title, value)
	VALUES('TextBox', 04, 'nationality', 'NATIONALITY:', 'American');

-- 5. Group Element with Text Boxes for Contact Information
INSERT INTO FormElement(elementType, id, name, title, value, group_Id)
	VALUES('TextBox', 05, 'priphonenumber', 'Primary Phone Number:', '(111) 111-1111', 1);

INSERT INTO FormElement(elementType, id, name, title, value, group_Id)
	VALUES('TextBox', 06, 'secphonenumber', 'Secondary Phone Number:', '(222) 222-2222', 1);

INSERT INTO FormElement(elementType, id, name, title, value, group_Id)
	VALUES('TextBox', 07, 'workphonenumber', 'Work Phone Number:', '(333) 333-3333', 1);
	
INSERT INTO FormElement(elementType, id, name, title, value, group_Id)
	VALUES('TextBox', 08, 'email', 'Email Address:', 'donaldjtrump@gmail.com', 1);

-- 6. Group Element with Text Boxes for Current Residence
INSERT INTO FormElement(elementType, id, name, title, value, group_Id)
	VALUES('TextBox', 09, 'homeaddress', 'Street Address:', '123 Fake Street', 2);
	
INSERT INTO FormElement(elementType, id, name, title, value, group_Id)
	VALUES('TextBox', 10, 'hcity', 'City:', 'Los Angeles', 2);
	
INSERT INTO FormElement(elementType, id, name, title, value, group_Id)
	VALUES('TextBox', 11, 'hstate', 'State:', 'CA', 2);
	
INSERT INTO FormElement(elementType, id, name, title, value, group_Id)
	VALUES('TextBox', 12, 'hzip', 'Zip:', '11111', 2);
	
INSERT INTO FormElement(elementType, id, name, title, value, group_Id)
	VALUES('TextBox', 13, 'hcountry', 'Country:', 'USA', 2);

-- 7. Group Element with Text Boxes and Date Texts for Current Occupation
INSERT INTO FormElement(elementType, id, name, title, value, group_Id)
	VALUES('TextBox', 14, 'companyname','Company Name:', 'Donald Trump', 3);
	
INSERT INTO FormElement(elementType, id, name, title, value, group_Id)
	VALUES('TextBox', 15, 'companyaddress', 'Street Address:', '123 Real Street', 3);
	
INSERT INTO FormElement(elementType, id, name, title, value, group_Id)
	VALUES('TextBox', 16, 'citystate', 'City/State:', 'Los Angeles, CA', 3);
	
INSERT INTO FormElement(elementType, id, name, title, value, group_Id)
	VALUES('TextBox', 17, 'companyzip', 'Zip/ Postal Code (If any):', '12345', 3);
	
INSERT INTO FormElement(elementType, id, name, title, value, group_Id)
	VALUES('TextBox', 18, 'occupation', 'Occupation:', 'Freeloader', 3);
	
INSERT INTO FormElement(elementType, id, name, title, date_format, value, group_Id)
	VALUES('DateText', 19, 'comstartdate', 'From (Mo./Day/Year):', 'mm/dd/yyyy', '01/01/1946', 3);
	
INSERT INTO FormElement(elementType, id, name, title, date_format, value, group_Id)
	VALUES('DateText', 20, 'comenddate', 'To (Mo./Day/Year):', 'mm/dd/yyyy', '03/01/2017', 3);

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
INSERT INTO FormElement(elementType, id, name, title, value)
	VALUES('TextBox', 22, 'numofmarriages', 'HOW MANY TIMES HAVE YOU BEEN MARRIED?', '500 times');
	
	
------------------------------------------------------------------------
--  Add one set of answers to the form by a user.
------------------------------------------------------------------------

-- Answer and Form Elements table insert
INSERT INTO Answer(answerType, id, formId, memberId)
	VALUES('TextBox', 1, 1, 1);

-- Form Elements and Answer table insert
INSERT INTO Answer(answerType, id, formId, memberId)
	VALUES('TextArea', 2, 1, 1);

-- Multiple Choice and Multiple Choice Answer Table insert
INSERT INTO Answer(answerType, id, formId, memberId)
	VALUES('MultipleChoice', 3, 1, 1);

-- Multiple Choice Answer table insert
INSERT INTO Answer(answerType, id, formId, memberId)
	VALUES('MultipleChoice', 4, 1, 1);

-- Multiple Choice Answer and Choices Table insert
INSERT INTO Answer(answerType, id, formId, memberId)
	VALUES('MultipleChoice', 5, 1, 1);

-- Text Area Answer insert
INSERT INTO Answer(answerType, id, formId, memberId)
	VALUES('TextArea', 6, 1, 1);

-- Text Box Answer insert
INSERT INTO Answer(answerType, id, formId, memberId)
	VALUES('TextBox', 7, 1, 1);
