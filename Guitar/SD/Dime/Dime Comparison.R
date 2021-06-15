libfolder <- "pickupAnalyseR"
source(paste(libfolder, 'sysCompPickup.R', sep = "/"))
source(paste(libfolder, 'pickupComparisonCharts.R', sep = "/"))



smoothing <- 0.07

chartHeading = "Bridge Pickups"

##
# Load some pickup data. Expected are three .csv files from the SYSCOMP scope
# with the -LD.csv -UL.csv and -IT.csv suffixes
pickupList = c(
  SysCompPickup(
    name = "Ibanez V2",
    manuf = "Maxxon",
    mDCR = 15.49,
    tableBase = 'GuitarAnalysisData/CGM/Ibanez/RocketRoll/V2'
  ),
  SysCompPickup(
    name = "Evolution",
    manuf = "DiMarzio",
    mDCR = 14.16,
    tableBase = 'GuitarAnalysisData/CGM/Dimarzio/EVO/EVO'
  ),
  # Pickup(
  #   name = "P19",
  #   manuf = "Straylight",
  #   mDCR = 15.49,
  #   tableBase = 'csv/20180720/P19-setscrew'
  # ),
  # SysCompPickup(
  #   name = "X1",
  #   manuf = "Maverick",
  #   mDCR = 14.16,
  #   tableBase = 'GuitarAnalysisData/CGM/X1/neat/X1B'
  # ),
  # SysCompPickup(
  #   name = "IBZ-B",
  #   manuf = "Dimarzio",
  #   mDCR = 14.16,
  #   tableBase = 'GuitarAnalysisData/CGM/DiMarzio/IBZ/IBZ-B'
  # ),
  SysCompPickup(
    name = "Tone Zone",
    manuf = "Dimarzio",
    mDCR = 14.16,
    tableBase = 'GuitarAnalysisData/CGM/Dimarzio/ToneZone/TZ'
   ),
  SysCompPickup(
    name = "498T",
    manuf = "Gibson",
    mDCR = 14.28,
    tableBase = 'GuitarAnalysisData/CGM/Gibson/498T/498THBWG'
  ),
# SysCompPickup(
#   name = "Air Norton",
#   manuf = "Dimarzio",
#   mDCR = 14.16,
#   tableBase = 'GuitarAnalysisData/CGM/Dimarzio/AirNorton/AirNorton'
#   ),
SysCompPickup(
  name = "Dimebucker",
  manuf = "Seymour Duncan",
  mDCR = 17.17,
  tableBase = 'GuitarAnalysisData/CGM/SD/Dime/Dime',
  LDOffset=0,
  ULOffset=0
)
# SysCompPickup(
#   name = "2112",
#   manuf = "Straylight",
#   mDCR = 19.8,
#   tableBase = 'GuitarAnalysisData/CGM/Straylight/Humbucker/P21/1212/21'
#   )
)

for (p in pickupList) {
  p$printData()
}


print(loadedAbsPlot(
  pickupList,
  chartHeading = chartHeading,
  smoothing=0.2,
  min = -65,
  max = --50
))
print(loadedRelPlot(
  pickupList,
  chartHeading = chartHeading,
  min = -4,
  smoothing=0.2,
  max = 2
))

print(unLoadedPlot(
  pickupList,
  chartHeading = chartHeading,
  min = -60,
  max = -45
))
