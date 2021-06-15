###
# Each pickup needs one of these to define a report. This should be as short as possible and 
# contain no logic beyond defining a piuckup and printing some data
#

##
# Import needed libraries
source('pickup.R')



##
# Load some pickup data. Expected are three .csv files from the SYSCOMP scope
# with the -LD.csv -UL.csv and -IT.csv suffixes

#I'm using my own pickup as the default for this template.

aPickup=Pickup(name = "IBZ RG Bridge",
               manuf = "DiMarzio",
               mDCR = 14.40,
               tableBase='CSV/IBZ/IBZ-B')
aPickup$setFromFiles()

print (aPickup$getRawPlot())
print (aPickup$getPlot())

#TODO unloaded plot for pedants

p <- aPickup
  
print(paste(p$manuf, p$name))
print(paste(
  "Calculated Inductance:",
  prettyNum(p$getInd(), format = "fg", digits = 3),
  "H"
))
print(paste(
  "Calculated Capacitance:",
  prettyNum(p$getCap(), format = "fg", digits = 3),
  "pF"
))
print(paste(
  "Loaded Cutoff:",
  prettyNum(p$getLDCutoff(), format = "fg", digits = 3),
  "Hz"
))
print(paste(
  "Loaded Resonant Peak:",
  prettyNum(tail(p$loaded[findPeaks(as.matrix(p$loaded)[, 4]), "Freq"], 1), format = "fg", digits = 3),
  "Hz",
  prettyNum(tail(p$loaded[findPeaks(as.matrix(p$loaded)[, 4]), "smIntMag"], 1), format = "fg", digits = 3),
  "dB"
))
print(paste(
  "Raw Loaded Peak:",
  prettyNum(p$getLdRawPeak()$freq, format = "fg", digits = 3),
  "Hz",
  prettyNum(p$getLdRawPeak()$mag, format = "fg", digits = 3),
  "dB"
))
print(paste(
  "Unloaded Cutoff:",
  prettyNum(p$getULCutoff(), format = "fg", digits = 3),
  "Hz"
))
print(paste(
  "Unloaded Resonant Peak:",
  prettyNum(tail(p$unloaded[findPeaks(as.matrix(p$unloaded)[, 4]), "Freq"], 1), format = "fg", digits = 3),
  "Hz",
  prettyNum(tail(p$unloaded[findPeaks(as.matrix(p$unloaded)[, 4]), "smIntMag"], 1), format = "fg", digits = 3),
  "dB"
))
print(paste(
  "Raw Unloaded Peak:",
  prettyNum(p$getUlRawPeak()$freq, format = "fg", digits = 3),
  "Hz",
  prettyNum(p$getUlRawPeak()$mag, format = "fg", digits = 3),
  "dB"
))
print(paste(
  "Raw Induction Peak:",
  prettyNum(p$getIndRawPeak()$freq, format = "fg", digits = 3),
  "Hz",
  prettyNum(p$getIndRawPeak()$mag, format = "fg", digits = 3),
  "dB"
))
