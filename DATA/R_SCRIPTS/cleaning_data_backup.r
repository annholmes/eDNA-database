---
title: "cleaning_CCFRP_data"
output: html_notebook
---

```{r}
# import dependencies
#packages
#install.packages("tidyverse")
#install.packages("jsonlite")
#install.packages("gtsummary")
library(gtsummary)
library(jsonlite)
library(tidyverse)
library(dplyr)
```


```{r}
# cleaning clean_CCFRP_eDNA_2020.csv
clean_CCFRP_eDNA_2020 <- read.csv(file = "../CLEAN_DATA/clean_CCFRP_eDNA_2020.csv", check.names = F, stringsAsFactors = F)
clean_CCFRP_eDNA_2020[is.na(clean_CCFRP_eDNA_2020)] = ""
write.csv(clean_CCFRP_eDNA_2020, "../CLEAN_DATA/clean_CCFRP_eDNA_2020.csv", row.names=FALSE)
```

```{r cleaning CCFRP_eDNA_2021.csv}
# reading file
CCFRP_eDNA_2021 <- read.csv(file = "../DIRTY_DATA/CCFRP_eDNA_2021.csv", check.names = F, stringsAsFactors = F)

# renaming columns
CCFRP_eDNA_2021 <- rename(CCFRP_eDNA_2021, Cell_Location = Location)
CCFRP_eDNA_2021 <- rename(CCFRP_eDNA_2021, Cell_Type = Type)
CCFRP_eDNA_2021 <- rename(CCFRP_eDNA_2021, Site_Start = "Site start")
CCFRP_eDNA_2021 <- rename(CCFRP_eDNA_2021, Site_End = "Site end")
CCFRP_eDNA_2021 <- rename(CCFRP_eDNA_2021, Site_Depth_ft = "Site Depth (ft)")
CCFRP_eDNA_2021 <- rename(CCFRP_eDNA_2021, Filter_Type = "Filter type")
CCFRP_eDNA_2021 <- rename(CCFRP_eDNA_2021, Filter_Pore_um = "Filter pore (um)")
CCFRP_eDNA_2021 <- rename(CCFRP_eDNA_2021, Lon = Long)
CCFRP_eDNA_2021 <- rename(CCFRP_eDNA_2021, Filtration_Date = "Filtration date")
CCFRP_eDNA_2021 <- rename(CCFRP_eDNA_2021, Filtration_Time = "Filtration time")
CCFRP_eDNA_2021 <- rename(CCFRP_eDNA_2021, Filtration_Site = "Filtration site")
CCFRP_eDNA_2021 <- rename(CCFRP_eDNA_2021, Vol_L = "Vol (L)")
CCFRP_eDNA_2021 <- rename(CCFRP_eDNA_2021, Appr_Niskin_Line_Out = "Niskin line out, approx (ft)")
CCFRP_eDNA_2021 <- rename(CCFRP_eDNA_2021, Niskin_depth_probe = "Niskin depth, probe")
CCFRP_eDNA_2021 <- rename(CCFRP_eDNA_2021, Temp_at_Depth = "Temp at depth")
CCFRP_eDNA_2021 <- rename(CCFRP_eDNA_2021, Niskin_Closed = "Niskin closed time")
CCFRP_eDNA_2021 <- rename(CCFRP_eDNA_2021, SST_F = "SST (F)")
CCFRP_eDNA_2021 <- rename(CCFRP_eDNA_2021, Turbidity = "Turbidity (NTU)")
CCFRP_eDNA_2021 <- rename(CCFRP_eDNA_2021, Extracted = "Extraction Date")

# writing new csv file in clean folder
write.csv(CCFRP_eDNA_2021, "../CLEAN_DATA/clean_CCFRP_eDNA_2021.csv", row.names=FALSE)
clean_CCFRP_eDNA_2021 <- read.csv(file = "../CLEAN_DATA/clean_CCFRP_eDNA_2021.csv", check.names = F, stringsAsFactors = F)

# replacing NA with empty cells
clean_CCFRP_eDNA_2021[is.na(clean_CCFRP_eDNA_2021)] = ""
clean_CCFRP_eDNA_2021$Niskin_Closed[13] = ""
clean_CCFRP_eDNA_2021$Turbidity[13] = ""
clean_CCFRP_eDNA_2021$Turbidity[23] = ""
clean_CCFRP_eDNA_2021$Turbidity[37] = ""

write.csv(clean_CCFRP_eDNA_2021, "../CLEAN_DATA/clean_CCFRP_eDNA_2021.csv", row.names=FALSE)
```

