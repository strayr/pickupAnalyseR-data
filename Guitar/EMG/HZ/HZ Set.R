###
# Each pickup needs one of these to define a report. This should be as short as possible and 
# contain no logic beyond defining a piuckup and printing some data
#
 

##
# Import needed libraries
source('sysCompPickup.R')
source('pickupComparisonCharts.R')



##
# Load some pickup data. Expected are three .csv files from the SYSCOMP scope
# with the -LD.csv -UL.csv and -IT.csv suffixes

#I'm using my own pickup as the default for this template.

chartHeading = "EMG HZ Set"

pickupList = c(
  SysCompPickup(
    name = "HZ Bridge",
    manuf = "EMG",
    mDCR = 12.36,
    tableBase = 'PrivateData/CGM/EMG/HZ/bridge',
    LDOffset=0,
    ULOffset=0
  ),
  SysCompPickup(
    name = "HZ Neck",
    manuf = "EMG",
    mDCR = 12.36,
    tableBase = 'PrivateData/CGM/EMG/HZ/neck',
    LDOffset=0,
    ULOffset=0
  ),
  SysCompPickup(
    name = "Norton",
    manuf = "Dimarzio",
    mDCR = 14.16,
    tableBase = 'PrivateData/CGM/Dimarzio/AirNorton/AirNorton'
  ),
  SysCompPickup(
    name = "Tone Zone",
    manuf = "Dimarzio",
    mDCR = 14.16,
    tableBase = 'PrivateData/CGM/Dimarzio/ToneZone/TZ'
  ),
  SysCompPickup(
    name = "EVO",
    manuf = "DiMarzio",
    mDCR = 14.16,
    tableBase = 'PrivateData/CGM/Dimarzio/EVO/OLD/EVO'
  ),
  SysCompPickup(
    name = "Jazz",
    manuf = "Seymour Duncan",
    mDCR = 7.19,
    tableBase = 'PrivateData/CGM/SD/Jazz/Jazz',
    LDOffset=0,
    ULOffset=0
  ),
  SysCompPickup(
    name = "490R",
    manuf = "Gibson",
    mDCR = 14.28,
    tableBase = 'PrivateData/CGM/Gibson/490R/490R_HBBR',
    LDOffset=0,
    ULOffset=0
  )#,
)

# q=pickupList[[1]]
# print (q$getRawPlot())

for (p in pickupList) {
  p$printData()
  # print (p$getRawPlot())
  # print (p$getIntPlot(min=-70, max=-50))
  #print (p$getRelPlot())
}

print(loadedAbsPlot(
  pickupList,
  chartHeading = chartHeading,
  smoothing=0.2,
  min = -70,
  max = -50
))

print(loadedRelPlot(
  pickupList,
  chartHeading = chartHeading,
  min = -4,
  smoothing=0.05,
  max = 2
))

