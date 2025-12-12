# Synchrony and uncertainty of germination

Compute the following metrics:

- `GermSynchrony`:

  Synchrony of germination (\\Z\\ index) (Primack 1985; Ranal and de
  Santana 2006) .

- `GermUncertainty`:

  Synchronization index (\\\overline{E}\\) or Uncertainty of the
  germination process (\\U\\) or Informational entropy (\\H\\) (Shannon
  1948; Labouriau and Valadares 1976; Labouriau 1983) .

## Usage

``` r
GermSynchrony(germ.counts, intervals, partial = TRUE)

GermUncertainty(germ.counts, intervals, partial = TRUE)
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

## Value

For `GermUncertainty`, the value of uncertainty of germination process
in \\\mathrm{bit}\\.

For `GermSynchrony`, the value of synchrony of germination.

## Details

`GermSynchrony` computes the value of synchrony of germination (\\Z\\
index) as follows (Primack 1985; Ranal and de Santana 2006) .

\\Z=\frac{\sum\_{i=1}^{k}C\_{N\_{i},2}}{C\_{\Sigma N\_{i},2}}\\

Where, \\C\_{N\_{i},2}\\ is the partial combination of the two
germinated seeds from among \\N\_{i}\\, the number of seeds germinated
on the \\i\\th time interval (estimated as
\\C\_{N\_{i},2}=\frac{N\_{i}(N\_{i}-1)}{2}\\), and \\C\_{\Sigma
N\_{i},2}\\ is the partial combination of the two germinated seeds from
among the total number of seeds germinated at the final count, assuming
that all seeds that germinated did so simultaneously.

`GermUncertainty` computes the value of synchronization index
(\\\overline{E}\\) or uncertainty of the germination process (\\U\\) or
informational entropy (\\H\\) as follows (Shannon 1948; Labouriau and
Valadares 1976; Labouriau 1983) .

\\\overline{E} = -\sum\_{i=1}^{k}f\_{i}\log\_{2}f\_{i}\\

Where, \\f\_{i}\\ is the relative frequency of germination (estimated as
\\f\_{i}=\frac{N\_{i}}{\sum\_{i=1}^{k}N\_{i}}\\), \\N\_{i}\\ is the
number of seeds germinated on the \\i\\th time interval, and \\k\\ is
the total number of time intervals.

## References

Labouriau LG (1983). “Uma nova linha de pesquisa na fisiologia da
germinacao das sementes.” In *Anais do XXXIV Congresso Nacional de
Botanica. SBB, Porto Alegre*, 11–50.  
  
Labouriau LG, Valadares MEB (1976). “On the germination of seeds of
*Calotropis procera* (Ait.) Ait. f.” *Anais da Academia Brasileira de
Ciencias*, **48**(263-284).  
  
Primack RB (1985). “Longevity of individual flowers.” *Annual Review of
Ecology and Systematics*, **16**(1), 15–37.  
  
Ranal MA, de Santana DG (2006). “How and why to measure the germination
process?” *Brazilian Journal of Botany*, **29**(1), 1–11.  
  
Shannon CE (1948). “A mathematical theory of communication.” *Bell
System Technical Journal*, **27**(3), 379–423.

## See also

[`CUGerm`](https://aravind-j.github.io/germinationmetrics/reference/CUGerm.md)

## Examples

``` r
x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
int <- 1:length(x)

# From partial germination counts
#----------------------------------------------------------------------------
GermSynchrony(germ.counts = x, intervals = int)
#> [1] 0.2666667
GermUncertainty(germ.counts = x, intervals = int)
#> [1] 2.062987

# From cumulative germination counts
#----------------------------------------------------------------------------
GermSynchrony(germ.counts = y, intervals = int, partial = FALSE)
#> [1] 0.2666667
GermUncertainty(germ.counts = y, intervals = int, partial = FALSE)
#> [1] 2.062987
```
