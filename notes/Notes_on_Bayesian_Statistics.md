Notes on Bayesian Statistics 
============================================

### Literate programming with [Literate.jl](https://fredrikekre.github.io/Literate.jl/v2/)
- The source file format for Literate is a regular, commented, julia (.jl) scripts. The idea is that the scripts also serve as documentation on their own 
- The basic syntax is simple:
    - lines starting with # are treated as markdown, (even if leading whitespace before #)
    - all other lines are treated as julia code.
    - lines beginning with ## are regular julia comments

#### Notes from [Introduction to Bayesian statistics, part 1: The basics concepts](https://www.youtube.com/watch?v=0F0QoMCSKJ4) StataCorp
- Can calculate, from Posterior Distribution
    - 95% Equal-tail Credible Interval
    - 95% Highest Posterior Density (HPD) Interval
        - drop a horizontal line until 95% of probability is included between intersection points where line intersects posterior distribution
        - same as 95% Equal-tail Credible Interval for a symmetric distribution, but not for an asymmetric dist
- Posterior distribution for previouys study can often serve as a Prior Dist fior subsequent study
- [Introduction to Bayesian statistics, part 2: MCMC and the Metropolis–Hastings algorithm](https://www.youtube.com/watch?v=OTO1DygELpY) StataCorp

- [An introduction to the Random Walk Metropolis algorithm](https://www.youtube.com/watch?v=U561HGMWjcw) Ben Lambert
    - Metropolis-Hastings is a 1st order Markov Chain Monte Carlo analysis
    - MCMC is "dependent sampling," that allow one to rely on just the numerator of Bayes Rule (i.e. $P(\theta | X ) \propto P(\theta) P(X|\theta))$, omitting $P(X)$
    - Common choice of proposal distribution is Normal, $\theta_t \sim N(\theta_{t-1}, \sigma)$
        - This is a "jumping distribution", or "proposal distribution" such that transition/jumping probabilities are symmetric $P(\theta_a ~to~ \theta_b) = P(\theta_b ~to~ \theta_a)$

- Metropolis–Hastings and other MCMC algorithms are generally used for sampling from multi-dimensional distributions, especially when the number of dimensions is high.
    - As a result, MCMC methods are often the methods of choice for producing samples from hierarchical Bayesian models and other high-dimensional statistical models used now in many disciplines
- The Metropolis–Hastings algorithm can draw samples from any probability distribution with probability density $P(x)$, provided that we know a function $f(x)$ proportional to the density $P$ and the values of $f(x)$ can be calculated. The requirement that $f(x)$ must only be proportional to the density, rather than exactly equal to it, makes the Metropolis–Hastings algorithm particularly useful, because calculating the necessary normalization factor is often extremely difficult in practice. 
- The sample values are produced iteratively, with the distribution of the next sample being dependent only on the current sample value (thus making the sequence of samples into a Markov chain).
- the Metropolis algorithm is a special case of the Metropolis–Hastings algorithm where the proposal function is symmetric
- In Metropolis Hasting:
    - Each value $\theta_t$ is drawn from an normal distribution with the mean equal to the previous value of $\theta$:
    $\theta_t \sim N(\theta_{t-1}, \sigma)$
    - If all samples were accepted, this would create something like a random walk
    - After the new proposed value $\theta_{new}$ is generated, MH has a step where the proposed sample value is accepted or rejected.
    $$r(\theta_{new}, \theta_{t-1}) = \frac {posterior~probability~of~\theta_{new}}{posterior~probability~of~\theta_{t-1}}$$
    $$r(\theta_{new}, \theta_{t-1}) = \frac {beta(1,1,\theta_{new}) \cdot binomial(n,y,\theta_{new})}{beta(1,1,\theta_{t-1}) \cdot binomial(n,y,\theta_{t-1})}$$
    - $Acceptance~probability = \alpha(\theta_{new}, \theta_{t-1}) \equiv min(r(\theta_{new}, \theta_{t-1}), 1)$
    - Always accept the new sample value if the posterior probability is greater for it than for the previous sample value, i.e. $r \ge 1$; otherwiseaccept it with probability equal to the ratio $r(\theta_{new}, \theta_{t-1})$
    - MH is run with a "burn-in" period of initial samples before the series of usable samples to reduce the dependence on the starting value
    - MH, like all MCMC chains, are subject to autocorrelation. If that is at a problematic level, the MCMC is "thinned" by only keeping each kth sample.

#### HMC Sampling for MCMC
- [The intuition behind the Hamiltonian Monte Carlo algorithm](https://www.youtube.com/watch?v=a-wydhEuAm0)

- Michael Betancourt ["A Conceptual Introduction to Hamiltonian Monte Carlo", 2018, ArXiv,](https://arxiv.org/pdf/1701.02434.pdf). 
- Radford Neal "MCMC using Hamiltonian dynamics", Chapter 5 in the "Handbook of Markov Chain Monte Carlo" by Brooks et al., 2011.
- This video is part of a lecture course which closely follows the book, "A Student's Guide to Bayesian Statistics", Ben Lambert, published by Sage, available on Amazon 
<https%3A%2F%2Fwww.amazon.co.uk%2FStudents-Guide-Bayesian-Statistics%2Fdp%2F1473916364>
- [A Student's Guide to Bayesian Statistics - Ben Lambert, playlist](https://www.youtube.com/playlist?list=PLwJRxp3blEvZ8AKMXOy0fc0cqT61GsKCG&disable_polymer=true) 75 lectures
- For more information on all things Bayesian, have a look at website:  
<https://ben-lambert.com/bayesian/>.