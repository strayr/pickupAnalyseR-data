###
# Each pickup needs one of these to define a report. This should be as short as possible and
# contain no logic beyond defining a piuckup and printing some data
#


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

chartHeading = "Seymour Duncan Dimebucker"

pickupList = c(
  SysCompPickup(
    name = "Jazz",
    manuf = "Seymour Duncan",
    mDCR = 7.19,
    tableBase = 'Guitar/SD/Jazz/Jazz',
    LDOffset=0,
    ULOffset=0
  ),
  SysCompPickup(
    name = "Jazz GR",
    manuf = "Seymour Duncan",
    mDCR = 3.60,
    tableBase = 'Guitar/SD/Jazz/JazzGR',
    ULOffset=0
  ),
  SysCompPickup(
    name = "Jazz WB",
    manuf = "Seymour Duncan",
    mDCR = 3.59,
    tableBase = 'Guitar/SD/Jazz/JazzBW',
    ULOffset=0
  )
)

q=pickupList[[1]]
print (q$getRawPlot())

for (p in pickupList) {
  p$printData()
  #print (p$getRawPlot())
  print (p$getIntPlot(min=-70, max=-55))
  #print (p$getRelPlot())
}

print(loadedAbsPlot(
  pickupList,
  chartHeading = chartHeading,
  smoothing=0.2,
  min = -70,
  max = -50
))

