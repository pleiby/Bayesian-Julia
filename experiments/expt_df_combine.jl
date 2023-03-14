using Random, StatsBase, DataFrames, BenchmarkTools, Chain
Random.seed!(123)

n = 10_000

df = DataFrame(
    x=sample(["A", "B", "C", "D"], n, replace=true),
    y=rand(n),
    z=randn(n),
)

@btime @chain $df begin  # passing `df` as reference so the compiler cannot optimize
    groupby(:x)
    combine(:y => median, :z => mean)
end
