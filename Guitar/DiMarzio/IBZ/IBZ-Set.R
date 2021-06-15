#Test-Driver for pickup
source('pickup.R')

library(ggplot2)
library(ggpmisc)
library(scales)
library(purrr)
library(reshape2)


smoothing <- 0.07

chartHeading = "IBZ Set"

##
# Load some pickup data. Expected are three .csv files from the SYSCOMP scope
# with the -LD.csv -UL.csv and -IT.csv suffixes
pickupList = c(
  Pickup(name = "IBZ RG Neck",
         manuf = "DiMarzio",
         mDCR = 8.90,
         tableBase='CSV/IBZ/IBZ-N'),
  Pickup(name = "IBZ RG Bridge",
         manuf = "Dimarzio",
         mDCR = 14.4,
         tableBase='csv/IBZ/IBZ-B')
         
  
)

for (p in pickupList) {
  p$setFromFiles()
}

map(pickupList, ~ .x$setFromFiles())


# ) <- Pickup(name = "Ibanez V2",
#             manuf = "Maxxon",
#             mDCR = 15.49,
#             tableBase='csv/20180717/V2')
#
# pA$setFromFiles()
#
# pB<- Pickup(name = "EVO",
#              manuf = "DiMarzio",
#              mDCR = 14.16,
#             tableBase='csv/20180717/EVO')
#
# pB$setFromFiles()

# pB <- Pickup(name = "Z2",
#              manuf = "Straylight",
#              mDCR = 13.8)
#
# pB$setFromFiles('csv/20180720/P19-setscrew')

for (p in pickupList) {
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
}

meltedLoad=melt(map(pickupList, ~ .x$preMergeLoaded() ), id.vars="Freq", variable.name="pickupName")
meltedUL=melt(map(pickupList, ~ .x$preMergeUL() ), id.vars="Freq", variable.name="pickupName")


loadedPlot = ggplot(meltedLoad, aes(Freq,value)) +
  geom_smooth(mapping = aes(colour=pickupName) , span = smoothing) +
  scale_x_log10(minor_breaks = log10_minor_break()) +
  theme(
    panel.grid.major.x = element_line(size = 0.1),
    panel.grid.minor.x = element_line(size = 0.2)
  ) +
  ylim(-10, 6) +
  labs(title=paste(chartHeading,"- loaded 200k 470pf"), x="Frequency /Hz", y="Magnetude /dB (-20db/Decade)", color="Pickup")

ULPlot = ggplot(meltedUL, aes(Freq,value)) +
  geom_smooth(mapping = aes(colour=pickupName) , span = smoothing) +
  scale_x_log10(minor_breaks = log10_minor_break()) +
  theme(
    panel.grid.major.x = element_line(size = 0.1),
    panel.grid.minor.x = element_line(size = 0.2)
  ) +
  ylim(-10, 6) +
  labs(title=paste(chartHeading,"- unloaded"), x="Frequency /Hz", y="Magnetude /dB (-20db/Decade)", color="Pickup")
print(loadedPlot)
print(ULPlot)
