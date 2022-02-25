drop table if exists Reference_Barcodes cascade; 
drop table if exists CCFRP_species_codes cascade;
drop table if exists SEQUENCED_DATA cascade; 
drop table if exists Waypoints cascade;
drop table if exists CCFRP_2020_eDNA cascade;
drop table if exists CCFRP_2021_eDNA cascade;
drop table if exists Caught_fishes_all cascade;
drop table if exists CCFRP_2020_Sequencing cascade;
drop table if exists drift_info_all cascade;
drop table if exists hk_drift_info cascade;
drop table if exists hk_fishes cascade;

create table Reference_Barcodes ( 
    Phylum varchar,
    Class varchar,
    SP_Order varchar,
    Family varchar,                                      
    Genus varchar,
    Species varchar,
    Binomial varchar,
    Sequence varchar,
    primary key (Sequence)
);

create table CCFRP_species_codes (
    Species_Code varchar,
    Common_Name varchar,
    Genus varchar,
    Species varchar,
    Rockfish bool,
    primary key (Species_Code)
);

create table SEQUENCED_DATA (
    Sequence varchar,
    rel_abun_total int,
    rel_abun_fish int,
    primary key (Sequence)
);

create table Waypoints (
    Date date not,
    Text_date varchar not,
    Time time not,
    GPS_Waypoint varchar not,
    Waypoint_Link varchar not,
    lat_DD decimal(6, 4) not,
    lon_DD decimal(7, 4) not,
    GPS_num int not,
    name int not,
    WP_ID varchar not,
    primary key (GPS_Waypoint)
);

create table CCFRP_2020_eDNA (
	Date date,
	Cell_Location varchar,
	Replicate varchar,
	Region varchar,
	Cell_Type varchar,
	Collector varchar,
	Vessel varchar,
	Site_Start time,
	Site_End time,
	Conditions varchar,
	SST_F decimal(3,1),
	Rugosity int,
	Site_Depth_ft int,
	Filter_Type varchar,
	Filter_Pore_um decimal(3,2),
	Niskin_Closed time,
	Lat decimal(7,5),
	Lon decimal(7,4),
	Filtration_Date date,
	Filtration_Time time,
	Filterer varchar,
	Filtration_Site varchar,
	Turbidity decimal(3,2),
	pH varchar,
	Vol_L int,
	Appr_Niskin_Line_Out int,
	Niskin_Depth_Probe varchar,
	Temp_at_Depth varchar,
	Notes varchar,
	Ann_Labels varchar,
	Extracted varchar
);

create table CCFRP_2021_eDNA (
	Date date,
	Cell_Location varchar,
	Replicate varchar,
	Region varchar,
	Cell_Type varchar,
	Collectors varchar,
	Vessel varchar,
	Site_Start time,
	Site_End time,
	Niskin_Closed time,
	Waypoint int,
	Lat decimal(7,5),
	Lon decimal(7,4),
	Conditions varchar,
	SST_F decimal(3,1),
	Rugosity int,
	Site_Depth_ft int,
	Appr_Niskin_Line_Out int,
	Niskin_Depth_Probe varchar,
	Temp_at_Depth varchar,	
	Filter_Type varchar,
	Filter_Pore_um decimal(3,2),
	Filtration_Date date,
	Filtration_Time time,
	Filterer varchar,
	Filtration_Site varchar,
	Turbidity decimal(3,2),
	pH varchar,
	Vol_L int,
	Notes varchar,
	Extracted varchar
);

create table caught_fishes_all (
	Fish_ID varchar,
	Drift_ID varchar,
	Species_Code varchar,
	Tag_ID varchar,
	Length_cm decimal(4,1),
	Gear_Type varchar,
	Station_Number varchar,
	Angler_ID varchar,
	Depth_Released_ft int,
	Lat_Released_DD decimal(7,5),
	Lon_Released_DD decimal(7,5),
	Sex varchar,
	Condition_0 int,
	Condition_1 int,
	Condition_2 int,
	Condition_3 int,
	Condition_4 int,
	Condition_5 int,
	Condition_6 int,
	Condition_7 int,
	Condition_8 int,
	All_Conditions int,
	Retained int,
	Recaptured int,
	Trip_comments varchar,
	GPS_Waypoint varchar,
	waypoint_link varchar
);

