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

#I'm using my own pickup as the default for this template.

chartHeading = "Evolution Set"

pickupList = c(
  SysCompPickup(
    name = "Evolution Neck",
    manuf = "Straylight",
    mDCR = 12.36,
    tableBase = 'Guitar/DiMarzio/EVO/evoN/evoN',
    LDOffset=0,
    ULOffset=0
  ),
  SysCompPickup(
    name = "Evo Bridge Old",
    manuf = "Straylight",
    mDCR = 12.36,
    tableBase = 'Guitar/DiMarzio/EVO/evoB/EVO',
    LDOffset=0,
    ULOffset=0
  ),

  SysCompPickup(
    name = "Parallel",
    manuf = "Straylight",
    mDCR = 6.18,
    tableBase = 'Guitar/DiMarzio/EVO/evoN/evoN-parallel',
    LDOffset=0,
    ULOffset=0
  ),
  SysCompPickup(
    name = "Both HB",
    manuf = "Straylight",
    mDCR = 6.18,
    tableBase = 'Guitar/DiMarzio/EVO/pair/HB',
    LDOffset=0,
    ULOffset=0
  ),
  SysCompPickup(
    name = "Inside Coils",
    manuf = "Straylight",
    mDCR = 6.18,
    tableBase = 'Guitar/DiMarzio/EVO/pair/RB-erf',
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


