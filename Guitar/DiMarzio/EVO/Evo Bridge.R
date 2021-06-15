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
    name = "Evolution Bridge 1",
    manuf = "DiMarzio",
    mDCR = 12.36,
    tableBase = 'PublicData/Guitar/DiMarzio/EVO/evoB/evo-hb',
    LDOffset=0,
    ULOffset=0
  ),
  SysCompPickup(
    name = "Evo Bridge 2",
    manuf = "DiMarzio",
    mDCR = 12.25,
    tableBase = 'PublicData/Guitar/DiMarzio/EVO/evoB/EVO',
    LDOffset=0,
    ULOffset=0
  ),
  SysCompPickup(
    name = "Slugs",
    manuf = "DiMarzio",
    mDCR = 6.18,
    tableBase = 'PublicData/Guitar/DiMarzio/EVO/evoB/evo-rb',
    LDOffset=0,
    ULOffset=0
  ),
  SysCompPickup(
    name = "Screws",
    manuf = "DiMarzio",
    mDCR = 7.19,
    tableBase = 'PublicData/Guitar/DiMarzio/EVO/evoB/evo-wg',
    LDOffset=0,
    ULOffset=0
  ),
  # SysCompPickup(
  #   name = "Slugs, grounded screws",
  #   manuf = "Straylight",
  #   mDCR = 6.18,
  #   tableBase = 'PublicData/Guitar/DiMarzio/EVO/evoB/evo-deadearth-rb',
  #   LDOffset=0,
  #   ULOffset=0
  # ),
  SysCompPickup(
    name = "Parallel",
    manuf = "DiMarzio",
    mDCR = 6.18,
    tableBase = 'PublicData/Guitar/DiMarzio//EVO/evoB/evo-parallel',
    LDOffset=0,
    ULOffset=0
  )#,
)

q=pickupList[[1]]
print (q$getRawPlot())

for (p in pickupList) {
  p$printData()
  #print (p$getRawPlot())
  print (p$getIntPlot(min=-75, max=-50))
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
  min = -30,
  smoothing=0.04,
  max = 4
))


