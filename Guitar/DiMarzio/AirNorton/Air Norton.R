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

chartHeading = "DiMarzio Air Norton"


pickupList = c(
  SysCompPickup(
    name = "Air Norton",
    manuf = "Dimarzio",
    mDCR = 19.8,
    tableBase = ('PublicData/Guitar/DiMarzio/AirNorton/AirNorton')
  ),
  SysCompPickup(
    name = "Air Norton Screws",
    manuf = "Dimarzio",
    mDCR = 19.8,
    tableBase = ('PublicData/Guitar/DiMarzio/AirNorton/AirNorton-GW')
  ),
  SysCompPickup(
    name = "Air Norton Slugs", #This reading is really noisy
    manuf = "Dimarzio",
    mDCR = 19.8,
    tableBase = ('PublicData/Guitar/DiMarzio/AirNorton/AirNorton-RB')
  )
)


q=pickupList[[1]]
print (q$getRawPlot())

for (p in pickupList) {
  p$printData()
  print (p$getRawPlot())
  print (p$getIntPlot(min=-70, max=-50))
  #print (p$getRelPlot())
}

print(loadedAbsPlot(
  pickupList,
  chartHeading = chartHeading,
  smoothing=0.02,
  min = -70,
  max = -55
))




