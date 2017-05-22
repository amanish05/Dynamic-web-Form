------------------------------------
----PASSWORD FOR user "test" is test
------------------------------------

INSERT INTO addresses(id, area, city, country, house, state, street, zip_code)
    VALUES (1, 'Los Angeles', 'Los Angeles', 'United States', '1111', 'CA', 'Fake Street1', '90032');
    
INSERT INTO addresses(id, area, city, country, house, state, street, zip_code)
    VALUES (2, 'Los Angeles', 'Los Angeles', 'United States', '1234', 'CA', 'Fake Street2', '91132');
    
INSERT INTO addresses(id, area, city, country, house, state, street, zip_code)
    VALUES (3, 'Los Angeles', 'Los Angeles', 'United States', '4321', 'CA', 'Fake Street3', '90000');

INSERT INTO roles(role_id, name) 
	VALUES (1, 'Admin');
	
INSERT INTO roles (role_id, name) 
	VALUES (2, 'Staff');
	
INSERT INTO roles (role_id, name) 
	VALUES (3, 'User');
    
INSERT INTO members(id, email, enabled, first_name, last_name, middle_name, password, username, address_id, roles_role_id) 
	VALUES (1, 'test@gmail.com', true, 'test', 'test', 'test', '$2a$10$3pmt4bGNRF6YCCyr8gusTOwVQO8pUmFRGWjYY8eeZy23RnD4G9HhG', 'test', 1, 1);
	
INSERT INTO members(id, email, enabled, first_name, last_name, middle_name, password, username, address_id, roles_role_id) 
	VALUES (2, 'manish05@gmail.com', false, 'John', 'Doe', '', '$2a$10$3pmt4bGNRF6YCCyr8gusTOwVQO8pUmFRGWjYY8eeZy23RnD4G9HhG', 'amanish05', 2, 2);
	
INSERT INTO members(id, email, enabled, first_name, last_name, middle_name, password, username, address_id, roles_role_id) 
	VALUES (3, 'manish10@gmail.com', true, 'Jane', 'Doe', '', '$2a$10$3pmt4bGNRF6YCCyr8gusTOwVQO8pUmFRGWjYY8eeZy23RnD4G9HhG', 'amanish10', 3, 3);
        
	
ALTER SEQUENCE addresses_id_seq 
	RESTART WITH 4;
	
ALTER SEQUENCE members_id_seq 
	RESTART WITH 4;
	
ALTER SEQUENCE roles_role_id_seq 
	RESTART WITH 4;
------------------------------------
