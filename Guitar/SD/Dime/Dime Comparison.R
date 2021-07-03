#Explicitly call our library folder
libfolder <- "pickupAnalyseR-stable"
source(paste(libfolder,"sysCompPickup.R", sep = "/"))
source(paste(libfolder,"pickupComparisonCharts.R", sep = "/"))



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
    tableBase = 'Guitar/Ibanez/RocketRoll/V2'
  ),
  SysCompPickup(
    name = "Evolution",
    manuf = "DiMarzio",
    mDCR = 14.16,
    tableBase = 'Guitar/DiMarzio/EVO/evoB/EVO'
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
  #   tableBase = 'Guitar/X1/neat/X1B'
  # ),
  # SysCompPickup(
  #   name = "IBZ-B",
  #   manuf = "Dimarzio",
  #   mDCR = 14.16,
  #   tableBase = 'Guitar/DiMarzio/IBZ/IBZ-B'
  # ),
  SysCompPickup(
    name = "Tone Zone",
    manuf = "Dimarzio",
    mDCR = 14.16,
    tableBase = 'Guitar/Dimarzio/ToneZone/TZ'
   ),
  SysCompPickup(
    name = "498T",
    manuf = "Gibson",
    mDCR = 14.28,
    tableBase = 'Guitar/Gibson/498T/498THBWG'
  ),
# SysCompPickup(
#   name = "Air Norton",
#   manuf = "Dimarzio",
#   mDCR = 14.16,
#   tableBase = 'Guitar/Dimarzio/AirNorton/AirNorton'
#   ),
SysCompPickup(
  name = "Dimebucker",
  manuf = "Seymour Duncan",
  mDCR = 17.17,
  tableBase = 'Guitar/SD/Dime/Dime',
  LDOffset=0,
  ULOffset=0
)
# SysCompPickup(
#   name = "2112",
#   manuf = "Straylight",
#   mDCR = 19.8,
#   tableBase = 'Guitar/Straylight/Humbucker/P21/1212/21'
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
