#Test-Driver for pickup
libfolder <- "pickupAnalyseR"
source(paste(libfolder, 'sysCompPickup.R', sep = "/"))
source(paste(libfolder, 'pickupComparisonCharts.R', sep = "/"))




smoothing <- 0.07

chartHeading = "Gibson 490R and 498T"

##
# Load some pickup data. Expected are three .csv files from the SYSCOMP scope
# with the -LD.csv -UL.csv and -IT.csv suffixes
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
    name = "498T",
    manuf = "Gibson",
    mDCR = 14.28,
    tableBase = 'GuitarAnalysisData/CGM/Gibson/498T/498THBWG',
    LDOffset=0,
    ULOffset=2
  )
  
)

for (p in pickupList) {
  p$printData()
}


print(loadedAbsPlot(
  pickupList,
  chartHeading = chartHeading,
  smoothing=0.2,
  min = -65,
  max = -55
))
print(loadedRelPlot(
  pickupList,
  chartHeading = chartHeading,
  min = -4,
  smoothing=0.2,
   max = 2
))

print(unLoadedPlot(
  pickupList,
  chartHeading = chartHeading
  # min = -70,
  # max = -50
))
