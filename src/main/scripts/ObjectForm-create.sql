




// Generating Members

//First Member
INSERT INTO public.members(
            member_id, email, first_name, last_name, middle_name, passcode)
    VALUES ('1', 'test@test.com', 'Manish', '', 'Kumar', 'Xyz@123');

INSERT INTO public.addresses(
            address_id, area, city, country, house, state, street, zip_code, member_id)
    VALUES ('1', 'College Square', 'Los Angeles', 'United States', '3', 'CA', 'Street', '90032', '1');

INSERT INTO public.roles(
            role_id, name, member_id)
    VALUES ('1', 'Admin', '1');
    
    
//Second Member
INSERT INTO public.members(
            member_id, email, first_name, last_name, middle_name, passcode)
    VALUES ('2', 'test@test.com', 'Kumar', '', 'Manish', 'Xyz@123');

INSERT INTO public.addresses(
            address_id, area, city, country, house, state, street, zip_code, member_id)
    VALUES ('2', 'College Square', 'Los Angeles', 'United States', '3', 'CA', 'Street', '90032', '2');

INSERT INTO public.roles(
            role_id, name, member_id)
    VALUES ('2', 'Staff', '2');
    
    
//Third Member
INSERT INTO public.members(
            member_id, email, first_name, last_name, middle_name, passcode)
    VALUES ('3', 'test@test.com', 'Manish', '', 'Kumar', 'Xyz@123');

INSERT INTO public.addresses(
            address_id, area, city, country, house, state, street, zip_code, member_id)
    VALUES ('3', 'College Square', 'Los Angeles', 'United States', '3', 'CA', 'Street', '90032', '3');

INSERT INTO public.roles(
            role_id, name, member_id)
    VALUES ('3', 'User', '3');


//Answer and Form Elements table insert
INSERT INTO Answer_FormElement(Answer_id, formElements_form_element_id)
VALUES('1', 1);

//Form Elements and Answer table insert
INSERT INTO FormElement_Answer(FormElement_form_element_id, answers_id)
VALUES(1, '1');

//Multiple Choice and Multiple Choice Answer Table insert
INSERT INTO multiplechoice_multiplechoiceanswers(MultipleChoice_form_element_id, multiAnswers_id) VALUES(1, '1');

//Multiple Choice Answer table insert
INSERT INTO multiplechoiceanswers(id, user, form_Form_Id) 
VALUES('1', '100', '1');

//Multiple Choice Answer and Choices Table insert
INSERT INTO multiplechoiceanswers_choices(MultipleChoiceAnswer_id, choiceAnswers_id) VALUES('1', '1');

//Text Area Answer insert
INSERT INTO textareaanswers(id, user, form_Form_Id, value)
VALUES('1', '100', '1', 'text area test');

//Text Box Answer insert
INSERT INTO textboxanswers(id, user, form_Form_Id, value)
VALUES('1', '100', '1', 'text box test');