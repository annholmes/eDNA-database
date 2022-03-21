create schema Putah_Creek;

-- Creating the Putah_Creek tables
create table Putah_Creek.Sites_AHolmes (
	edna_20 varchar(1),
	edna_21 varchar(1),
	site varchar(64),
	`Access` varchar(16),
	downstream_lat_dd float4,
	downstream_lon_dd float4,
	upstream_lat_dd float4,
	upstream_lon_dd float4
);

create table Putah_Creek.Field_Data_Sheet1 (
	`Date` varchar(16),
	site varchar(64),
	`Paired?` varchar(16),
	rep_1 varchar(4),
	`x` int4,
	s5xx varchar(4),
	n7xx varchar(4),
	lat float4,
	lon float4,
	collector varchar(8),
	`Time` varchar(8),
	Collection_method varchar(16),
	Temp float4,
	spcnd float4,
	do_percentage float4,
	turb_ntu float4,
	ph float4,
	bar_mmhg float4,
	env_data_comments varchar(256),
	filtering varchar(8),
	filterer varchar(2),
	rep_2 varchar(4),
	filter_type varchar(16),
	pore_size_um float4,
	vol_l int4,
	filtration_site varchar(8),
	filtration_time varchar(8),
	Comments varchar(128),
	entered_by varchar(2),
	date_entered varchar(16),
	extracted_by varchar(2),
	extracted_date varchar(8),
	library_prep_notes varchar(32)	
);

create table Putah_Creek.Field_Data_Sheet2 (
	`Date` varchar(16),
	site varchar(32),
	replicates int4,
	sampling_method varchar(16),
	filter_type varchar(16),
	collector varchar(8),
	field_crew varchar(32),
	notes varchar(32)
);

create table Putah_Creek.reference_barcodes (
	kingdom varchar(8),
	phylum varchar(8),
	`Class` varchar(16),
	`Order` varchar(32),
	`Family` varchar(16),
	genus varchar(16),
	species varchar(32),
	barcode_trimmed varchar(256)
);

CREATE TABLE Putah_Creek.edna_library_prep (
	`Date` varchar(16),
	site varchar(64),
	replicate varchar(8),
	extracted varchar(1),
	qpcr varchar(16),
	bead_cleanup varchar(16)
);

-- drop table if exists Putah_Creek.edna_library_prep cascade;
-- drop table if exists Putah_Creek.Field_Data_Sheet1 cascade;
-- drop table if exists Putah_Creek.Field_Data_Sheet2 cascade;
-- drop table if exists Putah_Creek.reference_barcodes cascade;
-- drop table if exists Putah_Creek.Sites_AHolmes cascade;