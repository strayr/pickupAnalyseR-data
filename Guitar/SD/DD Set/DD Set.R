###
# Each pickup needs one of these to define a report. This should be as short as possible and
# contain no logic beyond defining a piuckup and printing some data
#


##
#Explicitly call our library folder
libfolder <- "pickupAnalyseR-stable"
source(paste(libfolder,"sysCompPickup.R", sep = "/"))
source(paste(libfolder,"pickupComparisonCharts.R", sep = "/"))



##
# Load some pickup data. Expected are three .csv files from the SYSCOMP scope
# with the -LD.csv -UL.csv and -IT.csv suffixes


chartHeading = "Duncan Designed HB103"

pickupList = c(
  SysCompPickup(
    name = "HB103",
    manuf = "Seymour Duncan",
    mDCR = 7.19,
    tableBase = 'Guitar/SD/DD Set/HB103B/HB103B',
    LDOffset=0,
    ULOffset=0
  ),
  SysCompPickup(
    name = "JB",
    manuf = "Seymour Duncan",
    mDCR = 7.19,
    tableBase = 'Guitar/SD/TB4-JB/JB',
    LDOffset=0,
    ULOffset=0
  ),
  # SysCompPickup(
  #   name = "HZ Bridge",
  #   manuf = "EMG",
  #   mDCR = 12.36,
  #   tableBase = 'Guitar/EMG/HZ/bridge',
  #   LDOffset=0,
  #   ULOffset=0
  # ),
  # SysCompPickup(
  #   name = "HZ Neck",
  #   manuf = "EMG",
  #   mDCR = 12.36,
  #   tableBase = 'Guitar/EMG/HZ/neck',
  #   LDOffset=0,
  #   ULOffset=0
  # ),
  # SysCompPickup(
  #   name = "Norton",
  #   manuf = "Dimarzio",
  #   mDCR = 14.16,
  #   tableBase = 'Guitar/Dimarzio/AirNorton/AirNorton'
  # ),
  SysCompPickup(
    name = "Tone Zone",
    manuf = "Dimarzio",
    mDCR = 14.16,
    tableBase = 'Guitar/Dimarzio/ToneZone/TZ'
  ),
  SysCompPickup(
    name = "EVO",
    manuf = "DiMarzio",
    mDCR = 14.16,
    tableBase = 'Guitar/DiMarzio/EVO/evoB/EVO'
  ),
  # SysCompPickup(
  #   name = "Jazz",
  #   manuf = "Seymour Duncan",
  #   mDCR = 7.19,
  #   tableBase = 'Guitar/SD/Jazz/Jazz',
  #   LDOffset=0,
  #   ULOffset=0
  # ),
  SysCompPickup(
    name = "498T",
    manuf = "Gibson",
    mDCR = 14.28,
    tableBase = 'Guitar/Gibson/498T/498THBBR',
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

