# Germination rate

Compute the following metrics:

- `MeanGermRate`:

  Mean germination rate (\\\overline{V}\\) (Labouriau and Valadares
  1976; Labouriau 1983; Ranal and de Santana 2006) .

- `VarGermRate`:

  Variance of germination rate (\\s\_{V}^{2}\\) (Labouriau 1983; Ranal
  and de Santana 2006) .

- `SEGermRate`:

  Standard error of germination rate (\\s\_{\overline{V}}\\) (Labouriau
  1983; Ranal and de Santana 2006) .

- `CVG`:

  Coefficient of velocity/rate of germination or Kotowski's coefficient
  of velocity (\\CVG\\) (Kotowski 1926; Nichols and Heydecker 1968;
  Labouriau 1983; Scott et al. 1984; Bewley and Black 1994) .

- `GermRateRecip`:

  Germination rate as reciprocal of median time (\\v\_{50}\\) (Went
  1957; Labouriau 1983; Ranal and de Santana 2006) .

## Usage

``` r
MeanGermRate(germ.counts, intervals, partial = TRUE)

CVG(germ.counts, intervals, partial = TRUE)

VarGermRate(germ.counts, intervals, partial = TRUE)

SEGermRate(germ.counts, intervals, partial = TRUE)

GermRateRecip(
  germ.counts,
  intervals,
  partial = TRUE,
  method = c("coolbear", "farooq")
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

- method:

  The method for computing median germination time. Either `"coolbear"`
  or `"farooq"`.

## Value

For `MeanGermRate`, the mean germination rate value as
\\\mathrm{time^{-1}}\\.

For `VarGermTime`, the variance of germination rate value as
\\\mathrm{time^{-2}}\\.

For `SEGermTime`, the standard error of germination rate as
\\\mathrm{time^{-1}}\\.

For `CVG`, the value of Coefficient of of velocity/rate of germination
or Kotowski's coefficient of velocity as % \\\mathrm{time^{-1}}\\.

For `GermRateRecip`, the value of germination rate as
\\\mathrm{time^{-1}}\\.

## Details

`MeanGermRate` computes the mean germination rate (\\\overline{V}\\)
according to the following formula (Labouriau and Valadares 1976;
Labouriau 1983; Ranal and de Santana 2006) .

\\\overline{V} =
\frac{\sum\_{i=1}^{k}N\_{i}}{\sum\_{i=1}^{k}N\_{i}T\_{i}}\\

Where, \\T\_{i}\\ is the time from the start of the experiment to the
\\i\\th interval, \\N\_{i}\\ is the number of seeds germinated in the
\\i\\th time interval (not the accumulated number, but the number
corresponding to the \\i\\th interval), and \\k\\ is the total number of
time intervals.

It is the inverse of mean germination time (\\\overline{T}\\).

\\\overline{V} = \frac{1}{\overline{T}}\\

`VarGermRate` computes the variance of germination rate (\\s\_{V}^{2}\\)
according to the following formula (Labouriau 1983; Ranal and de Santana
2006) .

\\s\_{V}^{2} = \overline{V}^{4} \times s\_{T}^{2}\\

Where, \\s\_{T}^{2}\\ is the variance of germination time.

`SEGermRate` computes the standard error of germination time
(\\s\_{\overline{V}}\\) according to the following formula (Labouriau
1983; Ranal and de Santana 2006) .

\\s\_{\overline{V}} = \sqrt{\frac{s\_{V}^{2}}{\sum\_{i=1}^{k}N\_{i}}}\\

Where, \\N\_{i}\\ is the number of seeds germinated in the \\i\\th time
interval (not the accumulated number, but the number corresponding to
the \\i\\th interval), and \\k\\ is the total number of time intervals.

`CVG` computes the coefficient of velocity/rate of germination or
Kotowski's coefficient of velocity (\\CVG\\) according to the following
formula (Kotowski 1926; Nichols and Heydecker 1968; Labouriau 1983;
Scott et al. 1984; Bewley and Black 1994) .

\\CVG = \frac{\sum\_{i=1}^{k}N\_{i}}{\sum\_{i=1}^{k}N\_{i}T\_{i}} \times
100\\

\\CVG = \overline{V} \times 100\\

Where, \\T\_{i}\\ is the time from the start of the experiment to the
\\i\\th interval, \\N\_{i}\\ is the number of seeds germinated in the
\\i\\th time interval (not the accumulated number, but the number
corresponding to the \\i\\th interval), and \\k\\ is the total number of
time intervals.

`GermRateRecip` computes the germination rate (\\v\_{50}\\) as the
reciprocal of the median germination time (\\t\_{50}\\) (Went 1957;
Labouriau 1983; Ranal and de Santana 2006) according to the methods of
Coolbear et al. (1984) (Specified by the argument `method = "coolbear"`)
or Farooq et al. (2005) (Specified by the argument `method = "farooq"`)
as follows.

\\v\_{50} = \frac{1}{t\_{50}}\\

## References

Bewley JD, Black M (1994). *Seeds: Physiology of Development and
Germination*. Plenum Publishing Corporation, New York, USA. ISBN
0-306-44748-7, tex.ids= bewley\_ seeds:\_1994, bewley\_ seeds:\_1994-1,
bewley\_ seeds:\_1994-2 googlebooksid: W6EbrewcpDwC.  
  
Coolbear P, Francis A, Grierson D (1984). “The effect of low temperature
pre-sowing treatment on the germination performance and membrane
integrity of artificially aged tomato seeds.” *Journal of Experimental
Botany*, **35**(11), 1609–1617.  
  
Farooq M, Basra SMA, Ahmad N, Hafeez K (2005). “Thermal hardening: A new
seed vigor enhancement tool in rice.” *Journal of Integrative Plant
Biology*, **47**(2), 187–193.  
  
Kotowski F (1926). “Temperature relations to germination of vegetable
seeds.” *Proceedings of the American Society for Horticultural Science*,
**23**, 176–184.  
  
Labouriau LG (1983). “Uma nova linha de pesquisa na fisiologia da
germinacao das sementes.” In *Anais do XXXIV Congresso Nacional de
Botanica. SBB, Porto Alegre*, 11–50.  
  
Labouriau LG, Valadares MEB (1976). “On the germination of seeds of
*Calotropis procera* (Ait.) Ait. f.” *Anais da Academia Brasileira de
Ciencias*, **48**(263-284).  
  
Nichols MA, Heydecker W (1968). “Two approaches to the study of
germination data.” *Proceedings of the International Seed Testing
Association*, **33**(3), 531–540.  
  
Ranal MA, de Santana DG (2006). “How and why to measure the germination
process?” *Brazilian Journal of Botany*, **29**(1), 1–11.  
  
Scott SJ, Jones RA, Williams WA (1984). “Review of data analysis methods
for seed germination.” *Crop Science*, **24**(6), 1192–1199.  
  
Went FW (1957). *The experimental control of plant growth*, volume 17.
Chronica Botanica Co., Waltham, Mass., USA and The Ronald Press Co., New
York, USA.

## See also

[`MeanGermTime`](https://aravind-j.github.io/germinationmetrics/reference/MeanGermTime.md),
[`t50`](https://aravind-j.github.io/germinationmetrics/reference/t50.md)

## Examples

``` r
x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
int <- 1:length(x)

