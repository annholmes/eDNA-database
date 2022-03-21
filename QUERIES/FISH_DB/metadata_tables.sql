create schema metadata;

-- Creating the metadata tables
create table sample_data (
    eDNA_sample_ID varchar(15),
    eDNA_Project varchar(11),
    collection_date date,
    collection_site varchar(4),
    eDNA_sample_status int(1),
    extraction_date date
    sequencing_run varchar(7),
    volume_filtered float4,
    depth_sampled float4,
    water_temp_c float4,
    water_turbidity float4,
    water_pH float4
);

create table site_date (
    collection_site varchar(4),
    eDNA_project varchar(11),
    paired_data_type varchar(64),
    site_status varchar(3),
    collector varchar(64),
    vessel varchar(64)
);

create table barcode_data (
    eDNA_sample_ID varchar(15),
    barcode_gene varchar(10),
    barcode_primers varchar(10),
    eDNA_sample_status int(1),
    sequencing_run varchar(7)
)

-- drop table if exists metadata.sample_data cascade;
-- drop table if exists metadata.site_data cascade;
-- drop table if exists metadata.barcode_data cascade;