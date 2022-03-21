select * from CCFRP.waypoints;

select lat_dd, lon_dd
from CCFRP.waypoints 
where gps_waypoint between '1422' and '1426';

select * from CCFRP.reference_barcodes;
select * from CCFRP.ccfrp_species_codes;

-- Create new table test join
create table CCFRP.join_table_1
select genus, species, sequence
from CCFRP.Reference_Barcodes;
-- Check the table
select * from join_table_1 ;

-- joining join_table_1 and ccfrp_species_codes 
create table name_sequence
select jt.genus ,
	jt.species ,
	jt.`sequence`,
	csc.species_code ,
	csc.common_name  ,
	csc.rockfish 
from join_table_1 jt 
left join CCFRP.ccfrp_species_codes csc -- this loses a lot of data because it only keeps what matches between them
on jt.genus = csc.genus and jt.species = csc.species; 

select * from name_sequence;

create table name_sequence_rightjoin
select jt.genus ,
	jt.species ,
	jt.`sequence`,
	csc.species_code ,
	csc.common_name  ,
	csc.rockfish 
from join_table_1 jt 
right join CCFRP.ccfrp_species_codes csc -- this loses a lot of data because it only keeps what matches between them
on jt.genus = csc.genus and jt.species = csc.species;

select * from name_sequence_rightjoin
where genus is not null
and species is not null
and `sequence` is not null;

select * from name_sequence
where species_code is not null
and common_name is not null
and rockfish is not null;

drop table if exists name_sequence cascade;



