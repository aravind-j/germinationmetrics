# Coefficient of uniformity of germination

Compute the Coefficient of uniformity of germination (CUG).

## Usage

``` r
CUGerm(germ.counts, intervals, partial = TRUE)
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

The value of the coefficient of uniformity of germination as
\\\mathrm{time^{-2}}\\.

## Details

CUG is computed as follows (Heydecker 1972; Bewley and Black 1994) .

\\CUG =
\frac{\sum\_{i=1}^{k}N\_{i}}{\sum\_{i=1}^{k}(\overline{T}-T\_{i})^{2}N\_{i}}\\

Where, \\\overline{T}\\ is the the mean germination time, \\T\_{i}\\ is
the time from the start of the experiment to the \\i\\th interval,
\\N\_{i}\\ is the number of seeds germinated in the \\i\\th time
interval (not the accumulated number, but the number corresponding to
the \\i\\th interval), and \\k\\ is the total number of time intervals.

## References

Bewley JD, Black M (1994). *Physiology of Development and Germination*.
Plenum Publishing Corporation, New York, USA. ISBN 0-306-44748-7,
tex.ids= bewley\_ seeds:\_1994, bewley\_ seeds:\_1994-1, bewley\_
seeds:\_1994-2 googlebooksid: W6EbrewcpDwC.  
  
Heydecker W (1972). *Seed Ecology. Proceedings of the Nineteenth Easter
School in Agricultural Science, University of Nottingham, 1972*.
Pennsylvania State University Press, University Park, USA.

## See also

[`GermSynchrony`](https://aravind-j.github.io/germinationmetrics/reference/GermSynchrony.md),
[`MeanGermTime`](https://aravind-j.github.io/germinationmetrics/reference/MeanGermTime.md)

## Examples

``` r
x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
int <- 1:length(x)

# From partial germination counts
#----------------------------------------------------------------------------
CUGerm(germ.counts = x, intervals = int)
#> [1] 0.7092199

# From cumulative germination counts
#----------------------------------------------------------------------------
CUGerm(germ.counts = y, intervals = int, partial = FALSE)
#> [1] 0.7092199
```
