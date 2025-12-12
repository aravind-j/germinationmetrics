# Mean germination percentage and number of seeds per time interval

Compute the following metrics:

- `MeanGermPercent`:

  Mean/average germination percentage per unit time (\\\overline{GP}\\)
  (Czabator 1962) .

- `MeanGermNumber`:

  Number of seeds germinated per unit time (\\\overline{N}\\) (Khamassi
  et al. 2013) .

## Usage

``` r
MeanGermPercent(
  germinated.seeds,
  germ.counts,
  total.seeds,
  intervals,
  partial = TRUE
)

MeanGermNumber(germ.counts, intervals, partial = TRUE)
```

## Arguments

- germinated.seeds:

  Number of germinated seeds

- germ.counts:

  Germination counts at each time interval. Can be partial or cumulative
  as specified in the argument `partial`.

- total.seeds:

  Total number of seeds.

- intervals:

  The time intervals.

- partial:

  logical. If `TRUE`, `germ.counts` is considered as partial and if
  `FALSE`, it is considered as cumulative. Default is `TRUE`.

## Value

The value of mean germination percentage as % \\\mathrm{time^{-1}}\\ or
mean number of seeds per time interval as \\\mathrm{count \\
time^{-1}}\\.

## Details

Mean germination percentage per unit time (\\\overline{GP}\\) is
computed as follows (Czabator 1962) .

\\\overline{GP} = \frac{GP}{T\_{k}}\\

Where, \\GP\\ is the final germination percentage, \\T\_{k}\\ is the
time at the \\k\\th time interval, and \\k\\ is the total number of time
intervals required for final germination.

Mean number of seeds germinated per unit time (\\\overline{N}\\) is
computed as follows (Khamassi et al. 2013) .

\\\overline{N} = \frac{N\_{g}}{T\_{k}}\\

Where, \\N\_{g}\\ is the number of germinated seeds at the end of the
germination test, \\T\_{k}\\ is the time at the \\k\\th time interval,
and \\k\\ is the total number of time intervals required for final
germination.

## References

Czabator FJ (1962). “Germination value: An index combining speed and
completeness of pine seed germination.” *Forest Science*, **8**(4),
386–396.  
  
Khamassi K, Harbaoui K, Jaime ATdS, Jeddi FB (2013). “Optimal
germination temperature assessed by indices and models in field bean
(*Vicia faba* L. var. *minor*).” *Agriculturae Conspectus Scientificus*,
**78**(2), 131–136.

## See also

[`GermPercent`](https://aravind-j.github.io/germinationmetrics/reference/GermPercent.md)

## Examples

``` r
x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
int <- 1:length(x)

# From partial germination counts
#----------------------------------------------------------------------------
MeanGermPercent(germ.counts = x, total.seeds = 50, intervals = int)
#> [1] 5.714286
MeanGermNumber(germ.counts = x, intervals = int)
#> [1] 2.857143

# From cumulative germination counts
#----------------------------------------------------------------------------
MeanGermPercent(germ.counts = y, total.seeds = 50, intervals = int, partial = FALSE)
#> [1] 5.714286
MeanGermNumber(germ.counts = y, intervals = int, partial = FALSE)
#> [1] 2.857143

# From number of germinated seeds
#----------------------------------------------------------------------------
MeanGermPercent(germinated.seeds = 40, total.seeds = 50, intervals = int)
#> [1] 5.714286
```
