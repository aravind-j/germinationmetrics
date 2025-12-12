# Germination percentage

Compute the following metrics:

- `GermPercent`:

  Germination percentage or Final germination percentage or
  Germinability (ISTA 2015) .

- `PeakGermPercent`:

  Peak germination percentage (Vallance 1950; Roh et al. 2004) .

## Usage

``` r
GermPercent(germinated.seeds, germ.counts, total.seeds, partial = TRUE)

PeakGermPercent(germ.counts, intervals, total.seeds, partial = TRUE)
```

## Arguments

- germinated.seeds:

  Number of germinated seeds

- germ.counts:

  Germination counts at each time interval. Can be partial or cumulative
  as specified in the argument `partial`.

- total.seeds:

  Total number of seeds.

- partial:

  logical. If `TRUE`, `germ.counts` is considered as partial and if
  `FALSE`, it is considered as cumulative. Default is `TRUE`.

- intervals:

  The time intervals.

## Value

The germination percentage (%) value.

## Details

Germination percentage is computed as follows (ISTA 2015) .

\\GP = \frac{N\_{g}}{N\_{t}} \times 100\\

Where, \\N\_{g}\\ is the number of germinated seeds and \\N\_{t}\\ is
the total number of seeds.

The value of \\N\_{g}\\ can be either specified using the argument
`germinated.seeds` or is computed from the `germ.counts` argument.

Peak germination percentage is computed as follows (Vallance 1950; Roh
et al. 2004) .

\\PGP = \frac{N\_{max}}{N\_{t}} \times 100\\

Where, \\N\_{max}\\ is the maximum number of seeds germinated per
interval.

## References

ISTA (2015). “Chapter 5: The germination test.” In *International Rules
for Seed Testing. International Seed Testing Association, Zurich,
Switzerland.*, volume 2015, i–5–56. International Seed Testing
Association.  
  
Roh M, Bentz J, Wang P, Li E, Koshioka M (2004). “Maturity and
temperature stratification affect the germination of *Styrax japonicus*
seeds.” *The Journal of Horticultural Science and Biotechnology*,
**79**(4), 645–651.  
  
Vallance KB (1950). “Studies on the germination of the seeds of *Striga
hermonthica* I. The influence of moisture-treatment, stimulant-dilution,
and after-ripening on germination.” *Annals of Botany*, **14**(55),
347–363.

## Examples

``` r
x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
z <- c(0, 0, 0, 0, 11, 11, 9, 7, 1, 0, 1, 0, 0, 0)
int <- 1:length(x)

# From partial germination counts
#----------------------------------------------------------------------------
GermPercent(germ.counts = x, total.seeds = 50)
#> [1] 80
PeakGermPercent(germ.counts = x, intervals = int, total.seeds = 50)
#> [1] 34
# For multiple peak germination times
PeakGermPercent(germ.counts = z, intervals = int, total.seeds = 50)
#> Warning: Multiple peak germination times exist.
#> [1] 22

# From cumulative germination counts
#----------------------------------------------------------------------------
GermPercent(germ.counts = y, total.seeds = 50, partial = FALSE)
#> [1] 80
PeakGermPercent(germ.counts = y, intervals = int, total.seeds = 50,
                partial = FALSE)
#> [1] 34
# For multiple peak germination times
PeakGermPercent(germ.counts = cumsum(z), intervals = int, total.seeds = 50,
                partial = FALSE)
#> Warning: Multiple peak germination times exist.
#> [1] 22

# From number of germinated seeds
#----------------------------------------------------------------------------
GermPercent(germinated.seeds = 40, total.seeds = 50)
#> [1] 80
```
