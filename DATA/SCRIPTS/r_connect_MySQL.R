install.packages("RMySQL")
install.packages("yaml")

# 1. Library
library(RMySQL)
library(yaml)
config = yaml.load_file("config.yml")
CCFRP_config_source <- source("config.R")

# 2. creating table variables
CCFRP_waypoints_table <- 'waypoints'
CCFRP_reference_barcodes <- 'Reference_Barcodes'

# 3. Read data from db
CCFRP_db <-  dbConnect(MySQL(), 
                   user = config$CCFRP_db$db_user, 
                   password = config$CCFRP_db$db_password,
                   dbname = config$CCFRP_db$db_name, 
                   host = config$CCFRP_db$db_host, 
                   port = config$CCFRP_db$db_port)

# 4. Make a Query to select all from waypoints table 
select_all <- paste0("select * from ", CCFRP_waypoints_table) # concatenates sql statement with table
query <- dbSendQuery(CCFRP_db, select_all) # sends select_all query to mysql connection in reference to the database
waypoints_df <-  fetch(query, n = -1) # populates a data frame with the query

## more complicated query
create_jt <- paste0("create table", join_table_1, # 'join_table_1' not found, maybe this is not possible
                     "select genus, species, sequence from", 
                     CCFRP_reference_barcodes, 
                     collapse = " ") 
query <- dbSendQuery(CCFRP_db, create_jt) 
jt_df <-  fetch(query, n = -1) 

# 6. Exit the database
on.exit(dbDisconnect(CCFRP_db))