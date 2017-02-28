create sequence hibernate_sequence start 1 increment 1;

    create table Addresses (
        Address_Id varchar(255) not null,
        Area varchar(25),
        City varchar(20),
        Country varchar(30),
        House varchar(10),
        State varchar(20),
        Street varchar(10),
        Zip_Code int4,
        Member_Id varchar(255),
        primary key (Address_Id)
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

    create table Members (
        Member_Id varchar(255) not null,
        Email varchar(255),
        First_Name varchar(255),
        Last_Name varchar(255),
        Middle_Name varchar(255),
        Passcode varchar2(30),
        primary key (Member_Id)
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

    alter table Addresses 
        add constraint FKmkbynwpsuvdogtfq3uxlx7x0k 
        foreign key (Member_Id) 
        references Members;

    alter table pages 
        add constraint FKlsq56jsg42mm80q2cr7evs6xj 
        foreign key (Form_Id) 
        references forms;

    alter table Roles 
        add constraint FKp0f01rratl5yc46efmgj2tqej 
        foreign key (Member_Id) 
        references Members;
