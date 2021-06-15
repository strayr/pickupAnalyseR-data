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

chartHeading = "Gibson 498T"

pickupList = c(
  SysCompPickup(
    name = "498T",
    manuf = "Gibson",
    mDCR = 14.28,
    tableBase = 'PublicData/Guitar/Gibson/498T/498THBWG',
    LDOffset=0,
    ULOffset=2
  ),
  # SysCompPickup(
  #   name = "498T Noofset",
  #   manuf = "Gibson",
  #   mDCR = 14.28,
  #   tableBase = 'GuitarAnalysisData/CGM/Gibson/498THBWG'
  # )
  # SysCompPickup(
  #   name = "498T Reversed",
  #   manuf = "Gibson",
  #   mDCR = 14.28,
  #   tableBase = 'GuitarAnalysisData/CGM/Gibson/498THBBR'
  # ),
  SysCompPickup(
    name = "498T Black Green",
    manuf = "Gibson",
    mDCR = 7.17,
    tableBase = 'PublicData/Guitar/Gibson/498T/498TGB',
    ULOffset=2
  ),
  RW = SysCompPickup(
    name = "498T Red White",
    manuf = "Gibson",
    mDCR = 7.17,
    tableBase = 'PublicData/Guitar/Gibson/498T/498TWR',
    ULOffset=1
  )
)

q=pickupList[[1]]
print (q$getRawPlot())

for (p in pickupList) {
  p$printData()
  #print (p$getRawPlot())
  print (p$getIntPlot())
  #print (p$getRelPlot())
}

print(loadedAbsPlot(
  pickupList,
  chartHeading = chartHeading,
  smoothing=0.2,
  min = -65,
  max = -50
))

