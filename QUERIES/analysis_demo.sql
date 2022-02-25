select * from waypoints;

select lat_dd, lon_dd
from waypoints 
where gps_waypoint between '1422' and '1426';

select * from reference_barcodes;
select * from ccfrp_species_codes;

-- Create new table test join
select genus, species, sequence
into join_table_1
from reference_barcodes;
-- Check the table
select * from join_table_1 ;

-- joining join_table_1 and ccfrp_species_codes 
select jt.genus ,
	jt.species ,
	jt."sequence",
	csc.species_code ,
	csc.common_name  ,
	csc.rockfish 
--into name_sequence
from join_table_1 jt 
left join ccfrp_species_codes csc -- this loses a lot of data because it only keeps what matches between them
on jt.genus = csc.genus and jt.species = csc.species; 

drop table name_sequence cascade;

select * from name_sequence;