```{r cleaning Caught_Fishes_All.csv}
# reading file
Caught_Fishes_All <- read.csv(file = "../DIRTY_DATA/Caught_Fishes_All.csv", check.names = F, stringsAsFactors = F)

# renaming columns
Caught_Fishes_All <- rename(Caught_Fishes_All, Fish_ID = "Fish ID")
Caught_Fishes_All <- rename(Caught_Fishes_All, Drift_ID = "Drift ID")
Caught_Fishes_All <- rename(Caught_Fishes_All, Species_Code = "Species Code")
Caught_Fishes_All <- rename(Caught_Fishes_All, Tag_ID = "Tag ID")
Caught_Fishes_All <- rename(Caught_Fishes_All, Length_cm = "Length (cm)")
Caught_Fishes_All <- rename(Caught_Fishes_All, Gear_Type = "Gear Type")
Caught_Fishes_All <- rename(Caught_Fishes_All, Station_Number = "Station #")
Caught_Fishes_All <- rename(Caught_Fishes_All, Angler_ID = "Angler ID")
Caught_Fishes_All <- rename(Caught_Fishes_All, Depth_Released_ft = "Depth Released (ft)")
Caught_Fishes_All <- rename(Caught_Fishes_All, Lat_Released_DD = "Lat Released (DD)")
Caught_Fishes_All <- rename(Caught_Fishes_All, Lon_Released_DD= "Lon Released (DD)")
Caught_Fishes_All <- rename(Caught_Fishes_All, Condtion_0 = "Condition 0")
Caught_Fishes_All <- rename(Caught_Fishes_All, Condtion_1 = "Condition 1")
Caught_Fishes_All <- rename(Caught_Fishes_All, Condtion_2 = "Condition 2")
Caught_Fishes_All <- rename(Caught_Fishes_All, Condtion_3 = "Condition 3")
Caught_Fishes_All <- rename(Caught_Fishes_All, Condtion_4 = "Condition 4")
Caught_Fishes_All <- rename(Caught_Fishes_All, Condtion_5 = "Condition 5")
Caught_Fishes_All <- rename(Caught_Fishes_All, Condtion_6 = "Condition 6")
Caught_Fishes_All <- rename(Caught_Fishes_All, Condtion_7 = "Condition 7")
Caught_Fishes_All <- rename(Caught_Fishes_All, Condtion_8 = "Condition 8")
Caught_Fishes_All <- rename(Caught_Fishes_All, All_Conditions = "All Conditions")
Caught_Fishes_All <- rename(Caught_Fishes_All, GPS_Waypoint = "GPS Waypoint")
Caught_Fishes_All <- rename(Caught_Fishes_All, Trip_comments = "Comments")

# writing new csv file in clean folder
write.csv(Caught_Fishes_All, "../CLEAN_DATA/clean_Caught_Fishes_All.csv", row.names=FALSE)
clean_Caught_Fishes_All <- read.csv(file = "../CLEAN_DATA/clean_Caught_Fishes_All.csv", check.names = F, stringsAsFactors = F)

# replacing NA with empty cells
clean_Caught_Fishes_All[is.na(clean_Caught_Fishes_All)] = ""

write.csv(clean_Caught_Fishes_All, "../CLEAN_DATA/clean_Caught_Fishes_All.csv", row.names=FALSE)
```

```{r cleaning CCFRP_2020_sequencing.csv}
# reading file
CCFRP_2020_sequencing <- read.csv(file = "../DIRTY_DATA/CCFRP_2020_sequencing.csv", check.names = F, stringsAsFactors = F)

# renaming columns
CCFRP_2020_sequencing <- rename(CCFRP_2020_sequencing, MiSeq_Run_Date = "MiSeq Run/Date")
CCFRP_2020_sequencing <- rename(CCFRP_2020_sequencing, Sample_Name_MiSeq_run = "Sample name on MiSeq run")
CCFRP_2020_sequencing <- rename(CCFRP_2020_sequencing, Number_of_Read = "Number of reads")

# writing new csv file in clean folder
write.csv(CCFRP_2020_sequencing, "../CLEAN_DATA/clean_CCFRP_2020_sequencing.csv", row.names=FALSE)
clean_CCFRP_2020_sequencing <- read.csv(file = "../CLEAN_DATA/clean_CCFRP_2020_sequencing.csv", check.names = F, stringsAsFactors = F)

# replacing NA with empty cells
clean_CCFRP_2020_sequencing[is.na(clean_CCFRP_2020_sequencing)] = ""

write.csv(clean_CCFRP_2020_sequencing, "../CLEAN_DATA/clean_CCFRP_2020_sequencing.csv", row.names=FALSE)
```

