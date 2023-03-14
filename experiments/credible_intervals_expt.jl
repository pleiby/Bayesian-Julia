#  credibleIntervals_expt.jl

# Source: https://storopoli.github.io/Bayesian-Julia/pages/02_bayes_stats/#confidence_intervals_frequentist_vs_credible_intervals_bayesian

## Log-Normal distribution with mean 0 and standard deviation 2.

"""
The green dot shows the maximum likelihood estimation (MLE) of the value of θ
which is simply the mode of distribution. 
And in the shaded area we have the 50% credibility interval of the value of θ,
which is the interval between the 25% percentile and the 75% percentile
of the probability density of θ. 
In this example, MLE leads to estimated values that are not consistent 
with the actual probability density of the value of θ. (outside the 50% CredInt)
"""

using CairoMakie
using Distributions

d = LogNormal(0, 2)
range_d = 0:0.001:4

f, ax, l = lines(
    range_d,
    pdf.(d, range_d);
    linewidth=3,
    axis=(; limits=(-0.2, 4.2, nothing, nothing), xlabel=L"\theta", ylabel="Density"),
)

scatter!(ax, mode(d), pdf(d, mode(d)); color=:green, markersize=12)
band!(ax, credint, 0.0, pdf.(d, credint); color=(:steelblue, 0.5))

## Now an example of a multimodal distribution[19].
# The figure below shows a bimodal distribution with two modes 2 and 10

d1 = Normal(10, 1)
d2 = Normal(2, 1)
mix_d = [0.4, 0.6]
d = MixtureModel([d1, d2], mix_d) # bimodal as mixture of two normal dists

range_d = -2:0.01:14
sim_d = rand(d, 10_000)
q25 = quantile(sim_d, 0.25)
q75 = quantile(sim_d, 0.75)

credint = range(q25; stop=q75, length=100)

f, ax, l = lines(
    range_d,
    pdf.(d, range_d);
    linewidth=3,
    axis=(;
        limits=(-2, 14, nothing, nothing),
        xticks=[0, 5, 10],
        xlabel=L"\theta",
        ylabel="Density",
    ),
)
scatter!(ax, mode(d2), pdf(d, mode(d2)); color=:green, markersize=12)
band!(ax, credint, 0.0, pdf.(d, credint); color=(:steelblue, 0.5))
