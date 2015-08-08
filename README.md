MTO
===
Reproduction of MTO Final Youth Survey analysis

This file is to be used to collect instructions for steps in the reproduction
and forensic re-analysis of the MTO PTSD results reported in Kessler et al 2014
JAMA paper.  Each analytic step should be documented separately below, with the
sole aim of supporting reproduction of our full analysis by a third party.

A high-level overview of key files and subdirectories in this repository is to
be found (and maintained) at the very bottom of this file.  This is intended to
support an initial appreciation of the repository contents; brief descriptions
of individual files (or suitable groups thereof) should be given in the commit
message accompanying each initial commits.  Thus, a useful brief description of
any committed file should be available through the command:

 `git log -1 --pretty=%s <filename>`

## Reproduction

1. Step one
2. Step two
3. Step three

## Directory Overview

`MTO_for_DNorris.zip`:

This is the original package of SAS code plus documentation provided by Nancy
A. Sampson on behalf of Ronald Kessler, in a 11/13/2014 email to David Norris.

`doc/`: Contains various documents relating to the re-analysis, mainly from external
sources.

`img/`: Contains images for inline use on the project wiki.

`refs/`: Contains relevant literature cited on the project wiki.

`scripts/`: Contains SAS scripts developed for the reanalysis.

`outputs/`: Contains strictly non-identifiable reanalysis output files.

#### SAS Scripts and Outputs

`reanalysis.sas`: Sitting at the top level of our hierarchical script cascade; this script
invokes the 2nd-tier scripts in a 'Makefile'-like manner. The intent is to make our entire
re-analysis (or at least those parts of it done in SAS) reproducible by running this script.

`ptsd_imput_coefs_repro.sas`: Reproduces the NCSR logistic regression analysis that yields the
PTSD imputation model employed in [Kessler et al. 2014 JAMA](#Kessler-2014-JAMA).

`cohort_repro.sas`: Reproduces the cohort described in the Study Flow diagram of
[Kessler et al. 2014 JAMA](#Kessler-2014-JAMA).

`ptsd_imput_repro.sas`: Reproduces the original PTSD imputation itself; one important
output is a table of (`PPID`, `log_odds`, `rand01`, `imputed_PTSD[y/n]`) that will be
subjected to further analysis by David Norris (using R), with the intent to characterize
the predictive performance of the imputation model.

`voucher_ptsd_effects_repro.sas`: Reproduces the effects and confidence intervals reported
in Table 5 of [Kessler et al. 2014 JAMA](#Kessler-2014-JAMA).

`inner_loop.sas`: Implements the inner loop of a forensic analysis that abstracts away
several layers of arbitrariness immanent in the point estimates of voucher effects on PTSD
outcomes. This inner loop re-runs the `ptsd_imput_repro.sas` and
`voucher_ptsd_effects_repro.sas` scripts using many different random seed values for the
PTSD imputation. (The Kessler et al. analysis used the value 123456.) The output is a
table containing (`seed`, `beta_boys`, `beta_girls`), the `beta`s being coefficient
estimates for the voucher effect on PTSD, separately for boys and girls.

`outer_loop.sas`: Implements the outer loop of our forensic analysis, abstracting away the
arbitrariness associated with _overfitting_ of the PTSD imputation model. This outer loop
bootstrap-resamples this model from `ptsd_imput_coefs_repro.sas`, and then invokes the
`inner_loop.sas` script. The result is a 'table of tables' that can be collapsed to one
table with columns (`bootstrap_no`, `seed`, `beta_boys`, `beta_girls`).

`repro.html`: This output file collects results from the `*_repro.sas` scripts,
documenting the status specifically of the _reproduction_ part of the effort.

`forensics.html`: This output file collects results from the forensic analysis scripts,
documenting the status specifically of the _forensic re-analysis_ part of the effort.


