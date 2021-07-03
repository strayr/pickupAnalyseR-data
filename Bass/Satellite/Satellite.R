###
# Each pickup needs one of these to define a report. This should be as short as
# possible and contain no logic beyond defining a pickup and printing some data
#

#TODO fix detection of peaks in neck pickup

##
# Import needed libraries

#Explicitly call our library folder
libfolder <- "pickupAnalyseR-stable"
source(paste(libfolder,"sysCompPickup.R", sep = "/"))
source(paste(libfolder,"pickupComparisonCharts.R", sep = "/"))



##
# Load some pickup data. Expected are three .csv files from the SYSCOMP scope
# with the -LD.csv -UL.csv and -IT.csv suffixes

#I'm using my own pickup as the default for this template.

chartHeading <- "Satellite Bass"

pickupList = c(
  SysCompPickup(
    name = "Satellite Neck",
    manuf = "Teisco",
    mDCR = 4.91,
    tableBase = 'Bass/Satellite/neck',
    LDOffset=0,
    ULOffset=4
  ),
  SysCompPickup(
    name = "Satellite Bridge",
    manuf = "Teisco",
    mDCR = 5.51,
    tableBase = 'Bass/Satellite/bridge',
    LDOffset=0,
    ULOffset=4
  )
)

q <- pickupList[[2]]
print(q$getRawPlot())

for (p in pickupList){
  p$printData()
  #print (p$getRawPlot())
  print(p$getIntPlot(min = -70, max = -50))
  #print (p$getRelPlot())
}

print(loadedAbsPlot(
  pickupList,
  chartHeading = chartHeading,
  smoothing = 0.05,
  min = -70,
  max = -50
))

print(loadedRelPlot(
  pickupList,
  chartHeading = chartHeading,
  min = -4,
  smoothing = 0.08,
  max = 2
))
