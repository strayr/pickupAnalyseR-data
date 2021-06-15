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

chartHeading = "Seymour Duncan DimebuckerTB-4 JB"

pickupList = c(
  SysCompPickup(
    name = "JB",
    manuf = "Seymour Duncan",
    mDCR = 7.19,
    tableBase = 'PublicData/Guitar/SD/TB4-JB/JB',
    LDOffset=0,
    ULOffset=0
  ),
  SysCompPickup(
    name = "JB Screws",
    manuf = "Seymour Duncan",
    mDCR = 3.60,
    tableBase = 'PublicData/Guitar/SD/TB4-JB/Screws',
    ULOffset=0
  ),
  SysCompPickup(
    name = "JB Slugs",
    manuf = "Seymour Duncan",
    mDCR = 3.59,
    tableBase = 'PublicData/Guitar/SD/TB4-JB/Slugs',
    ULOffset=0
  )
)

q=pickupList[[1]]
print (q$getRawPlot())

for (p in pickupList) {
  p$printData()
  #print (p$getRawPlot())
  print (p$getIntPlot(min=-70, max=-50))
  #print (p$getRelPlot())
}

print(loadedAbsPlot(
  pickupList,
  chartHeading = chartHeading,
  smoothing=0.05,
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

