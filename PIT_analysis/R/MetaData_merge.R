#Name: Logan Breshears
#Agency: ODFW
#Created on (Date):10/29/2020
#Script contains code for: Merging metadata files into master list
#1. Merge Metadata Files




## ~~~~~~~~~~~~~~~~...............~~~~~~~~~~~~~~~~~~~~~~~...........
## ~~~~~~~~~~~~~~~~...............~~~~~~~~~~~~~~~~~~~~~~~...........
#1.Start: Data Merge
#Note: Merging PIT tag/Acoustic tag metadata files for Overshoot study

## ~~~ set working directory and read in .CSV file ~~~ ##
setwd("C:/Users/bresheal/Documents/KINGSTON/Grad School/IB599/John-Day-Steelhead-Overshoot/PIT_analysis")

#read in CRITFC metadata files
CRITFC.1 <- read.csv("C:/Users/bresheal/Documents/KINGSTON/Grad School/IB599/John-Day-Steelhead-Overshoot/PIT_analysis/R/Inputs/MetaData/TagFile_MetaData_CRITFC_07302020.csv", stringsAsFactors = FALSE)
CRITFC.2 <- read.csv("C:/Users/bresheal/Documents/KINGSTON/Grad School/IB599/John-Day-Steelhead-Overshoot/PIT_analysis/R/Inputs/MetaData/TagFile_MetaData_CRITFC_08132020.csv", stringsAsFactors = FALSE)
CRITFC.3 <- read.csv("C:/Users/bresheal/Documents/KINGSTON/Grad School/IB599/John-Day-Steelhead-Overshoot/PIT_analysis/R/Inputs/MetaData/TagFile_MetaData_CRITFC_08272020.csv", stringsAsFactors = FALSE)
CRITFC.4 <- read.csv("C:/Users/bresheal/Documents/KINGSTON/Grad School/IB599/John-Day-Steelhead-Overshoot/PIT_analysis/R/Inputs/MetaData/TagFile_MetaData_CRITFC_09272020.csv", stringsAsFactors = FALSE)

#read in ODFW metadata files
ODFW.1 <- read.csv("C:/Users/bresheal/Documents/KINGSTON/Grad School/IB599/John-Day-Steelhead-Overshoot/PIT_analysis/R/Inputs/MetaData/TagFile_MetaData_ODFW_07302020.csv", stringsAsFactors = FALSE)
ODFW.2 <- read.csv("C:/Users/bresheal/Documents/KINGSTON/Grad School/IB599/John-Day-Steelhead-Overshoot/PIT_analysis/R/Inputs/MetaData/TagFile_MetaData_ODFW_08132020.csv", stringsAsFactors = FALSE)
ODFW.3 <- read.csv("C:/Users/bresheal/Documents/KINGSTON/Grad School/IB599/John-Day-Steelhead-Overshoot/PIT_analysis/R/Inputs/MetaData/TagFile_MetaData_ODFW_08272020.csv", stringsAsFactors = FALSE)
ODFW.4 <- read.csv("C:/Users/bresheal/Documents/KINGSTON/Grad School/IB599/John-Day-Steelhead-Overshoot/PIT_analysis/R/Inputs/MetaData/TagFile_MetaData_ODFW_09272020.csv", stringsAsFactors = FALSE)

#create master dataframe
Meta_Master <- CRITFC.1

#rbind into master
Meta_Master <- rbind(CRITFC.1,
                     CRITFC.2,
                     CRITFC.3,
                     CRITFC.4,
                     ODFW.1,
                     ODFW.2,
                     ODFW.3,
                     ODFW.4)

#remove row 115 with NA
Meta_Master <- Meta_Master[-c(115),]

#remove any duplicate tag codes
library(dplyr)
Meta_Master %>% distinct(PIT.Tag, .keep_all = TRUE)

#write new .csv file
write.csv(Meta_Master,"C:/Users/bresheal/Documents/KINGSTON/Grad School/IB599/John-Day-Steelhead-Overshoot/PIT_analysis/R/Outputs/ODFW_AFFtagging_MetaData.csv", row.names = FALSE)

## ~~~ load packages ~~~ ##


## ~~~ Statistical analysis ~~~ ##


## ~~~ Create plots ~~~ ##
#test (validation checks)
