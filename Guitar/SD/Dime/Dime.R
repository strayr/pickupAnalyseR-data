###
# Each pickup needs one of these to define a report. This should be as short as possible and 
# contain no logic beyond defining a piuckup and printing some data
#
 

##
# Import needed libraries

libfolder<-"pickupAnalyseR"
source(paste(libfolder, 'sysCompPickup.R', sep="/"))
source(paste(libfolder, 'pickupComparisonCharts.R', sep = "/"))



##
# Load some pickup data. Expected are three .csv files from the SYSCOMP scope
# with the -LD.csv -UL.csv and -IT.csv suffixes

#I'm using my own pickup as the default for this template.

chartHeading = "Seymour Duncan Dimebucker"

pickupList = c(
  SysCompPickup(
    name = "Dime",
    manuf = "Seymour Duncan",
    mDCR = 17.17,
    tableBase = 'GuitarAnalysisData/CGM/SD/Dime/Dime',
    LDOffset=0,
    ULOffset=0
  ),
  SysCompPickup(
    name = "Dime GR",
    manuf = "Seymour Duncan",
    mDCR = 8.47,
    tableBase = 'GuitarAnalysisData/CGM/SD/Dime/DimeGR',
    ULOffset=0
  ),
  SysCompPickup(
    name = "Dime WB",
    manuf = "Seymour Duncan",
    mDCR = 8.71,
    tableBase = 'GuitarAnalysisData/CGM/SD/Dime/DimeWB',
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

