Notes on Bayesian Statistics with Turing and Julia
===================================================

- Notes compiled by Paul Leiby
- Last modified: 2023-02-23

- Source: Storopoli (2021). [Bayesian Statistics with Julia and Turing.](https://storopoli.github.io/Bayesian-Julia) José Eduardo Storopoli


## Bayesian Statistics - Overview

> Bayesian statistics is an approach to inferential statistics based on Bayes' theorem, where available knowledge about parameters in a statistical model is updated with the information in observed data. The background knowledge is expressed as a prior distribution and combined with observational data in the form of a likelihood function to determine the posterior distribution.

The model:

$$P(θ∣y) = \frac {P(y∣θ) \cdot P(θ)} {P(y)}$$


- P(θ∣y): Posterior
- P(y∣θ): Likelihood
- P(θ): Prior
- P(y): Normalizing Constant,

i.e. 

Posterior = Likelihood * Prior / Normalizing Constant

where:

- θ = parameter(s) of interest;
- y = observed data;
- Prior = previous probability of the parameter value(s)θ;
- Likelihood = probability of the observed data yy conditioned on the parameter value(s) θ;
- Posterior = posterior probability of the parameter value(s) θθ after observing the data y; and
- Normalizing Constant = P(y)
    - This probability can be interpreted as a normalizing factor so that the result of P(y∣θ)P(θ) is somewhere between 0 and 1, a valid probability by the axioms.

> For the frequentist approach, the sample [the observed data] is uncertain. Thus, we can only make probabilistic conjectures about our sample. Therefore, the uncertainty is expressed in the probability that I will obtain data similar to those that I obtained if I sampled from a population of interest infinite samples of the same size as my sample.

> for reasons of ease of computation, since most of these [frequentist] methods were invented in the first half of the 20th century (without any help of a computer), only the parameter value(s) that maximize(s) the likelihood function is(are) computed. From this optimization process we extracted the mode of the likelihood function (i.e. maximum value). The maximum likelihood estimate (MLE) is(are) the parameter value(s) so that a N-sized sample randomly sampled from a population (i.e. the data you've collected) is the most likely N-sized sample from that population. ... In other words, we are conditioning the parameter value(s) on the observed data from the assumption that we are sampling infinite NN-sized samples from a theoretical population and treating the parameter values as fixed and our sample as random (or uncertain).

> What we see today in the monopoly of the Neyman-Pearson paradigm (Neyman & Pearson, 1933) with pp-values ​​and null hypotheses the result of this Fisherian effort to silence critics and let only his voice echo. 

- The MLE estimate (focusing on the mode of the likelihood function) is most appropriate for the (very) restrictive case of normally distributed data, in which case the distribution mode = median = mean. More generally, this is not the case.

- Note that the frequentist approach of MLE is distinct from "approximating or estimating a complete likelihood density," possible with the Bayesian approach.

- In Frequentist (NHST) approaches, developed when computational capabilities were more limited, it was "much easier to use strong assumptions about the data to get a value from a statistical estimation using mathematical derivations than to calculate the statistical estimation by hand without depending on such assumptions."

    - Example assumptions, e.g. for the Students t-test of the difference between the means of a parameter for two samples:
        - 1. that the parameter of interest is normally distributed (assumption 1 – normality of the dependent variable),
        - 2. that the parameter of interest varies homogeneously between groups (assumption 2 – homoskedasticity, homogeneity of the variances of the parameter for the two sample groups), and 
        - 3. that the number of observations in the two groups are similar (assumption 3 – homogeneity of the size of the groups)

#### p-values
- "p-value is the probability of obtaining test results at least as extreme as the results actually observed, under the assumption that the null hypothesis is correct."
    - p-values are related to observed data and a test based on that, not a theory or hypothesis
    - "...at least as extreme as the results actually observed..." requires defining a probability threshold for extremeness or relevance
    - "... under the assumption that the null hypothesis is correct.": every statistical test that has a p-value has a null hypothesis, associated with a "null effect." Important to ask/keep-in-mind what that H0 is for that test.
- "p-value is the probability of the data $D^*$ you obtained given that the null hypothesis is true."
    - $p = P(D^* ∣ H_0)$
    - "p-value is the probability of $D^*$ conditioned to $H_0$​"
-  p-values say something about data and not hypotheses. [at least not directly]
    - p-value is not the probability of the null hypothesis (given the data)
        - Famous confusion between $P(D ∣ H_0)$ and $P(H_0 ∣ D)$. 
    - "p-value does not say anything about the size of the effect. Just about whether the observed data differs from what is expected under the null hypothesis."

#### Confidence Intervals (Frequentist) vs Credible Intervals (Bayesian)
- definition of confidence intervals:
    - "An X% confidence interval for a parameter θ is an interval (L,U) generated by a procedure that in repeated sampling has an X% probability of containing the true value of θ, for all possible values of θ."
    - Jerzy Neyman, the "father" of confidence intervals (see figure below) (Neyman, 1937). 
- credibility interval
    - Bayesian statistics have a concept similar to the confidence intervals of frequentist statistics. This concept is called credibility interval. And, unlike the confidence interval, its definition is intuitive.
    - credibility interval "is basically a 'slice' of the posterior probability of the parameter, restricted to a certain level of certainty"
    - Note: for highly asymmetric or bimodal distributions, the credibility interval may not contain the mode

#### Example of Asymmetric (LogNormal) Distribution Credibility Interval

    ```julia
    using CairoMakie
    using Distributions

    d = LogNormal(0, 2)
    range_d = 0:0.001:4
    q25 = quantile(d, 0.25)
    q75 = quantile(d, 0.75)
    credint = range(q25; stop=q75, length=100)
    f, ax, l = lines(
        range_d,
        pdf.(d, range_d);
        linewidth=3,
        axis=(; limits=(-0.2, 4.2, nothing, nothing), xlabel=L"\theta", ylabel="Density"),
    )
    scatter!(ax, mode(d), pdf(d, mode(d)); color=:green, markersize=12)
    band!(ax, credint, 0.0, pdf.(d, credint); color=(:steelblue, 0.5))
    ```

#### Storopoli Summary of Bayesian Statistics vs Frequentist Statistics

|Feature     |Bayesian Statistics	|Frequentist Statistics
|------------|-----------------------|-----------------------------
|Data        |Fixed – Non-random	    |Uncertain – Random
|Parameters	|Uncertain – Random	    |Fixed – Non-random
|Inference	|Uncertainty over parameter values	|Uncertainty over a sampling procedure from an infinite population
|Probability	|Subjective	            |Objective (but with strong model assumptions)
|Uncertainty	|Credible Interval – P(θ∣y)	|Confidence Interval – P(y∣θ)


#### Storopoli on Advantages of Bayesian Statistics
- advantages compared to frequentist approach:
    - Natural approach to express uncertainty
    - Ability to incorporate prior information
    - Greater model flexibility
    - Estimate of complete posterior distribution of parameters
    - Credibility Intervals vs Confidence Intervals
    - Natural propagation of uncertainty
- main disadvantage compared to frequentist approach:
    - greater computational requirements (slower estimation)


## Common Probability Distributions
- Source https://storopoli.github.io/Bayesian-Julia/pages/03_prob_dist/
- Bayesian Estimation requires specifying probability distributions for all uncertain parameters
- "Bayesian statistics uses probability distributions as the inference "engine" for the estimation of the parameter values along with their uncertainties."

#### Common Discrete distributions
- **Discrete Uniform**
    - ```d = DiscreteUniform(lowbound, upbound) # a uniform distribution over {lb, lb+1, ..., ub}```
- **Bernoulli** - describes a binary event of a successful experiment.
    - ```d = Bernoulli(probabilityOfSuccess_p)```
- **Binomial** - describes an event of the number of successes in a sequence of n independent Bernoulli experiment(s)
    - ```d = Binomial(numberOfExperiment_n, probabilityOfSuccess_p)```
- **Poisson** - probability that a given number of events will occur in a fixed interval of time or space if those events occur with a known constant average rate and regardless of the time since the last event.
    - ```d = Poisson(rate_λ)```
- **Negative Binomial** - describes the number of failures before the rth success in a sequence of independent Bernoulli trials.
    - parameterized by r, the number of successes, and p, the probability of
  success in an individual trial.
    - ```d = NegativeBinomial(numSuccesses_r, probabilityOfIndividualSuccess_p)```
    - Note that it becomes identical to the Poisson distribution at the limit of k→∞
    - makes the negative binomial a robust option to replace a Poisson distribution to model phenomena with a overdispersion (excess expected variation in data)
    - "Any phenomenon that can be modeled with a Poisson distribution, can be modeled with a negative binomial distribution (Gelman et al., 2013; 2020)."

#### Continuous probability distributions
- **Normal / Gaussian**
    - ```d = Normal(μ,σ)```
- **Log-normal** - continuous probability distribution of a random variable whose logarithm is normally distributed
    - "The log normal distribution is the distribution of the exponential of a Normal variate" if $X \sim \operatorname{Normal}(\mu, \sigma)$ then $\exp(X) \sim \operatorname{LogNormal}(\mu,\sigma)$.
    $$f(x; \mu, \sigma) = \frac{1}{x \sqrt{2 \pi \sigma^2}} \exp \left( - \frac{(\log(x) - \mu)^2}{2 \sigma^2} \right), \quad x > 0$$
    - log-normal process is the statistical realization of the multiplicative product of many independent random variables, each one being positive.
    - ```d = Log-Normal(μ,σ)```
- **Exponential** - probability distribution of time between events that occur continuously and independently at a constant average rate.
    - has one parameter and its notation is Exp(λ) (contin analog of Poisson)
    - ```d = Exponential(λ)```
- **Student-t distribution** - estimating the mean of a population normally distributed in situations where the sample size is small and the population standard deviation is unknown.

    - for sample of n observations from a normal distribution, distribution of sample mean (relative to the true mean, divided by the standard deviation of the sample) is distributed Student-t with ν=n−1 degrees of freedom ???
    - Student-t distribution symmetrical and bell-shaped, like Normal distribution, but has longer tails
    - Student-t distribution has one parameter and its notation is Student-t(ν)
    - ```d = TDist(degrees_freedom_v)``
- **Beta Distribution** - a natural choice to model anything that is constrained to take values between 0 and 1
    - a good candidate for probabilities and proportions.
    - beta distribution has two "shape" parameters Beta(a,b):
        - Shape parameter (a or α): controls how much the shape is shifted towards 1
        - Shape parameter (b or β): controls how much the shape is shifted towards 0
    - ```d = Beta(shape_a, shape_b)```
    - Example: A repeated Bernoulli experiment/obs with k successes and n-k failures in n attempts has success probability distributed as `Beta(k+1, n-k+1)`. (mean probability of success is k/n = a/(a+b)) [??? check]
        - a = b = 1 is a uniform dist (0 trial, 0 successes or failures)

#### Other Distributions
- See the ["distribution zoo" ShinyApp tool from Ben Lambert](https://ben18785.shinyapps.io/distribution-zoo/
) (statistician from Imperial College of London)



### References
- Ge, H., Xu, K., & Ghahramani, Z. (2018). Turing: A Language for Flexible Probabilistic Inference. International Conference on Artificial Intelligence and Statistics, 1682–1690. http://proceedings.mlr.press/v84/ge18b.html
- Gelman, A., Carlin, J. B., Stern, H. S., Dunson, D. B., Vehtari, A., & Rubin, D. B. (2013). Bayesian Data Analysis. Chapman and Hall/CRC.
- Gelman, A., Hill, J., & Vehtari, A. (2020). Regression and other stories. Cambridge University Press.
- Hardesty (2015). "Probabilistic programming does in 50 lines of code what used to take thousands". phys.org. April 13, 2015. Retrieved April 13, 2015. https://phys.org/news/2015-04-probabilistic-lines-code-thousands.html
- Hoffman, M. D., & Gelman, A. (2011). The No-U-Turn Sampler: Adaptively Setting Path Lengths in Hamiltonian Monte Carlo. Journal of Machine Learning Research, 15(1), 1593–1623. Retrieved from http://arxiv.org/abs/1111.4246

## Why Bayes Theorem is Important for Inference

$$P(A \land B) = P(B \land A)$$
$$P(A|B) P(B) = P(A \land B) = P(B \land A) = P(B|A) P(A)$$
hence
$$P(B|A) = \frac{P(A|B) P(B)}{P(A)}$$

Importantly, Bayes Theorem indicates that we can invert the conditional order between
Hypothesis and Data:
$$P(Hypothesis|Data) = \frac{P(Data|Hypothesis) P(Hypothesis)}{P(Data)}$$
or
$$Posterior_{\tilde \theta} = \frac{Likelihood_{y|X,\theta} Prior_{\tilde \theta}}{Normalization_{P(X, y|X)}}$$

#### In contrast, **p-value**:
P-value is probability of observing data *producing test results D at least as extreme as that observed*,
given that the null-hypothesis $H_0$ is true:
$$\text{P-value} = P(D | H_0)$$


## How to use Turing
- Turing.jl [Ge et al. 2018] provides a Domain Specific Language (DSL) for Probabilistic Programming:
    - probabilistic programming languages (PPLs) (Hardesty, 2015) allow specification of probabilistic models and inference for these models is performed automatically.

- PP Languages (PPLs) allows us to specify variables as random variables with specified (prior)distributions with known or unknown parameters.
- Then, we construct a model using these variables, specifying how the variables relate to each other
- Finally automatic inference of the variables' unknown parameters is performed.
- Bayesian approach this means specifying priors, likelihoods and letting the PPL compute the posterior
    - Since the denominator ("normalizing" term) in the posterior is often analytically intractable, we use Markov Chain Monte Carlo and an algorithm that uses the posterior geometry to guide the MCMC proposal.
    - using Hamiltonian dynamics called Hamiltonian Monte Carlo (HMC) to approximate the posterior.
- This process involves:
    - a suitable PPL, 
        -  `Turing.jl` (Ge, Xu & Ghahramani, 2018) itself is a PPL and the main interface for all needed packages. `DynamicPPL.jl` (Tarek, Xu, Trapp, Ge & Ghahramani, 2020) specifies a domain-specific language and backend for Turing
    - automatic differentiation
        - ` DistributionsAD.jl` enable automatic differentiation (AD) of the `logpdf` function from `Distributions.jl`
        - purpose is to "make the output of `logpdf` differentiable with respect to all continuous parameters of a distribution as well as the random variable in the case of continuous distributions"
    - MCMC chains interface, `MCMCChains.jl` 
        - an interface to summarizing MCMC simulations, with diagnostics and visualization
    - and an efficient HMC algorithm implementation.
        - `AdvancedHMC.jl` (Xu, Ge, Tebbutt, Tarek, Trapp & Ghahramani, 2020) provides a robust, modular and efficient implementation of advanced HMC algorithms. Includes the state-of-the-art HMC algorithm "No-U-Turn Sampling" (NUTS) (Hoffman & Gelman, 2011)
- Turing's "workflow"
    - First, specify a **model** with the macro `@model`, then 
        - assign variables in two ways:
            - using `~` which means that a variable is random and follows some specified probability distribution
            - using `=` which means that a variable value is deterministic (like the normal = assignment)
    - instantiate the model, passing observed data (X,y) as an argument
        - e.g. `model(XyData)`
    - **sample from it** by specifying the **data**, **sampler** and **number of interactions**.
        - e.g. `sample(model, NUTS(), 1_000)` 
    - Turing will perform automatic **inference** on (the parameters of) all variables (**probabilistic parameters**) that you specify as random using `~` with a full **posterior density**. 
    - using `summarystats()`, Inspect the **parameters' statistics** like **mean** and **standard deviation**, along with **convergence diagnostics** like `r_hat`. 
    - Optionally can **plot** stuff easily if you want to. 
    - Finally, do **predictive checks** using `predict` and either the **posterior** or **prior** model's distributions.

- Prior and Posterior Predictive Checks




## Markov Chain Monte Carlo (MCMC)

- **Markov Chain Monte Carlo (MCMC) is a broad class of computational tools for approximating integrals and generating samples**
- "The idea of [MCMC] is to define an ergodic Markov chain (that is to say that there is a single stationary distribution) of which the set of possible states is the sample space and the stationary distribution is the distribution to be approximated (or sampled)."
    - thus, after the chain has converged, there is diminishing benefit to further sampling?
    - customary to discard the first "warm up" iterations of the algorithm as they are usually not representative of the distribution to be approximated.
    - generally recommended to discard half of the iterations (Gelman, Carlin, Stern, Dunson, Vehtari, & Rubin, 2013a) as warm-up

#### Metropolis and Metropolis-Hastings

- Metropolis, Rosenbluth, Rosenbluth, Teller, & Teller, 1953
- The Metropolis algorithm uses a proposal or "jumping" distribution $J_t(θ^*)$ (where t indicates which state of the Markov chain we are in) to define next values of the distribution $P^*(θ^* ∣ data)$.
- For the original Metropolis algorithm, this distribution must be symmetrical:
$$J_t​(θ^*∣θ_{t−1}) = J_t​(θ_{t−1} ∣ θ^*)$$
- In the 1970s, Wilfred Keith Hastings (Hastings, 1970) proposed a generalization of the Metropolis algorithm that does not require that the proposal distributions be symmetric. The generalization is called Metropolis-Hastings algorithm.
- Metropolis algorithm is a random walk through the parameter $θ$'s sample space, where the probability of the Markov chain changing state (from $θ_{current}$ to $θ_{proposed}$) is defined as:
$$P_{change} = min⁡ \left ( \frac {P(θ_{proposed})}{P(θ_{current})}, 1 \right )$$
Pchange​=min(P(θcurrent​)P(θ_proposed​)​,1)

- Define a starting point $θ_0$ of which $p(θ_0∣y)>0$, or sample it from an initial distribution $p_0(θ)$. $p_0(θ)$ can be a normal distribution or a prior distribution of $θ(p(θ))$.

- For t=1,2,…:
    - Sample a proposed $θ^*$ from a proposal distribution in time $t$, $J_t(θ^* ∣ θ_{t−1})$.
    - Calculate the ratio of probabilities:
        - Metropolis: $r = \frac {p(θ∗∣y)}{p(θ_{t−1}∣y)}$

        - Metropolis-Hastings: $r = \frac {\frac {p(θ^*∣y)} {J_t(θ^*∣θ_{t−1})}} {\frac {p(θ_{t−1}∣y)}{J_t(θ_{t−1}∣θ^*)}}$

    - Assign:
        - $θ_t = θ^*$ \text{with probability} min⁡(r,1), ~~ θ_{t−1} \text {otherwise}$
        