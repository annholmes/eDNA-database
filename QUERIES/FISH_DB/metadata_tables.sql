-- Creating a metadata schema specifically for eDNA samples
create schema metadata;

-- Creating the metadata tables
create table metadata.sample_metadata (
    eDNA_sample_ID varchar(15),
    eDNA_Project varchar(11),
    collection_date date,
    collection_site varchar(4),
    eDNA_sample_status int(1),
    extraction_date date,
    sequencing_run varchar(7),
    volume_filtered float4,
    depth_sampled float4,
    water_temp_c float4,
    water_turbidity float4,
    water_pH float4
);

insert into metadata.sample_metadata (
	eDNA_sample_ID, 
	eDNA_Project, 
    collection_date,
    collection_site,
    eDNA_sample_status,
    extraction_date,
    volume_filtered,
    depth_sampled,
    water_turbidity,
    water_pH
    )
select 
	ID,
	project,
	collection_date,
	collection_site,
	edna_sample_status,
	extracted,
	vol_l,
	site_depth_ft,
	turbidity,
	ph
from CCFRP.ccfrp_2021_edna;

insert into metadata.sample_metadata (
	eDNA_sample_ID, 
	eDNA_Project, 
    collection_date,
    collection_site,
    eDNA_sample_status,
    extraction_date,
    volume_filtered,
    depth_sampled,
    water_turbidity,
    water_pH
    )
select 
	ID,
	project,
	collection_date,
	collection_site,
	edna_sample_status,
	extraction_date,
	vol_l,
	site_depth_ft,
	turbidity,
	ph
from CCFRP.ccfrp_2020_edna;

create table metadata.site_metadata (
    collection_site varchar(4),
    eDNA_project varchar(11),
    paired_data_type varchar(64),
    site_status varchar(3),
    collector varchar(64),
    vessel varchar(64)
);

alter table metadata.site_metadata
add column collection_site_ID varchar(9) first;

insert into metadata.site_metadata (
	collection_site,
    edna_project,
    collector,
    vessel
    )
select 
	collection_site,
    project,
    collector,
    vessel
from CCFRP.ccfrp_2020_edna;

insert into metadata.site_metadata (
	collection_site,
    edna_project,
    collector,
    vessel
    )
select 
	collection_site,
    project,
    collectors,
    vessel
from CCFRP.ccfrp_2021_edna;

create table metadata.sample_barcode_metadata (
    eDNA_sample_ID varchar(15),
    barcode_gene varchar(10),
    barcode_primers varchar(10),
    eDNA_sample_status int(1),
    sequencing_run varchar(7)
);

-- drop table if exists metadata.sample_metadata cascade;
-- drop table if exists metadata.site_metadata cascade;
-- drop table if exists metadata.sample_barcode_metadata cascade;


        
		