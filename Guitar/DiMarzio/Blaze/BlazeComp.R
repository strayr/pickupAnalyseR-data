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

chartHeading = "MBlaze Comparison"

pickupList = c(
  SysCompPickup(
    name = "Blaze-Series",
    manuf = "DiMarzio",
    mDCR = 19.9,
    tableBase = 'PublicData/Guitar/DiMarzio/Blaze/Blaze'
  ),
  SysCompPickup(
    name = "Evo Bridge 2",
    manuf = "DiMarzio",
    mDCR = 12.25,
    tableBase = 'PublicData/Guitar/DiMarzio/EVO/evoB/EVO',
    LDOffset = 0,
    ULOffset = 0
  )
  
)

#Select plots from a single item
#q=pickupList[[1]]
#print (q$getRawPlot())

# Do this for individual pickups to check data is good before relying
# on comparison charts and calculated readings.
#Generates many individual charts, code in comments may be unmaintained
#check HumbuckerExample for the latest
# for (p in pickupList) {
#   p$printData()
#
#   # mostly for confirming peak measurements
#   print (p$getRawPlot())
#
#   #Shows response with -20db/decade filter compensating for driver coil
#   # arrangement, measurments made here shown in solid line, dotted lines are
#   # raw peaks
#   print (p$getIntPlot(min=-80, max=-50))
#
#   # shows frequency response normalised to 0dB for comparison of frequency
#   # response with other pickups, cutoff frequency should be at -3dB on plot
#     print (p$getRelPlot())
#
# }

#From pickup comparison charts
#Compare output of all pickups in list
print(
  loadedAbsPlot(
    pickupList,
    chartHeading = chartHeading,
    smoothing = 0.05,
    #keep small, 0.05 often good
    min = -70,
    max = -50
  )
)
# compare frequency responses, the is chart we really want
print(
  loadedRelPlot(
    pickupList,
    chartHeading = chartHeading,
    min = -4,
    smoothing = 0.08,
    #keep small, 0.05 often good
    max = 4
  )
)
