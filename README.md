# pickupAnalyseR-data
This contains datasets for use with pickupAnalyser. They are measurements made of guitar pickups using a vector network analyser. The goal is to be able to accurately compare the frequency responses of these pickups to aid in choosing pickups and maybe in construction of new pickups.

# Usage
I have added a stable branch of my pickupAnalyser repo as a submodule so cloning this with github desktop should fetch a working version of the code this is using and I'm trying hard to keep my dev code out of my public analysis.

https://git-scm.com/book/en/v2/Git-Tools-Submodules
TODO: command line cloning

Install R studio, load an analysis for a pickup, source it, sort the R dependencies. sorry, there are a few.
Read the R for hints on how to make your own analysi files, they're pretty simple.

# What works
My R code in this repo should be good.

# What's missing
I can't programatically compare data from other sources that have used a hardware integrator YET.

# filename conventions 

The raw data files are of the form 
FOO-UL.csv #tested without load
FOO-LD.csv #tested with 200kOhm and 470pF load
FOO-IT.csv #tested with 100nF capacitor in order to calculate inductance.

Note also the infixes that may denote wire colour (WG,BR etc) or whether a coil in a humbucker has SLUG or SCREW poles.

