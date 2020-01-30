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

chartHeading = "Evolution Bridge"

pickupList = c(
  SysCompPickup(
    name = "Evolution Neck",
    manuf = "Straylight",
    mDCR = 12.36,
    tableBase = 'PrivateData/CGM/Dimarzio/EVO/evoN/evoN',
    LDOffset=0,
    ULOffset=0
  ),
  SysCompPickup(
    name = "Evo Bridge Old",
    manuf = "Straylight",
    mDCR = 12.36,
    tableBase = 'PrivateData/CGM/Dimarzio/EVO/OLD/EVO',
    LDOffset=0,
    ULOffset=0
  ),
  SysCompPickup(
    name = "Slugs",
    manuf = "Straylight",
    mDCR = 6.18,
    tableBase = 'PrivateData/CGM/Dimarzio/EVO/evoN/evoN-rb',
    LDOffset=0,
    ULOffset=0
  ),
  SysCompPickup(
    name = "Screws",
    manuf = "Straylight",
    mDCR = 7.19,
    tableBase = 'PrivateData/CGM/Dimarzio/EVO/evoN/evoN-wg',
    LDOffset=0,
    ULOffset=0
  ),
  SysCompPickup(
    name = "Slugs, grounded screws",
    manuf = "Straylight",
    mDCR = 6.18,
    tableBase = 'PrivateData/CGM/Dimarzio/EVO/evoN/evoN-erf-rb',
    LDOffset=0,
    ULOffset=0
  ),
  SysCompPickup(
    name = "Parallel",
    manuf = "Straylight",
    mDCR = 6.18,
    tableBase = 'PrivateData/CGM/Dimarzio/EVO/evoN/evoN-parallel',
    LDOffset=0,
    ULOffset=0
  )#,
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


