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

chartHeading = "SteamHammer Bridge"

pickupList = c(
  SysCompPickup(
    name = "SteamHammer",
    manuf = "IronGear",
    mDCR = 12.36,
    tableBase = 'PublicData/Guitar/IronGear/SteamHammer/SteamHammer',
    LDOffset=0,
    ULOffset=0
  ),
  # SysCompPickup(
  #   name = "Evo Bridge 2",
  #   manuf = "DiMarzio",
  #   mDCR = 12.25,
  #   tableBase = 'PublicData/Guitar/DiMarzio/EVO/evoB/EVO',
  #   LDOffset=0,
  #   ULOffset=0
  # ),
  SysCompPickup(
    name = "SuperDistortion",
    manuf = "DiMarzio",
    mDCR = 12.25,
    tableBase = 'PublicData/Guitar/DiMarzio/IBZ/IBZ-B',
    LDOffset=0,
    ULOffset=0
  )#,
  # SysCompPickup(
  #   name = "SteamHammer north",
  #   manuf = "IronGear",
  #   mDCR = 12.36,
  #   tableBase = 'PublicData/Guitar/IronGear/SteamHammer/SteamHammerRed',
  #   LDOffset=0,
  #   ULOffset=0
  # ),
  # SysCompPickup(
  #   name = "SteamHammer South",
  #   manuf = "IronGear",
  #   mDCR = 12.36,
  #   tableBase = 'PublicData/Guitar/IronGear/SteamHammer/SteamHammerBlack',
  #   LDOffset=0,
  #   ULOffset=0
  # )#,
  
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
  min = -5,
  smoothing=0.04,
  max = 4
))


