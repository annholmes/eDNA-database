create schema Bat_Studies;

-- Creating the Bat_Studies tables
create table Bat_Studies.insect_RDB (
	occurrance_source varchar(64),
	k varchar(8),
	p varchar(16),
	c varchar(16),
	o varchar(16),
	f varchar(16),
	g varchar(16),
	s varchar(16),
	common_name varchar(64),
	Sequence varchar(1),
	sequence_source varchar(16),
	ag_pest varchar(1),
	notes varchar(256)
);

create table Bat_Studies.insect_orders (
	order_name varchar(128),
	common_name varchar(64),
	adult_mouthparts varchar(32),
	wings_no_type varchar(64),
	number_species_worldwide varchar(8),
	reference_sequencing_priority varchar(32),
	notes_1 varchar(256),
	ann_specimens varchar(64),
	key_families varchar(512),
	kunz_1995 varchar(256),
	whitaker_1996 varchar(256),
	long_1998 varchar(128),
	lee_2005 varchar(256),
	mcwilliams_2005 varchar(256),
	krauel_2018 varchar(256),
	from_corky varchar(256),
	notes_2 varchar(256)
);

create table Bat_Studies.insect_collections (
	ah_catalog_number varchar(1),
	`order`varchar(16),
	family varchar(16),
	genus varchar(16),
	species varchar(16),
	number_individuals int4,
	common_name varchar(64),
	id_by varchar(2),
	collected_by varchar(2),
	collection_date varchar(8),
	collection_year varchar(1),
	locality varchar(16),
	locality_details varchar(32),
	distribution varchar(64),
	status varchar(16),
	notes varchar(256)
);

-- drop table if exists Bat_Studies.insect_RDB cascade;
-- drop table if exists Bat_Studies.insect_orders cascade;
-- drop table if exists Bat_Studies.insect_collections cascade;