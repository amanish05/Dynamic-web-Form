




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