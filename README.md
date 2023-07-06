# Markov chain Monte Carlo (MCMC)

- T(key, s) :: (key -> s -> s) a Markov transition kernel
- E(key, s1, s2) :: (key -> s -> s -> (s, s)) an exchange function 

## Replica exchange Monte Carlo (parallel tempering)
### Overview
Replica exchange Monte Carlo 

- n-replicas
- temperature-series
- save-every
- exchange-every
### Parts list
- $f(x)$ :: (x -> float) a scoring function
- $u(key, x)$ :: (k -> x -> x) an update function


## Replica exchange Monte Carlo (parallel tempering) using a Hamiltonian Monte Carlo Kernel

- 1. Compile a Stan model with an inverse temperate parameter that scales the log\_density function
- 2. M replicas of the system independently on a compute cluster, saving copies every so often
- 3. Write a python program that attempts a set of swaps 
- 3a. Beta is 1/Ti, kb is taken as 1
- 3b. U is the potential energy, the part of the Hamiltonian that does not involve momentum  
- 3c. A = min{1, exp(betai - betaj)(U(riN) - U(rjN))}
- 3d. Fix temperatures or iteratively solve them. 
- 3e. 20% mixing appears to be sufficient
- 3f.  
- 4. Analyze the trajectories in python

### References
- https://arxiv.org/pdf/physics/0508111.pdf


