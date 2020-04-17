###
# Each pickup needs one of these to define a report. This should be as short as possible and 
# contain no logic beyond defining a piuckup and printing some data
#


##
# Import needed libraries
source('sysCompPickup.R')
source('pickupComparisonCharts.R')

chartHeading = "Epiphone LP Set"

##
# Load some pickup data. Expected are three .csv files from the SYSCOMP scope
# with the -LD.csv -UL.csv and -IT.csv suffixes
pickupList = c(
  SysCompPickup(
    name = "Epi Neck",
    manuf = "Epiphone",
    mDCR = 15.49,
    tableBase = 'PublicData/Guitar/Epiphone/LP/neck'
  ),
  SysCompPickup(
    name = "Epi Bridge",
    manuf = "Epiphone",
    mDCR = 15.49,
    tableBase = 'PublicData/Guitar/Epiphone/LP/bridge'
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
    tableBase = 'PublicData/Guitar/DiMarzio/ToneZone/TZ'
   ),
  SysCompPickup(
    name = "Jazz",
    manuf = "Seymour Duncan",
    mDCR = 7.19,
    tableBase = 'PublicData/Guitar/SD/Jazz/Jazz',
    LDOffset=0,
    ULOffset=0
  ),
  # SysCompPickup(
  #   name = "Roadcore",
  #   manuf = "Ibanez",
  #   mDCR = 7.19,
  #   tableBase = 'PublicData/Guitar/Ibanez/RoadCore/roadcore_B',
  #   LDOffset=0,
  #   ULOffset=0
  # ),
    
  SysCompPickup(
    name = "498T",
    manuf = "Gibson",
    mDCR = 14.28,
    tableBase = 'PublicData/Guitar/Gibson/498T/498THBWG'
  ),
  SysCompPickup(
    name = "490R",
    manuf = "Gibson",
    mDCR = 14.28,
    tableBase = 'PublicData/Guitar/Gibson/490R/490R_HBBR'
  ),
# SysCompPickup(
#   name = "Air Norton",
#   manuf = "Dimarzio",
#   mDCR = 14.16,
#   tableBase = 'GuitarAnalysisData/CGM/Dimarzio/AirNorton/AirNorton'
#   ),


SysCompPickup(
  name = "P90",
  manuf = "Generic",
  mDCR = 10.6,
  tableBase = 'PublicData/Guitar/Generic/P90/P90'
  )
)

for (p in pickupList) {
  p$printData()
}


print(loadedAbsPlot(
  pickupList,
  chartHeading = chartHeading,
  smoothing=0.07,
  min = -75,
  max = -50
))
print(loadedRelPlot(
  pickupList,
  chartHeading = chartHeading,
  min = -6,
  smoothing=0.12,
  max = 2
))

print(unLoadedPlot(
  pickupList,
  chartHeading = chartHeading,
  min = -75,
  max = -50
))
