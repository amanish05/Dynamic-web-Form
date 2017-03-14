create sequence hibernate_sequence minvalue 100;

create table members (
    id          integer primary key,
    firstName    varchar(255) unique,
    lastName	 varchar(255),
    middleName	varchar(255),
    email		varchar(255),
    passcode	varchar(255),
    address		varchar(255),
    enabled     boolean not null default 't'
);

insert into users values (1, 'jack', 'tom', 'lee', 'jack@gmail.com', 'jackjack', 'usa' 't');
insert into users values (2, 'a', 'b', 'c', 'd@gmail.com', 'abcd', 'china' 't');

create table authorities (
    email    varchar(255) not null references members(email),
    authority   varchar(255)
);

insert into authorities values('jack@gmail.com', 'ROLE_ADMIN');
insert into authorities values('d@gmail.com', 'ROLE_USER');