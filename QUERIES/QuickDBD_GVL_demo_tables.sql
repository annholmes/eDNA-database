-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
 
drop table Reference_Barcodes cascade; 
drop table CCFRP_species_codes cascade;
drop table SEQUENCED_DATA cascade; 
-- drop table HK_drift_info cascade; 
-- drop table HK_Fishes cascade; 
-- drop table Drift_info_all cascade; 
-- drop table Caught_fishes_all cascade; 
-- drop table Waypoints cascade; 
-- drop table CCFRP_2020_Sequencing cascade; 

CREATE TABLE Reference_Barcodes ( 
    Phylum varchar ,
    Class varchar ,
    SP_Order varchar ,
    Family varchar ,
    Genus varchar ,
    Species varchar ,
    Binomial varchar ,
    Sequence varchar ,
    primary key (Sequence)
);

CREATE TABLE CCFRP_species_codes (
    Species_Code varchar ,
    Common_Name varchar ,
    Genus varchar,
    Species varchar,
    Rockfish bool ,
    primary key (Species_Code)
);

CREATE TABLE SEQUENCED_DATA (
    Sequence varchar ,
    rel_abun_total int ,
    rel_abun_fish int ,
    primary key (Sequence)
);

alter table Reference_Barcodes 
add constraint fk_Reference_Barcodes_Sequence 
foreign key (Sequence) references SEQUENCED_DATA (Sequence);

alter table CCFRP_species_codes  
add constraint fk_CCFRP_species_Species 
foreign key (Species) references Reference_Barcodes (Species); --FIX THIS, WHY WILL IT not MAKE THE CONNECTION

--     Drift_ID varchar ,
--     Trip_ID varchar ,
--     Grid_Cells varchar ,
--     Site(MPA/REF) varchar ,
--     Start_Time time ,
--     End_Time time ,
--     ST_LatDD int ,
--     ST_LonDD int ,
--     Start_GPS_Waypoint int ,
--     End_LatDD int ,
--     End_LonDD int ,
--     End_GPS_Waypoint int ,
--     SWT int ,
--     Relief int ,
--     Start_Depth int ,
--     End_Depth int ,
--     Total_Caught int ,
--     Cloud_Cover int ,
--     Wind_Speed varchar ,
--     Wind_Direction varchar ,
--     Swell_Height int ,
--     Comments varchar ,
--     CONSTRAINT pk_HK_drift_info PRIMARY KEY (
--         Drift_ID
--      )
-- );

-- CREATE TABLE HK_Fishes (
--     Drift_ID varchar ,
--     Species_Code varchar ,
--     Tag_ID varchar ,
--     Length(cm) int ,
--     Gear_Type varchar ,
--     Station_Number int ,
--     Angler_ID varchar ,
--     Depth_Released(ft) int ,
--     Sex varchar ,
--     Comments varchar ,
--     GPS_Waypoint int ,
--     primary key (Tag_ID)
-- );

-- CREATE TABLE Drift_info_all (
--     Drift_ID varchar ,
--     Trip_ID varchar ,
--     ID_cell_per_trip varchar ,
--     Grid_Cell_ID varchar ,
--     Site(MPA/REF) varchar ,
--     Start_Time time ,
--     End_Time time ,
--     ST_LatDD int ,
--     ST_LonDD int ,
--     Start_GPS_Waypoint int ,
--     Start_waypoint_link varchar ,
--     End_LatDD int ,
--     End_LonDD int ,
--     End_GPS_Waypoint int ,
--     End_waypoint_link varchar ,
--     Drift_Length(m) int ,
--     Recorder varchar ,
--     Tag_Crew varchar ,
--     Surface_T int ,
--     Depth_T int ,
--     SWT(Vessel_F) int ,
--     Relief int ,
--     Start_Depth(ft) int ,
--     End_Depth(ft) int ,
--     Lincod_bar_weight(oz) int ,
--     Lead_weight(oz) int ,
--     SBT_tail_length(in) int ,
--     SBT_head_weight(oz) int ,
--     Seals_number int ,
--     SeaLions_number int ,
--     Fishes_Caught int ,
--     Cloud_Cover int ,
--     Wind_Speed varchar ,
--     Wind_Direction varchar ,
--     Swell_Height int ,
--     Comments varchar ,
--     CONSTRAINT pk_Drift_info_all PRIMARY KEY (
--         Drift_ID
--      )
-- );

-- CREATE TABLE Caught_fishes_all (
--     Fish_ID varchar ,
--     Drift_ID varchar ,
--     Species_Code varchar ,
--     Tag_ID varchar ,
--     Length(cm) int ,
--     Gear_Type varchar ,
--     Station_Number int ,
--     Angler_ID varchar ,
--     Depth_Released(ft) int ,
--     lat_released int ,
--     lon_released int ,
--     Sex varchar ,
--     Comments varchar ,
--     GPS_Waypoint int ,
--     Waypoint_Link varchar ,
--     CONSTRAINT pk_Caught_fishes_all PRIMARY KEY (
--         Fish_ID
--      )
-- );

-- CREATE TABLE Waypoints (
--     Date date ,
--     Time time ,
--     GPS_Waypoint int ,
--     Waypoint_Link varchar ,
--     lat_DD int ,
--     lon_DD int ,
--     CONSTRAINT pk_Waypoints PRIMARY KEY (
--         GPS_Waypoint
--      )
-- );

-- CREATE TABLE CCFRP_2020_Sequencing (
--     Date date ,
--     Location varchar ,
--     Replicate varchar ,
--     Region varchar ,
--     Site(MPA/REF) varchar ,
--     MiSeq_Run/Date varchar ,
--     Sample_Name_MiSeq varchar ,
--     Number_of_Reads varchar 
-- );


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

