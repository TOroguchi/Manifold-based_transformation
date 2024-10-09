# Manifold-based transformation of probability density distribution
This is the depository for manifold-based transformation of probability density distribution (PDD). 
The data for numerical simulation, in which protein conformational ensembles are reconstructed from small-angle X-ray solution (SAXS) scattering data, are also included. 

## Getting started
### Installation

・Move to the 'src' diectory.

・Write the FORTRAN version you use inside the 'Makefile'.

・Execute 'make'.

・Add the path to the 'src' directory.


### Data for simulation
・/data/pdd_data: Close and open ensembles of transferrin as PDDs on Rcm  

・/data/state_saxs_data: SAXS data calculated for each state on Rcm

・/data/pseudo_exp_data: Pseudo-experimental SAXS data for close and open ensembles


### Example runs
The documation file for input file is also placed in this directory.

・/example/eq2: Optimization using Eq. (2)

・/example/eq17: Optimization using Eq. (17)

・/example/eq18: Optimization using Eq. (18)



