# SVJ s-Channel Sample generation

Please downdload "DMsimp_s_spin1" and put it in your /path/MG5/models

UFO model: http://feynrules.irmp.ucl.ac.be/wiki/DMsimp

```
./bin/mg5_aMC
import model DMsimp_s_spin1
define j = g u c t d b s u~ c~ t~ d~ b~ s~  #we need 6 ? or 5?
MG5_aMC>generate p p > xd xd~ @0
MG5_aMC>add process p p > xd xd~ j @1
MG5_aMC>add process p p > xd xd~ j j @2
MG5_aMC>output sig_schannel
MG5_aMC>launch sig_schannel
```
then, you want to let samples showered by Pythia8 and pass the samples into Delphes for fast detector simulation.
```
/==============================================================================\
| 1. Choose the shower/hadronization program     shower = Pythia8              |
| 2. Choose the detector simulation program    detector = Delphes              |
| 3. Choose an analysis package (plot/convert) analysis = MadAnalysis5         |
| 4. Decay onshell particles                    madspin = OFF                  |
| 5. Add weights to events for new hypp.       reweight = Not Avail.           |
\==============================================================================/
```
Please make sure you let "shower = Pythia8" and "detector = Delphes".

*type 1 => "shower = Pythia8" 

*type 1 => "detector = Delphes"

Follow Haoran's precedure:

```
Another important thing to do is to change Particle Date Group(PDG) IDs of the dark particles in the LHE files for PYTHIA to be able to recognize and shower these properly.
You'll find a madevent_interface.py from your downloaded files under the path /sig_schannel/bin, use it to replace the defalut python script under the same path you generated.
What this do is to add a snippet of codes to swap PDG IDs by:
sed -i 's/5000521/4900101/g' <LHE filename>
```

Then, editing cards: run_card.dat, param_card.dat, pythia8_card.dat, delphes_card.dat #discuss the seting detail 

delphes_card

```
# Jet finder

set JetAlgorithm 6
set ParameterR 0.5

set JetPTMin 200.0

# Fat Jet finder

set JetPTMin 200.0

```

```
 === Results Summary for run: run_01 tag: tag_1 ===

     Cross-section :   101.7 +- 0.2502 pb
     Nb of events :  10000
     Pythia8 merged cross-sections are:
      > Merging scale = 45     : 45.366      +/- 0.0085  [pb]
      > Merging scale = 67.5   : 46.292      +/- 0.0086  [pb]
      > Merging scale = 90     : 46.393      +/- 0.0086  [pb]
```