# From partial germination counts
#----------------------------------------------------------------------------
MeanGermRate(germ.counts = x, intervals = int)
#> [1] 0.1492537
CVG(germ.counts = x, intervals = int)
#> [1] 14.92537
VarGermRate(germ.counts = x, intervals = int)
#> [1] 0.0007176543
SEGermRate(germ.counts = x, intervals = int)
#> [1] 0.004235724
GermRateRecip(germ.counts = x, intervals = int, method = "coolbear")
#> [1] 0.1674877
GermRateRecip(germ.counts = x, intervals = int, method = "farooq")
#> [1] 0.1683168

# From cumulative germination counts
#----------------------------------------------------------------------------
MeanGermRate(germ.counts = y, intervals = int, partial = FALSE)
#> [1] 0.1492537
CVG(germ.counts = y, intervals = int, partial = FALSE)
#> [1] 14.92537
VarGermRate(germ.counts = y, intervals = int, partial = FALSE)
#> [1] 0.0007176543
SEGermRate(germ.counts = y, intervals = int, partial = FALSE)
#> [1] 0.004235724
GermRateRecip(germ.counts = y, intervals = int,
              method = "coolbear", partial = FALSE)
#> [1] 0.1674877
GermRateRecip(germ.counts = y, intervals = int,
              method = "farooq", partial = FALSE)
#> [1] 0.1683168
```
