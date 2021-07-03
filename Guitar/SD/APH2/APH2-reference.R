###
# Each pickup needs one of these to define a report. This should be as short as possible and
# contain no logic beyond defining a piuckup and printing some data
#


#Explicitly call our library folder
libfolder <- "pickupAnalyseR-stable"
source(paste(libfolder,"sysCompPickup.R", sep = "/"))
source(paste(libfolder,"pickupComparisonCharts.R", sep = "/"))



##
# Load some pickup data. Expected are three .csv files from the SYSCOMP scope
# with the -LD.csv -UL.csv and -IT.csv suffixes

#I'm using my own pickup as the default for this template.

chartHeading = "SD APH2 Reference"

pickupList = c(
  SysCompPickup(
    name = "APH2 Neck",
    manuf = "Seymour Duncan",
    mDCR = 8.20,
    tableBase = 'Guitar/SD/APH2/APH2N',
    LDOffset=0,
    ULOffset=0
  ),
  SysCompPickup(
    name = "APH2 Bridge",
    manuf = "Seymour Duncan",
    mDCR = 8.80,
    tableBase = 'Guitar/SD/APH2/APH2B',
    LDOffset=0,
    ULOffset=0
  ),
  SysCompPickup(
    name = "EMG 81",
    manuf = "EMG",
    mDCR = 12.36,
    tableBase = 'Guitar/EMG/81/81-ACTIVE',
    LDOffset=0,
    ULOffset=0
  ),

   SysCompPickup(
     name = "EVO",
     manuf = "DiMarzio",
     mDCR = 14.16,
     tableBase = 'Guitar/DiMarzio/EVO/evoB/EVO'
   ),
  SysCompPickup(
    name = "JB",
    manuf = "Seymour Duncan",
    mDCR = 7.19,
    tableBase = 'Guitar/SD/TB4-JB/JB',
    LDOffset=0,
    ULOffset=0
  ),
   SysCompPickup(
     name = "Jazz",
     manuf = "Seymour Duncan",
     mDCR = 7.19,
     tableBase = 'Guitar/SD/Jazz/Jazz',
     LDOffset=0,
     ULOffset=0
   )

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
  min = -6,
  smoothing=0.05,
  max = 4
))

