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

#I'm using my own pickup as the default for this template.

chartHeading = "HZ Bridge"

pickupList = c(
  SysCompPickup(
    name = "HZ Bridge",
    manuf = "EMG",
    mDCR = 12.36,
    tableBase = 'PrivateData/CGM/EMG/HZ/bridge',
    LDOffset=0,
    ULOffset=0
  ),
  SysCompPickup(
    name = "Screws",
    manuf = "EMG",
    mDCR = 6.18,
    tableBase = 'PrivateData/CGM/EMG/HZ/bridge-rb',
    LDOffset=0,
    ULOffset=0
  ),
  SysCompPickup(
    name = "Slugs",
    manuf = "EMG",
    mDCR = 7.19,
    tableBase = 'PrivateData/CGM/EMG/HZ/bridge-gw',
    LDOffset=0,
    ULOffset=0
  )#,
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
  smoothing=0.2,
  min = -70,
  max = -50
))

