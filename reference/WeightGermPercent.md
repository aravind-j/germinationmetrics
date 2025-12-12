# Weighted germination percentage

Compute the Weighted germination percentage \\WGP\\ or Weighted
germination index \\WGI\\ (Reddy 1978; Reddy et al. 1985) .

## Usage

``` r
WeightGermPercent(germ.counts, total.seeds, intervals, partial = TRUE)
```

## Arguments

- germ.counts:

  Germination counts at each time interval. Can be partial or cumulative
  as specified in the argument `partial`.

- total.seeds:

  Total number of seeds tested.

- intervals:

  The time intervals.

- partial:

  logical. If `TRUE`, `germ.counts` is considered as partial and if
  `FALSE`, it is considered as cumulative. Default is `TRUE`.

## Value

The weighted germination percentage (%) value.

## Details

Weighted germination percentage was calculated by giving maximum weight
to the seeds that germinate first and decreasing weight to the seeds
that germinate subsequently. It is computed as follows (Reddy 1978;
Reddy et al. 1985) .

\\WGP = \frac{\sum\_{i=1}^{k}(k-i+1)N\_{i}}{k \times N} \times 100\\

Where, \\N\_{i}\\ is the number of seeds that germinated in the time
interval \\i\\ (not cumulative, but partial count), \\N\\ is the total
number of seeds tested, and \\k\\ is the total number of time intervals.

## References

Reddy LV (1978). *Effect of temperature on seed dormancy and
alpha-amylase activity during kernel maturation and germination in wheat
(Triticum aestivum L.) cultivars*. Ph.D. Thesis, Oregon State
University.  
  
Reddy LV, Metzger RJ, Ching TM (1985). “Effect of temperature on seed
dormancy of wheat.” *Crop Science*, **25**(3), 455.

## Examples

``` r
x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
int <- 1:length(x)

# From partial germination counts
#----------------------------------------------------------------------------
WeightGermPercent(germ.counts = x, total.seeds = 50, intervals = int)
#> [1] 47.42857

# From cumulative germination counts
#----------------------------------------------------------------------------
WeightGermPercent(germ.counts = y, total.seeds = 50, intervals = int,
                  partial = FALSE)
#> [1] 47.42857

```
