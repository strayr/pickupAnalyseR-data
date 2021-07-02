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

chartHeading = "SD APH2 Comparison"

pickupList = c(
  SysCompPickup(
    name = "APH2 Neck",
    manuf = "Seymour Duncan",
    mDCR = 8.20,
    tableBase = 'PublicData/Guitar/SD/APH2/APH2N',
    LDOffset=0,
    ULOffset=0
  ),
  SysCompPickup(
    name = "APH2 Bridge",
    manuf = "Seymour Duncan",
    mDCR = 8.80,
    tableBase = 'PublicData/Guitar/SD/APH2/APH2B',
    LDOffset=0,
    ULOffset=0
  ),
  # SysCompPickup(
  #   name = "HZ Bridge",
  #   manuf = "EMG",
  #   mDCR = 12.36,
  #   tableBase = 'PublicData/Guitar/EMG/HZ/bridge',
  #   LDOffset=0,
  #   ULOffset=0
  # ),
  # SysCompPickup(
  #   name = "HZ Neck",
  #   manuf = "EMG",
  #   mDCR = 12.36,
  #   tableBase = 'PublicData/Guitar/EMG/HZ/neck',
  #   LDOffset=0,
  #   ULOffset=0
  # ),
   SysCompPickup(
     name = "Norton",
     manuf = "Dimarzio",
     mDCR = 14.16,
     tableBase = 'PublicData/Guitar/Dimarzio/AirNorton/AirNorton'
   ),
  # SysCompPickup(
  #   name = "Tone Zone",
  #   manuf = "Dimarzio",
  #   mDCR = 14.16,
  #   tableBase = 'PublicData/Guitar/Dimarzio/ToneZone/TZ'
  # ),
  # SysCompPickup(
  #   name = "EVO",
  #   manuf = "DiMarzio",
  #   mDCR = 14.16,
  #   tableBase = 'PublicData/Guitar/DiMarzio/EVO/evoB/EVO'
  # ),
   SysCompPickup(
     name = "Jazz",
     manuf = "Seymour Duncan",
     mDCR = 7.19,
     tableBase = 'PublicData/Guitar/SD/Jazz/Jazz',
     LDOffset=0,
     ULOffset=0
   ),
  SysCompPickup(
    name = "490R",
    manuf = "Gibson",
    mDCR = 14.28,
    tableBase = 'PublicData/Guitar/Gibson/490R/490R_HBBR',
    LDOffset=0,
    ULOffset=0
  ),
   # SysCompPickup(
   #   name = "RoadCore",
   #   manuf = "Ibanez",
   #   mDCR = 15.49,
   #   tableBase = 'PublicData/Guitar/Ibanez/Roadcore/roadcore_N'
   # ),
  # SysCompPickup(
  #   name = "V7",
  #   manuf = "Ibanez",
  #   mDCR = 15.49,
  #   tableBase = 'PublicData/Guitar/Ibanez/V7/V7b-GR'
  # ),
   SysCompPickup(
     name = "Super70",
     manuf = "Ibanez",
     mDCR = 15.49,
     tableBase = 'PublicData/Guitar/Ibanez/RocketRoll/S70'
   
  )#,
  # SysCompPickup(
  #   name = "Super 2",
  #   manuf = "Dimarzio",
  #   mDCR = 8.44,
  #   tableBase='PublicData/Guitar/Dimarzio/Super2/Super2'
  # )
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

