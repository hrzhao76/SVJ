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

Then, editing cards: run_card.dat, param_card.dat, pythia8_card.dat, delphes_card.dat #discuss the seting detail 


