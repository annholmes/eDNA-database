-- create schema CCFRP;
-- create schema Bat_Studies;
-- create schema SFE_Suis;
-- create schema Putah_Creek;

-- Creating the CCFRP tables
create table CCFRP.drift_info_all (
	drift_id varchar(16),
	trip_id varchar(16),
	id_cell_per_trip varchar(1),
	grid_cell_id varchar(4),
	site varchar(4),
	drift_hold_station varchar(1),
	start_time varchar(16),
	end_time varchar(16),
	drift_time_hrs varchar(1),
	bar_fishing_time int4,
	fly_fishing_time int4,
	bat_fishing_time int4,
	dpr_fishing_time int4,
	sbt_fishing_time int4,
	total_time_hrs varchar(1),
	number_bat_fishers int4,
	number_fly_fishers int4,
	number_dpr_fishers int4,
	number_sbt_fishers int4,
	number_bar_fishers int4,
	total_anglers_fishing int4,
	total_angler_hrs varchar(1),
	st_latdd float4,
	st_londd float4,
	start_gps_waypoint int4,
	start_waypoint_link varchar(1),
	end_latdd float4,
	end_londd float4,
	end_gps_waypoint int4,
	end_gps_waypoint_link varchar(1),
	drift_length_m varchar(1),
	recorder varchar(4),
	tag_crew varchar(4),
	surface_t varchar(1),
	depth_t varchar(1),
	swt_vessel_f int4,
	relief int4,
	start_depth_ft int4,
	end_depth_ft int4,
	lingcod_bar_weight_oz int4,
	lead_weight_oz int4,
	sbt_tail_length_in int4,
	sbt_head_weight_oz int4,
	number_seals int4,
	number_sea_lions int4,
	total_fishes_caught int4,
	cloud_cover int4,
	wind_speed_kt varchar(4),
	wind_direction varchar(4),
	swell_height_ft int4,
	secchi_depth_m varchar(1),
	trip_comments varchar(128),
	excluded_drift_comments varchar(1),
	exclude_gear_specific_cpue varchar(1) 
);

create table CCFRP.hk_drift_info (
	drift_id varchar(16),
	trip_id varchar(8),
	id_cell_per_trip varchar(1),
	grid_cell_id varchar(4),
	site varchar(4),
	drift_hold_station varchar(1),
	start_time varchar(16),
	end_time varchar(16),
	drift_time_hrs varchar(1),
	bar_fishing_time int4,
	fly_fishing_time int4,
	bat_fishing_time int4,
	dpr_fishing_time int4,
	sbt_fishing_time int4,
	total_time_hrs varchar(1),
	number_bat_fishers int4,
	number_fly_fishers int4,
	number_dpr_fishers int4,
	number_sbt_fishers int4,
	number_bar_fishers int4,
	total_anglers_fishing int4,
	total_angler_hrs varchar(1),
	st_latdd float4,
	st_londd float4,
	start_gps_waypoint int4,
	start_waypoint_link varchar(1),
	end_latdd float4,
	end_londd float4,
	end_gps_waypoint int4,
	end_gps_waypoint_link varchar(1),
	drift_length_m varchar(1),
	recorder varchar(4),
	tag_crew varchar(4),
	surface_t varchar(1),
	depth_t varchar(1),
	swt_vessel_f float4,
	relief int4,
	start_depth_ft int4,
	end_depth_ft int4,
	lingcod_bar_weight_oz int4,
	lead_weight_oz int4,
	sbt_tail_length_in int4,
	sbt_head_weight_oz int4,
	number_seals int4,
	number_sea_lions int4,
	total_fishes_caught int4,
	cloud_cover int4,
	wind_speed_kt varchar(4),
	wind_direction varchar(4),
	swell_height_ft int4,
	secchi_depth_m varchar(1),
	trip_comments varchar(32),
	excluded_drift_comments varchar(1),
	exclude_gear_specific_cpue varchar(1) 
);

create table CCFRP.hk_fishes (
	fish_id varchar(1),
	drift_id varchar(16),
	species_code varchar(4),
	tag_id varchar(8),
	length_cm int4,
	gear_type varchar(4),
	station_number int4,
	angler_id varchar(4),
	depth_released_ft int4,
	lat_released_dd varchar(1),
	lon_released_dd varchar(1),
	sex varchar(1),
	condtion_0 int4,
	condtion_1 int4,
	condtion_2 int4,
	condtion_3 int4,
	condtion_4 int4,
	condtion_5 int4,
	condtion_6 int4,
	condtion_7 int4,
	condtion_8 int4,
	all_conditions varchar(1),
	retained int4,
	recapture int4,
	trip_comments varchar(32),
	gps_waypoint int4,
	waypoint_link varchar(1) 
);

create table CCFRP.Reference_Barcodes (
	phylum varchar(8),
	class varchar(16),
	sp_order varchar(32),
	family varchar(32),
	genus varchar(32),
	species varchar(32),
	binomial varchar(32),
	sequence varchar(256)
);