```{r cleaning Drift_info_all.csv}
# reading file
Drift_info_all <- read.csv(file = "../DIRTY_DATA/Drift_info_all.csv", check.names = F, stringsAsFactors = F)

# renaming columns
Drift_info_all <- rename(Drift_info_all, Drift_ID = "Drift ID")
Drift_info_all <- rename(Drift_info_all, Trip_ID = "Trip ID")
Drift_info_all <- rename(Drift_info_all, ID_Cell_per_Trip = "ID Cell per Trip")
Drift_info_all <- rename(Drift_info_all, Grid_Cell_ID = "Grid Cell ID")
Drift_info_all <- rename(Drift_info_all, Site = "Site (MPA/ REF)")
Drift_info_all <- rename(Drift_info_all, Drift_Hold_Station = "Drifting or Holding Station")
Drift_info_all <- rename(Drift_info_all, Start_Time = "Start Time")
Drift_info_all <- rename(Drift_info_all, End_Time = "End Time")
Drift_info_all <- rename(Drift_info_all, Drift_Time_hrs = "Drift Time (hrs)")
Drift_info_all <- rename(Drift_info_all, BAR_fishing_time = "BAR (+/- mins) Fishing Time")
Drift_info_all <- rename(Drift_info_all, FLY_fishing_time = "FLY (+/- mins) Fishing Time")
Drift_info_all <- rename(Drift_info_all, BAT_fishing_time = "BAT (+/- mins) Fishing Time")
Drift_info_all <- rename(Drift_info_all, DPR_fishing_time = "DPR (+/- mins) Fishing Time")
Drift_info_all <- rename(Drift_info_all, SBT_fishing_time = "SBT (+/- mins) Fishing Time")
Drift_info_all <- rename(Drift_info_all, Total_Time_hrs = "Total (+/-) Time (hrs)")
Drift_info_all <- rename(Drift_info_all, Number_BAT_fishers = "Number of BAT fishers")
Drift_info_all <- rename(Drift_info_all, Number_FLY_fishers = "Number of FLY fishers")
Drift_info_all <- rename(Drift_info_all, Number_DPR_fishers = "Number of DPR fishers")
Drift_info_all <- rename(Drift_info_all, Number_SBT_fishers = "Number of SBT fishers")
Drift_info_all <- rename(Drift_info_all, Number_BAR_fishers = "Number of BAR fishers")
Drift_info_all <- rename(Drift_info_all, Total_Anglers_Fishing = "Total # Anglers Fishing")
Drift_info_all <- rename(Drift_info_all, Total_Angler_hrs = "Total Angler Hrs")
Drift_info_all <- rename(Drift_info_all, Start_GPS_Waypoint = "Start Lat/Lon GPS Waypoint")
Drift_info_all <- rename(Drift_info_all, Start_Waypoint_Link = "Start Lat/Lon waypoint_link")
Drift_info_all <- rename(Drift_info_all, End_GPS_Waypoint = "End Lat/Lon GPS Waypoint")
Drift_info_all <- rename(Drift_info_all, End_GPS_Waypoint_Link = "End Lat/Lon waypoint_link")
Drift_info_all <- rename(Drift_info_all, Drift_Length_m = "Drift Length (m)")
Drift_info_all <- rename(Drift_info_all, Tag_Crew = "Tag Crew")
Drift_info_all <- rename(Drift_info_all, Surface_T = "Surface T (instrument, C)")
Drift_info_all <- rename(Drift_info_all, Depth_T = "Depth T ( instrument, C)")
Drift_info_all <- rename(Drift_info_all, SWT_vessel_F = "SWT (vessel, F)")
Drift_info_all <- rename(Drift_info_all, Relief = "Relief (1-3)")
Drift_info_all <- rename(Drift_info_all, Start_Depth_ft = "Start Depth (ft)")
Drift_info_all <- rename(Drift_info_all, End_Depth_ft = "End Depth (ft)")
Drift_info_all <- rename(Drift_info_all, Lingcod_Bar_Weight_oz = "Lingcod Bar Weight (oz)")
Drift_info_all <- rename(Drift_info_all, Lead_Weight_oz = "Lead Weight (oz)")
Drift_info_all <- rename(Drift_info_all, SBT_Tail_Length_in = "SBT Tail Length (in)")
Drift_info_all <- rename(Drift_info_all, SBT_Head_Weight_oz = "SBT Head Weight (oz)")
Drift_info_all <- rename(Drift_info_all, Number_Seals = "# Seals")
Drift_info_all <- rename(Drift_info_all, Number_Sea_Lions = "# Sea Lions")
Drift_info_all <- rename(Drift_info_all, Total_Fishes_Caught = "Total Fishes Caught")
Drift_info_all <- rename(Drift_info_all, Cloud_Cover = "Cloud Cover (0-3)")
Drift_info_all <- rename(Drift_info_all, Wind_Speed_kt = "Obs Wind Speed (kt)")
Drift_info_all <- rename(Drift_info_all, Wind_Direction = "Obs Wind Direction")
Drift_info_all <- rename(Drift_info_all, Swell_Height_ft = "Obs Swell Height (ft)")
Drift_info_all <- rename(Drift_info_all, Secchi_Depth_m = "Secchi Depth (m)")
Drift_info_all <- rename(Drift_info_all, Trip_comments = "Comments")
Drift_info_all <- rename(Drift_info_all, Excluded_Drift_Comments = "Excluded Drift Comment")
Drift_info_all <- rename(Drift_info_all, Exclude_Gear_Specific_CPUE = "Exclude:Gear-Specific CPUE")

# writing new csv file in clean folder
write.csv(CCFRP_2020_sequencing, "../CLEAN_DATA/clean_CCFRP_2020_sequencing.csv", row.names=FALSE)
clean_CCFRP_2020_sequencing <- read.csv(file = "../CLEAN_DATA/clean_CCFRP_2020_sequencing.csv", check.names = F, stringsAsFactors = F)

```



