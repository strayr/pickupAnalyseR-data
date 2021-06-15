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

chartHeading = "Gibson 490R"

pickupList = c(
  SysCompPickup(
    name = "490R",
    manuf = "Gibson",
    mDCR = 14.28,
    tableBase = 'GuitarAnalysisData/CGM/Gibson/490R/490R_HBBR',
    LDOffset=0,
    ULOffset=0
  ),
  SysCompPickup(
    name = "490R Black Green",
    manuf = "Gibson",
    mDCR = 7.17,
    tableBase = 'GuitarAnalysisData/CGM/Gibson/490R/490R_GB',
    ULOffset=0
  ),
  SysCompPickup(
    name = "490R Red White",
    manuf = "Gibson",
    mDCR = 7.17,
    tableBase = 'GuitarAnalysisData/CGM/Gibson/490R/490R_WR',
    ULOffset=0
  )
)

q=pickupList[[1]]
print (q$getRawPlot())

for (p in pickupList) {
  p$printData()
  #print (p$getRawPlot())
  print (p$getIntPlot(min=-75, max=-55))
  #print (p$getRelPlot())
}

print(loadedAbsPlot(
  pickupList,
  chartHeading = chartHeading,
  smoothing=0.2,
  min = -70,
  max = -55
))

