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
    name = "Satellite Neck",
    manuf = "Tokai",
    mDCR = 4.91,
    tableBase = 'Bass/Satellite/neck',
    LDOffset=0,
    ULOffset=0
  ),
  SysCompPickup(
    name = "Satellite Bridge",
    manuf = "Teisco",
    mDCR = 5.51,
    tableBase = 'Bass/Satellite/bridge',
    LDOffset=0,
    ULOffset=0
  ),
  SysCompPickup(
    name = "DX5 F",
    manuf = "Teisco",
    tableBase = 'Bass/Ibanez/DX5/DX5F',
    LDOffset=0,
    ULOffset=0
  ),
  SysCompPickup(
    name = "Powerspan F",
    manuf = "Ibanez",
    tableBase = 'Bass/Ibanez/PowerSpan/Neck-BW',
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
  min = -4,
  smoothing=0.05,
  max = 3
))

