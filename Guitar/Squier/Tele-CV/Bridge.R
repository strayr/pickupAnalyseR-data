###
# Each pickup needs one of these to define a report. This should be as short as possible and
# contain no logic beyond defining a piuckup and printing some data
#

###
# User needs to set these

# Folder under working folder that bode data files are stored in. See README
#datafolder <- "PrivateData/CGM/Straylight/Humbucker/190026"

##
# Import needed libraries

libfolder <- "pickupAnalyseR-stable"
source(paste(libfolder,"sysCompPickup.R", sep = "/"))
source(paste(libfolder,"pickupComparisonCharts.R", sep = "/"))

##
# Load some pickup data. Expected are three .csv files from the SYSCOMP scope
# with the -LD.csv -UL.csv and -IT.csv suffixes

aPickup = SysCompPickup(
  name = "Tele CV Bridge",
  manuf = "Squier",
  mDCR = 7.35,
  tableBase = "Guitar/Squier/Tele-CV/bridge"
)

#aPickup$setFromFiles()

print (aPickup$getRawPlot())
print (aPickup$getIntPlot())
print (aPickup$getRelPlot())

aPickup$printData()



