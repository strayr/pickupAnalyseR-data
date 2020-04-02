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

chartHeading = "EMG81 VS Evolution"

pickupList = c(
  # SysCompPickup(
  #   name = "Evolution Neck",
  #   manuf = "DiMarzio",
  #   mDCR = 12.36,
  #   tableBase = 'PublicData/Guitar/DiMarzio/EVO/evoN/evoN',
  #   LDOffset=0,
  #   ULOffset=0
  # ),
  SysCompPickup(
    name = "Evolution",
    manuf = "DiMarzio",
    mDCR = 12.36,
    tableBase = 'PublicData/Guitar/DiMarzio/EVO/evoB/EVO',
    LDOffset=0,
    ULOffset=0
  ),
  
  SysCompPickup(
    name = "81",
    manuf = "EMG",
    mDCR = 6.18,
    tableBase = 'PublicData/Guitar/EMG/81/81-ACTIVE',
    LDOffset=0,
    ULOffset=0
  )#,
  # SysCompPickup(
  #   name = "81 passive load",
  #   manuf = "EMG",
  #   mDCR = 6.18,
  #   tableBase = 'PublicData/Guitar/EMG/81/81-PASSIVE',
  #   LDOffset=0,
  #   ULOffset=0
  # ),
  # SysCompPickup(
  #   name = "Inside Coils",
  #   manuf = "Straylight",
  #   mDCR = 6.18,
  #   tableBase = 'PublicData/Guitar/DiMarzio/EVO/pair/RB-erf',
  #   LDOffset=0,
  #   ULOffset=0
  # )#,
)

q=pickupList[[1]]
print (q$getRawPlot())

for (p in pickupList) {
  p$printData()
  print (p$getRawPlot())
  print (p$getIntPlot(min=-70, max=-45))
  #print (p$getRelPlot())
}

print(loadedAbsPlot(
  pickupList,
  chartHeading = chartHeading,
  chartHead2 = "loaded",
  smoothing=0.05,
  min = -70,
  max = -45
))

print(loadedRelPlot(
  pickupList,
  chartHeading = chartHeading,
  min = -4,
  smoothing=0.08,
  max = 4
))