create table CCFRP_2020_Sequencing (
	Date date,
	location varchar,
	Replicate varchar,
	Region varchar,
	type varchar,
	MiSeq_Run_Date varchar,
	Sample_Name_MiSeq_run varchar,
	Number_of_Read varchar
); 

create table drift_info_all (
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

create table hk_drift_info (
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

CREATE TABLE hk_fishes (
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


-- alter table Reference_Barcodes 
-- add constraint fk_Reference_Barcodes_Sequence 
-- foreign key (Sequence) references SEQUENCED_DATA (Sequence);

-- alter table CCFRP_species_codes  
-- add constraint fk_CCFRP_species_Species 
-- foreign key (Species) references Reference_Barcodes (Species); 



-- ALTER TABLE HK_drift_info ADD CONSTRAINT fk_HK_drift_info_ST_LatDD_ST_LonDD_Start_GPS_Waypoint FOREIGN KEY(ST_LatDD, ST_LonDD, Start_GPS_Waypoint)
-- REFERENCES Waypoints (lat_DD, lon_DD, GPS_Waypoint);

-- ALTER TABLE HK_drift_info ADD CONSTRAINT fk_HK_drift_info_End_LatDD_End_LonDD_End_GPS_Waypoint FOREIGN KEY(End_LatDD, End_LonDD, End_GPS_Waypoint)
-- REFERENCES Waypoints (lat_DD, lon_DD, GPS_Waypoint);

-- ALTER TABLE HK_Fishes ADD CONSTRAINT fk_HK_Fishes_Drift_ID FOREIGN KEY(Drift_ID)
-- REFERENCES Drift_info_all (Drift_ID);

-- ALTER TABLE HK_Fishes ADD CONSTRAINT fk_HK_Fishes_GPS_Waypoint FOREIGN KEY(GPS_Waypoint)
-- REFERENCES Waypoints (GPS_Waypoint);

-- ALTER TABLE Drift_info_all ADD CONSTRAINT fk_Drift_info_all_Drift_ID_Trip_ID FOREIGN KEY(Drift_ID, Trip_ID)
-- REFERENCES HK_drift_info (Drift_ID, Trip_ID);

-- ALTER TABLE Drift_info_all ADD CONSTRAINT fk_Drift_info_all_ST_LatDD_ST_LonDD_Start_waypoint_link_End_GPS_Waypoint FOREIGN KEY(ST_LatDD, ST_LonDD, Start_waypoint_link, End_GPS_Waypoint)
-- REFERENCES Waypoints (lat_DD, lon_DD, Waypoint_Link, GPS_Waypoint);

-- ALTER TABLE Drift_info_all ADD CONSTRAINT fk_Drift_info_all_End_LatDD_End_LonDD_End_waypoint_link FOREIGN KEY(End_LatDD, End_LonDD, End_waypoint_link)
-- REFERENCES Waypoints (lat_DD, lon_DD, Waypoint_Link);

-- ALTER TABLE Caught_fishes_all ADD CONSTRAINT fk_Caught_fishes_all_Drift_ID FOREIGN KEY(Drift_ID)
-- REFERENCES Drift_info_all (Drift_ID);

-- ALTER TABLE Caught_fishes_all ADD CONSTRAINT fk_Caught_fishes_all_GPS_Waypoint_Waypoint_Link FOREIGN KEY(GPS_Waypoint, Waypoint_Link)
-- REFERENCES Waypoints (GPS_Waypoint, Waypoint_Link);

-- ALTER TABLE Waypoints ADD CONSTRAINT fk_Waypoints_Date FOREIGN KEY(Date)
-- REFERENCES CCFRP_2020_Sequencing (Date);

-- ALTER TABLE Waypoints ADD CONSTRAINT fk_Waypoints_GPS_Waypoint FOREIGN KEY(GPS_Waypoint)
-- REFERENCES Drift_info_all (Start_GPS_Waypoint);
