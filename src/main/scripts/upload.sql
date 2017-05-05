CREATE TABLE form_file
(
    file_id serial not null,
    created_date timestamp,
    file_content bytea,
    file_name character varying(255),
    modified_date timestamp,
    form_id int4,
    owner_id int4,
    PRIMARY KEY (file_id)
);

alter table form_file 
        add constraint FK7oi774cp63k06o4remp6q2jo
        foreign key (form_id) 
        references Forms;
		
alter table form_file 
        add constraint FK7o4i774c6q2jop6or63k0emp
        foreign key (owner_id) 
        references Members;