create table CCFRP.ccfrp_species_codes (
	species_code varchar(4),
	common_name varchar(64),
	genus varchar(16),
	species varchar(32),
	rockfish bool
);

create table CCFRP.sequenced_data(
	sequence varchar(256),
	rel_abun_total int4,
	rel_abun_fish int4,
	CONSTRAINT sequenced_data_pkey PRIMARY KEY (sequence)
);

create table CCFRP.waypoints (
	Date varchar(16),
	text_date int4,
	Time varchar(16),
	gps_waypoint int4,
	waypoint_link varchar(16),
	lat_dd float4,
	lon_dd float4,
	gps_num int4,
	name int4,
	wp_id varchar(16)
);

create table CCFRP.ccfrp_2020_edna (
	`date` varchar(8),
	cell_location varchar(16),
	replicate varchar(4),
	region varchar(16),
	cell_type varchar(16),
	collector varchar(8),
	vessel varchar(16),
	site_start varchar(8),
	site_end varchar(8),
	conditions varchar(1),
	sst_f float4,
	rugosity int4,
	site_depth_ft int4,
	filter_type varchar(16),
	filter_pore_um float4,
	niskin_closed varchar(8),
	lat float4,
	lon float4,
	filtration_date varchar(8),
	filtration_time varchar(8),
	filterer varchar(8),
	filtration_site varchar(16),
	turbidity float4,
	ph varchar(16),
	vol_l int4,
	appr_niskin_line_out int4,
	niskin_depth_probe varchar(1),
	temp_at_depth varchar(1),
	notes varchar(256),
	ann_labels varchar(16),
	extracted varchar(16)
);

create table CCFRP.ccfrp_2021_edna (
	`date` varchar(8),
	cell_location varchar(32),
	replicate varchar(4),
	region varchar(2),
	cell_type varchar(4),
	collectors varchar(8),
	vessel varchar(16),
	site_start varchar(1),
	site_end varchar(1),
	niskin_closed varchar(8),
	waypoint int4,
	lat varchar(1),
	lon varchar(1),
	conditions varchar(1),
	sst_f int4,
	rugosity int4,
	site_depth_ft int4,
	appr_niskin_line_out int4,
	niskin_depth_probe varchar(1),
	temp_at_depth varchar(1),
	filter_type varchar(8),
	filter_pore_um float4,
	filtration_date varchar(8),
	filtration_time varchar(8),
	filterer varchar(8),
	filtration_site varchar(32),
	turbidity float4,
	ph varchar(16),
	vol_l float4,
	notes varchar(128),
	extracted varchar(16)
);

create table CCFRP.caught_fishes_all (
	fish_id varchar(1),
	drift_id varchar(16),
	species_code varchar(4),
	tag_id varchar(8),
	length_cm int4,
	gear_type varchar(4),
	station_number int4,
	angler_id varchar(4),
	depth_released_ft int4,
	lat_released_dd varchar(1),
	lon_released_dd varchar(1),
	sex varchar(1),
	condtion_0 int4,
	condtion_1 int4,
	condtion_2 int4,
	condtion_3 int4,
	condtion_4 int4,
	condtion_5 int4,
	condtion_6 int4,
	condtion_7 int4,
	condtion_8 int4,
	all_conditions varchar(1),
	retained int4,
	recapture int4,
	trip_comments varchar(64),
	gps_waypoint int4,
	waypoint_link varchar(1)
);

create table CCFRP.ccfrp_2020_sequencing (
	`date` varchar(8),
	location varchar(256),
	replicate varchar(256),
	region varchar(256),
	type varchar(256),
	miseq_run_date varchar(256),
	sample_name_miseq_run varchar(256),
	number_of_read varchar(256)
);

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

-- drop table if exists CCFRP.Reference_Barcodes cascade; 
-- drop table if exists CCFRP.sequenced_data cascade; 
-- drop table if exists CCFRP.waypoints cascade;
-- drop table if exists CCFRP.CCFRP_2020_eDNA cascade;
-- drop table if exists CCFRP.CCFRP_2021_eDNA cascade;
-- drop table if exists CCFRP.Caught_fishes_all cascade;
-- drop table if exists CCCFRP.CFRP_2020_Sequencing cascade;
-- drop table if exists CCFRP.drift_info_all cascade;
-- drop table if exists CCFRP.hk_drift_info cascade;
-- drop table if exists CCFRP.hk_fishes cascade;

-- drop table if exists Bat_Studies.insect_RDB cascade;
-- drop table if exists Bat_Studies.insect_orders cascade;
-- drop table if exists Bat_Studies.insect_collections cascade;

-- drop table if exists Putah_Creek.edna_library_prep cascade;
-- drop table if exists Putah_Creek.Field_Data_Sheet1 cascade;
-- drop table if exists Putah_Creek.Field_Data_Sheet2 cascade;
-- drop table if exists Putah_Creek.reference_barcodes cascade;
-- drop table if exists Putah_Creek.Sites_AHolmes cascade;