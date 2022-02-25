# rough code trying to figure out a system

#packages
#install.packages("tidyverse")
#install.packages("jsonlite")
#install.packages("gtsummary")
library(gtsummary)
library(jsonlite)
library(tidyverse)
library(dplyr)
#Reading in the CSV file
reference_barcodes <- read.csv(file = "DIRTY_DATA/Reference_Barcodes.csv", check.names = F, stringsAsFactors = F)
ccfrp_species_codes <- read.csv(file = "DIRTY_DATA/CCFRP_Species_Codes.csv", check.names = F, stringsAsFactors = F)
caught_fishes_all <- read.csv(file = "DIRTY_DATA/Caught_Fishes_All.csv", check.names = F, stringsAsFactors = F)
ccfrp_2020_sequencing <- read.csv(file = "DIRTY_DATA/CCFRP_2020_sequencing.csv", check.names = F, stringsAsFactors = F)
drift_info_all <- read.csv(file = "DIRTY_DATA/Drift_info_all.csv", check.names = F, stringsAsFactors = F)
hk_drift_info <- read.csv(file = "DIRTY_DATA/HK_Drift_info.csv", check.names = F, stringsAsFactors = F)
hk_fishes <- read.csv(file = "DIRTY_DATA/HK_Fishes.csv", check.names = F, stringsAsFactors = F)
waypoints <- read.csv(file = "DIRTY_DATA/Waypoints.csv", check.names = F, stringsAsFactors = F)

CCFRP_eDNA_2020 <- read.csv(file = "GVL_data/DATA/CCFRP_eDNA_2020.csv", check.names = F, stringsAsFactors = F)
#summary(CCFRP_eDNA_2020)
CCFRP_eDNA_2020 <- rename(CCFRP_eDNA_2020, Cell_Location = Location)
CCFRP_eDNA_2020 <- rename(CCFRP_eDNA_2020, Cell_Type = Type)
CCFRP_eDNA_2020 <- rename(CCFRP_eDNA_2020, Site_Start = "Site start")
CCFRP_eDNA_2020 <- rename(CCFRP_eDNA_2020, Site_End = "Site end")
CCFRP_eDNA_2020 <- rename(CCFRP_eDNA_2020, SST_F = "SST")
CCFRP_eDNA_2020 <- rename(CCFRP_eDNA_2020, Site_Depth_ft = "Site Depth (ft)")
CCFRP_eDNA_2020 <- rename(CCFRP_eDNA_2020, Filter_Type = "Filter type")
CCFRP_eDNA_2020 <- rename(CCFRP_eDNA_2020, Filter_Pore_um = "Filter pore (um)")
CCFRP_eDNA_2020 <- rename(CCFRP_eDNA_2020, Niskin_Closed = "Niskin closed") 
CCFRP_eDNA_2020 <- rename(CCFRP_eDNA_2020, Lon = Long)
CCFRP_eDNA_2020 <- rename(CCFRP_eDNA_2020, Filtration_Date = "Filtration date")
CCFRP_eDNA_2020 <- rename(CCFRP_eDNA_2020, Filtration_Time = "Filtration time")
CCFRP_eDNA_2020 <- rename(CCFRP_eDNA_2020, Filtration_Site = "Filtration site")
CCFRP_eDNA_2020 <- rename(CCFRP_eDNA_2020, Vol_L = "Vol (L)")
CCFRP_eDNA_2020 <- rename(CCFRP_eDNA_2020, Appr_Niskin_Line_Out = "Niskin line out, approx (ft)")
CCFRP_eDNA_2020 <- rename(CCFRP_eDNA_2020, Niskin_depth_probe = "Niskin depth, probe")
CCFRP_eDNA_2020 <- rename(CCFRP_eDNA_2020, Temp_at_Depth = "Temp at depth")
CCFRP_eDNA_2020 <- rename(CCFRP_eDNA_2020, Ann_Labels = "Ann's label")

write.csv(CCFRP_eDNA_2020, "GVL_data/DATA/clean_CCFRP_eDNA_2020.csv", row.names=FALSE)

clean_CCFRP <- read.csv(file = "GVL_data/DATA/CLEAN/clean_CCFRP_eDNA_2020.csv", check.names = F, stringsAsFactors = F)
clean_CCFRP_1 <- clean_CCFRP

clean_CCFRP_1 <- clean_CCFRP_1[-c(10,18,28,38),]
write.csv(clean_CCFRP_1, "GVL_data/DATA/CLEAN/clean_CCFRP_eDNA_2020_noNC.csv", row.names=FALSE)

clean_CCFRP_2 <- clean_CCFRP[c(10,18,28,38),]
write.csv(clean_CCFRP_2, "GVL_data/DATA/CLEAN/clean_CCFRP_eDNA_2020_onlyNC.csv", row.names=FALSE)
  

## CLEANING CCFRP_Species_Codes ##

#fixing column name
ccfrp_species_codes <- rename(ccfrp_species_codes, Cell_location = Location)
ccfrp_species_codes <- rename(ccfrp_species_codes, Common_Name = Common_Name)
#Checking for duplicates
sum(duplicated(ccfrp_species_codes$Species_Code))

#Checking for empty cells
sum(ccfrp_species_codes$Species_Code=="") 
sum(ccfrp_species_codes$Common_Name=="") 
sum(ccfrp_species_codes$Genus=="") 
sum(ccfrp_species_codes$Species=="") 
sum(ccfrp_species_codes$Rockfish=="") 
#Making a new csv file
write.csv(ccfrp_species_codes, "clean_2020_data/clean_ccfrp_species_codes.csv", row.names=FALSE)

## CLEANING reference_barcodes ##

#fixing column name
reference_barcodes <- rename(reference_barcodes, SP_Order = Order)

#Checking for duplicates
sum(duplicated(reference_barcodes$Sequence))
which(duplicated(reference_barcodes$Sequence))
sum(duplicated(reference_barcodes$Species))
reference_barcodes$Sequence

#dropping duplicates
reference_barcodes <- reference_barcodes %>% distinct(Sequence, .keep_all = TRUE)
length(reference_barcodes$Sequence)
sum(duplicated(reference_barcodes$SP_Order))
which(duplicated(reference_barcodes$Sequence))
#Checking for empty cells
sum(reference_barcodes$SP_Order=="") 

#Making a new csv file
write.csv(reference_barcodes, "clean_2020_data/clean_reference_barcodes.csv", row.names=FALSE)

## CLEANING waypoints ##

#fixing column name
waypoints <- rename(waypoints, Text_date = Text_data)

#Checking for duplicates
sum(duplicated(waypoints$GPS_Waypoint))
#no duplicates

#dropping duplicates

#Checking for empty cells
sum(waypoints$GPS_Waypoint=="") 

#Making a new csv file
write.csv(waypoints, "clean_2020_data/clean_waypoints.csv", row.names=FALSE)

## CLEANING hk_drift_info ##

#fixing column name

#Checking for duplicates
sum(duplicated(waypoints$GPS_Waypoint))
#no duplicates

#dropping duplicates

#Checking for empty cells
sum(waypoints$GPS_Waypoint=="") 

#Making a new csv file
write.csv(waypoints, "clean_2020_data/clean_waypoints.csv", row.names=FALSE)

