CREATE DATABASE GalacticEmpire;
USE GalacticEmpire;

CREATE TABLE SYSTEMS(
 Name varchar(40) Primary Key Not Null,
 Coordinates varchar(20) Not Null,
 MoonCount int,
 Status varchar(20) Not Null
 );

CREATE TABLE MOFFS(
 FirstName varchar(20) Not Null,
 LastName varchar(20) Not Null,
 StartDate date Not Null,
 Title varchar(20),
 HomeSystem varchar(20),
 Foreign Key (HomeSystem) References SYSTEMS(Name) On Delete No Action On Update Cascade,
 IdNumber int(9) Primary Key Not Null
 );
 
 
CREATE TABLE CAMPAIGNS(
 Name varchar(40) Not Null,
 MoffNumber int(9),
 Foreign Key (MoffNumber) References MOFFS(IdNumber) On Delete Set Null On Update Cascade,
 CampaignNumber int(9) Primary Key Not NUll,
 Status varchar(20) Not Null,
 StartDate date,
 Casualties int
 );
 
 
CREATE TABLE GENERALS(
 FirstName varchar(20) Not Null,
 LastName varchar(20) Not Null,
 IdNumber int(9) Primary Key Not Null,
 StartDate date Not Null,
 CampaignNumber int(9),
 Foreign Key (CampaignNumber) References CAMPAIGNS(CampaignNumber) On Delete Set Null On Update Cascade,
 Stars int,
 BirthDate date Not Null
 );
 
 
CREATE TABLE ADMIRALS(
 FirstName varchar(20) Not Null,
 LastName varchar(20) Not Null,
 IdNumber int(9) Primary Key Not Null,
 StartDate date Not Null,
 CampaignNumber int(9),
 Foreign Key (CampaignNumber) References CAMPAIGNS(CampaignNumber) On Delete Set Null On Update Cascade,
 Stars int,
 BirthDate date Not Null
 );
 
 CREATE TABLE BASE(
 Name varchar(40) Not Null,
 Number int(9) Not Null Primary Key,
 Systems varchar(20) Not Null,
 Foreign Key (Systems) References SYSTEMS(Name) On Delete Cascade On Update Cascade,
 Status varchar(20) Not Null,
 Coordinates varchar(20) Not Null
 ); 
 
 
CREATE TABLE LEGIONS(
 Name varchar(40) Not Null,
 Number int(9) Not Null Primary Key,
 GeneralNumber int(9),
 Foreign Key (GeneralNumber) References GENERALS(IdNumber) On Delete Set Null On Update Cascade,
 BaseNumber int(9),
 Foreign Key (BaseNumber) References BASE(number) On Delete Set Null On Update Cascade,
 TroopCount int Not Null,
 Specialty varchar(40)
 );
 
 
CREATE TABLE FLEETS(
 Name varchar(40) Not Null,
 Number int(9) Primary Key Not Null,
 AdmiralNumber int(9),
 Foreign Key (AdmiralNumber) References ADMIRALS(IdNumber) On Delete Set Null On Update Cascade,
 Systems varchar(20),
 Foreign Key (Systems) References SYSTEMS(Name) On Delete Set Null On Update Cascade,
 ShipCount int Not Null
 );
 
 
CREATE TABLE STORMTROOPERS(
 FirstName varchar(20) Not Null,
 LastName varchar(20) Not Null,
 IdNumber int(9) Primary Key Not Null,
 HomeSystem varchar(20),
 Foreign Key (HomeSystem) References SYSTEMS(Name) On Delete Set Null On Update Cascade,
 BirthDate date Not Null,
 TroopRank varchar(20) Not Null,
 LegionNumber int(9),
 Foreign Key (LegionNumber) References LEGIONS(Number) On Delete Set Null On Update Cascade
 );


CREATE TABLE PILOTS(
 FirstName varchar(20) Not Null,
 LastName varchar(20) Not Null,
 IdNumber int(9) Primary Key Not Null,
 HomeSystem varchar(20),
 Foreign Key (HomeSystem) References SYSTEMS(Name) On Delete Set Null On Update Cascade,
 BirthDate date Not Null,
 TroopRank varchar(20) Not Null,
 FleetNumber int(9),
 Foreign Key (FleetNumber) References FLEETS(Number) On Delete Set Null On Update Cascade
 );
 
