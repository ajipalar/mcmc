# Markov chain Monte Carlo (MCMC)

## Replica exchange Monte Carlo (parallel tempering)
### Overview
The program is designed to run replica exchange (RE) for a Stan model on a CPU compute cluster. The user should select the following.
hyper-parameters.
- The number of replicas
- The inverse temperature series
- The save rate
- The exchange attempt rate

### Implementation Notes
- An RE run is saved in its own directory.
- System configurations are written to disk.
- Only the "true" temperature is saved.
- Other temperatures are saved at the beginning and the end.
- Scores are saved for all temperatures.
- Systems are run independently on a single CPU core (no multi-threading).
- The model should be cached to avoid recompiling it.
- Exchange attempts are performed locally.
- SGE jobs are automatically resubmitted.
- If a job crashes sampling is paused, the chain can be rerun given initial positions.
- and the random seed.
- Exchange acceptances are written to their own file. 
- Should write a few bi-modal examples to test Stan.


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


