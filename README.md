#MTO

##Reproduction and reanalysis of MTO Final Youth Survey analysis
---

This public repository contains all of the code and results supporting a reproduction and
reanalysis of the MTO PTSD results reported in by Kessler et al in their 2014 JAMA paper,
published by Norris & Wilson in F100Research in May 2016.

This README is intended to help Kessler et al, reviewers of our paper, and third parties
to examine, reproduce, criticize and even extend our work as they desire.

Our reanalysis depends greatly on code provided by others (whether by the original Kessler
team or by others at NBER), and this code has in places required small modifications by us,
for example to adapt it to local directory structures on our analytic workstations, or to
generalize it for bootstrapping purposes.  Because we checked in each such file initially
*exactly as we receieved it*, any modifications by us may be appreciated by using the
`git diff` command, as in the example below:

`git diff e91deac -- mto_jama_sas_code_20160114/1_mto_jama_impute_data_20160111.sas`

(Here, `e91deac` references the initial commmit of this NBER-provided file, as might
be discovered by a command like `git log --oneline <filepath> | tail -n 1`.)

## Directory Overview

`MTO_for_DNorris.zip`:

This is the original package of SAS code plus documentation provided by Nancy A. Sampson
on behalf of Dr. Ronald Kessler, in a 11/13/2014 email to David Norris

`/*`: The various files in this root directory are from MTO_for_DNorris.zip and subsequent
additional communications from Nancy A. Sampson.  As noted above, some of these have been
modified slightly to support our reanalysis.

`admin/`: License applications for the NCS-R and MTO data files used in this reanalysis.
These may be of interest to any 3rd party wishing to reproduce our reanalysis.  They also
provide early documentation of our analytic intent.

`doc/final_mental_health.pdf`: The footnote on p. 38 of this document first brought the PTSD
outcomes imputation of the 2014 JAMA paper to the attention of David Norris

`mto_jama_sas_code_20160114/`: Code and documentation provided in Jan 2016 by NBER's Matt Sciandra

`outputs/`: Strictly non-identifiable reanalysis output files including a few Figures

`reanalysis/`: SAS scripts developed for the reanalysis, the key starting point being `run_me.sas`

`theory/`: Various theoretical sketches, diagrams, and evolving plans
