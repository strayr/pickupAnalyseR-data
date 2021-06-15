###
# Each pickup needs one of these to define a report. This should be as short as possible and 
# contain no logic beyond defining a piuckup and printing some data
#
 

##
# Import needed libraries

#libfolder<-"pickupAnalyseR"
source('sysCompPickup.R')
source('pickupComparisonCharts.R')



##
# Load some pickup data. Expected are three .csv files from the SYSCOMP scope
# with the -LD.csv -UL.csv and -IT.csv suffixes

#I'm using my own pickup as the default for this template.

chartHeading = "Seymour Duncan Dimebucker"

pickupList = c(
   SysCompPickup(
    name = "JB",
    manuf = "Seymour Duncan",
    mDCR = 7.19,
    tableBase = 'PublicData/Guitar/SD/TB4/JB2',
    LDOffset=0,
    ULOffset=0
  ),
  SysCompPickup(
    name = "498T",
    manuf = "Gibson",
    mDCR = 14.28,
    tableBase = 'PublicData/Guitar/Gibson/498T/498THBWG',
    LDOffset=0,
    ULOffset=2
  ),
  SysCompPickup(
  name = "HB103",
  manuf = "Seymour Duncan",
  mDCR = 7.19,
  tableBase = 'PublicData/Guitar/SD/DD Set/HB103B/HB103B',
  LDOffset=0,
  ULOffset=0
  ),
  SysCompPickup(
    name = "Evolution Bridge",
    manuf = "Straylight",
    mDCR = 12.36,
    tableBase = 'PublicData/Guitar/Dimarzio/EVO/evoB/EVO',
    LDOffset=0,
    ULOffset=0
  ),
  SysCompPickup(
    name = "Dime",
    manuf = "Seymour Duncan",
    mDCR = 17.17,
    tableBase = 'PublicData/Guitar/SD/Dime/Dime',
    LDOffset=0,
    ULOffset=0
  )

)

q=pickupList[[1]]
print (q$getRawPlot())

for (p in pickupList) {
  p$printData()
  #print (p$getRawPlot())
  print (p$getIntPlot(min=-65, max=-45))
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
  smoothing=0.08,
  max = 4
))