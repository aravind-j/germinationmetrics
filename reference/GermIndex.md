# Germination Index

Compute the Germination index according to Melville et al. (1980) and
its modification by de Santana and Ranal (2004) (Ranal and de Santana
2006) .

## Usage

``` r
GermIndex(
  germ.counts,
  intervals,
  partial = TRUE,
  total.seeds,
  modification = c("none", "santanaranal")
)
```

## Arguments

- germ.counts:

  Germination counts at each time interval. Can be partial or cumulative
  as specified in the argument `partial`.

- intervals:

  The time intervals.

- partial:

  logical. If `TRUE`, `germ.counts` is considered as partial and if
  `FALSE`, it is considered as cumulative. Default is `TRUE`.

- total.seeds:

  Total number of seeds.

- modification:

  The modification to be applied. Either `"none"` or `"santanaranal"`.
  Default is `"none"` (see **Details**).

## Value

The value of the Germination index in the same unit of time as specified
in the argument `intervals`.

## Details

Germination index (\\GI\\) is computed as follows (Melville et al. 1980)
.

\\GI = \sum\_{i=1}^{k}\frac{\left \| \left ( T\_{k} - T\_{i} \right )
N\_{i}\right \|}{N\_{t}}\\

Where, \\T\_{i}\\ is the time from the start of the experiment to the
\\i\\th interval (day for the example), \\N\_{i}\\ is the number of
seeds germinated in the \\i\\th time interval (not the accumulated
number, but the number corresponding to the \\i\\th interval),
\\N\_{t}\\ is the total number of seeds used in the test, and \\k\\ is
the total number of time intervals.

A modified germination index (\\GI\_{mod}\\) was proposed by (de Santana
and Ranal 2004) where total number of seeds tested (\\N\_{t}\\) is
replaced by the total number of germinated seeds (\\N\_{g}\\) in the
expression of Melville et al. (1980) to remove the effect of sample size
(Ranal and de Santana 2006) . It is computed as follows (Specified by
the argument `modification = "santanaranal"`).

\\GI\_{mod} = \sum\_{i=1}^{k}\frac{\left \| \left ( T\_{k} - T\_{i}
\right ) N\_{i}\right \|}{N\_{g}}\\

The term Germination index (\\GI\\) has also been used to describe the
mathematical expression for Speed of germination
([`GermSpeed`](https://aravind-j.github.io/germinationmetrics/reference/GermSpeed.md))
by AOSA (1983) .

## References

AOSA (1983). *Seed Vigor Testing Handbook*. Association of Official Seed
Analysts, Ithaca, NY, USA.  
  
de Santana DG, Ranal MA (2004). *Analise Da Germinacao: Um Enfoque
Estatistico*. Universidade de Brasilia, Brasilia.  
  
Melville AH, Galletta GJ, Draper AD, Ng TJ (1980). “Seed germination and
early seedling vigor in progenies of inbred strawberry selections.”
*HortScience*, **15**(6, I), 749–750.  
  
Ranal MA, de Santana DG (2006). “How and why to measure the germination
process?” *Brazilian Journal of Botany*, **29**(1), 1–11.

## See also

[`GermSpeed`](https://aravind-j.github.io/germinationmetrics/reference/GermSpeed.md)

## Examples

``` r
x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
int <- 1:length(x)

# From partial germination counts
#----------------------------------------------------------------------------
GermIndex(germ.counts = x, intervals = int, total.seeds = 50)
#> [1] 5.84
GermIndex(germ.counts = x, intervals = int, total.seeds = 50,
          modification = "none")
#> [1] 5.84
GermIndex(germ.counts = x, intervals = int, total.seeds = 50,
          modification = "santanaranal")
#> [1] 7.3

# From cumulative germination counts
#----------------------------------------------------------------------------
GermIndex(germ.counts = y, intervals = int, partial = FALSE,
          total.seeds = 50)
#> [1] 5.84
GermIndex(germ.counts = y, intervals = int, partial = FALSE,
          total.seeds = 50,
          modification = "none")
#> [1] 5.84
GermIndex(germ.counts = y, intervals = int, partial = FALSE,
          total.seeds = 50,
          modification = "santanaranal")
#> [1] 7.3
```
