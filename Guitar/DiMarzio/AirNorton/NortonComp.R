#Test-Driver for pickup
libfolder <- "pickupAnalyseR"
source(paste(libfolder, 'sysCompPickup.R', sep = "/"))
source(paste(libfolder, 'pickupComparisonCharts.R', sep = "/"))

library(ggplot2)
library(ggpmisc)
library(scales)
library(purrr)
library(reshape2)


chartHeading = "Blaze vs 6-string high output"

##
# Load some pickup data. Expected are three .csv files from the SYSCOMP scope
# with the -LD.csv -UL.csv and -IT.csv suffixes
pickupList = c(
  SysCompPickup(
    name = "Air Norton",
    manuf = "Dimarzio",
    mDCR = 19.8,
    tableBase = 'GuitarAnalysisData/CGM/DiMarzio/AirNorton/AirNorton'
  ),
  SysCompPickup(name = "V2",
                manuf = "Ibanez",
                mDCR = 8.44,
                tableBase='GuitarAnalysisData/CGM/Ibanez/RocketRoll/V2'),
  # SysCompPickup(
  #   name = "Evolution (6)",
  #   manuf = "Dimarzio",
  #   mDCR = 14.16,
  #   tableBase = 'GuitarAnalysisData/CGM/DiMarzio/EVO/EVO'
  # ),
  SysCompPickup(
    name = "Tone Zone",
    manuf = "Dimarzio",
    mDCR = 14.16,
    tableBase = 'GuitarAnalysisData/CGM/DiMarzio/ToneZone/TZ'
  ),
  SysCompPickup(
    name = "IBZ RG Bridge",
    manuf = "Dimarzio",
    mDCR = 14.4,
    tableBase = 'GuitarAnalysisData/CGM/DiMarzio/IBZ/IBZ-B'
  )#,
  
  # SysCompPickup(
  #   name = "INF2 Bridge (6)",
  #   manuf = "Dimarzio",
  #   mDCR = 14.4,
  #   tableBase = 'GuitarAnalysisData/CGM/Ibanez/INF/INF2'
  # )
  #  SysCompPickup(
  #   name = "INF-7 Bridge",
  #   manuf = "Ibanez",
  #   mDCR = 8.44,
  #   tableBase = 'GuitarAnalysisData/CGM/Ibanez/GIO-7/GIO-7'
  # ),
  # SysCompPickup(
  #   name = "INF-7 Neck",
  #   manuf = "Ibanez",
  #   mDCR = 8.44,
  #   tableBase = 'GuitarAnalysisData/CGM/Ibanez/GIO-7/GIO-7N'
  # )
  # 
  
)






# print(loadedAbsPlot(
#   pickupList,
#   chartHeading = chartHeading,
#    min = -60,
#    max = 3
# ))
print(loadedRelPlot(
  pickupList,
  chartHeading = chartHeading,
  min = -4,
  max = 2
))
# 
# print(unLoadedPlot(
#   pickupList,
#   chartHeading = chartHeading
#   # min = -70,
#   # max = -50
# ))
