# Germination time

Compute the following metrics:

- `MeanGermTime`:

  Mean germination time (\\\overline{T}\\) or Mean length of incubation
  time (Edmond and Drapala 1958; Czabator 1962; Mock and Eberhart 1972;
  Ellis and Roberts 1980; Labouriau 1983; Ranal and de Santana 2006) .

- `VarGermTime`:

  Variance of germination time (\\s\_{T}^{2}\\) (Labouriau 1983; Ranal
  and de Santana 2006) .

- `SEGermTime`:

  Standard error of germination time (\\s\_{\overline{T}}\\) (Labouriau
  1983; Ranal and de Santana 2006) .

- `CVGermTime`:

  Coefficient of variation of the germination time (\\CV\_{T}\\) (Gomes
  1960; Ranal and de Santana 2006) .

## Usage

``` r
MeanGermTime(germ.counts, intervals, partial = TRUE)

VarGermTime(germ.counts, intervals, partial = TRUE)

SEGermTime(germ.counts, intervals, partial = TRUE)

CVGermTime(germ.counts, intervals, partial = TRUE)
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

For `MeanGermTime`, the mean germination time value in the same unit of
time as specified in the argument `intervals`.

For `VarGermTime`, the variance of germination time value as
\\\mathrm{time^{2}}\\.

For `SEGermTime`, the standard error of germination time in the same
unit of time specified in the argument `intervals`.

For `CVGermTime`, the value of coefficient of variation of the
germination time.

## Details

`MeanGermTime` computes the mean germination time according to the
following formula (Edmond and Drapala 1958; Czabator 1962; Smith and
Millet 1964; Ellis and Roberts 1980; Labouriau 1983; Ranal and de
Santana 2006) .

\\\overline{T} =
\frac{\sum\_{i=1}^{k}N\_{i}T\_{i}}{\sum\_{i=1}^{k}N\_{i}}\\

Where, \\T\_{i}\\ is the time from the start of the experiment to the
\\i\\th interval, \\N\_{i}\\ is the number of seeds germinated in the
\\i\\th time interval (not the accumulated number, but the number
corresponding to the \\i\\th interval), and \\k\\ is the total number of
time intervals.

It is the same as Sprouting Index (\\SI\\) or Emergence Index (\\EI\\)
described by Smith and Millet (1964) and Mock and Eberhart (1972) as
well as Germination Resistance (\\GR\\) described by Gordon (1969, 1971)
.

It is the inverse of mean germination rate (\\\overline{V}\\).

\\\overline{T} = \frac{1}{\overline{V}}\\

It indicates the average length of time required for maximum germination
of a seed lot. Lower the \\\overline{T}\\, faster the sample has
germinated and reflects seed vigor.

`VarGermTime` computes the variance of germination time according to the
following formula (Labouriau 1983; Ranal and de Santana 2006) .

\\s\_{T}^{2} =
\frac{\sum\_{i=1}^{k}N\_{i}(T\_{i}-\overline{T})^{2}}{\sum\_{i=1}^{k}N\_{i}-1}\\

Where, \\T\_{i}\\ is the time from the start of the experiment to the
\\i\\th interval, \\N\_{i}\\ is the number of seeds germinated in the
\\i\\th time interval (not the accumulated number, but the number
corresponding to the \\i\\th interval), and \\k\\ is the total number of
time intervals.

`SEGermTime` computes the standard error of germination time
(\\s\_{\overline{T}}\\) according to the following formula (Labouriau
1983; Ranal and de Santana 2006) .

\\s\_{\overline{T}} = \sqrt{\frac{s\_{T}^{2}}{\sum\_{i=1}^{k}N\_{i}}}\\

Where, \\N\_{i}\\ is the number of seeds germinated in the \\i\\th time
interval (not the accumulated number, but the number corresponding to
the \\i\\th interval), and \\k\\ is the total number of time intervals.

It signifies the accuracy of the calculation of the mean germination
time.

`CVGermTime` computes the coefficient of variation of germination time
(\\CV\_{T}\\) according to the following formula (Gomes 1960; Ranal and
de Santana 2006) .

\\CV\_{T} = \frac{\sqrt{s\_{T}^{2}}}{\overline{T}}\\

This indicates the uniformity of germination and permits comparisons
irrespective of the magnitude of mean germination time
(\\\overline{T}\\).

## References

Czabator FJ (1962). “Germination value: An index combining speed and
completeness of pine seed germination.” *Forest Science*, **8**(4),
386–396.  
  
Edmond JB, Drapala WJ (1958). “The effects of temperature, sand and
soil, and acetone on germination of okra seed.” *Proceedings of the
American Society for Horticultural Science*, **71**, 428–434.  
  
Ellis RH, Roberts EH (1980). “Improved equations for the prediction of
seed longevity.” *Annals of Botany*, **45**(1), 13–30.  
  
Gomes FP (1960). *Curso De Estatistica Experimental*. Escola Superior de
Agricultura Luiz de Queiroz, Universidade de Sao Paulo.  
  
Gordon AG (1969). “Some observations on the germination energy tests for
cereals.” *Proceedings of the Association of Official Seed Analysts*,
**59**, 58–72.  
  
Gordon AG (1971). “The germination resistance test - A new test for
measuring germination quality of cereals.” *Canadian Journal of Plant
Science*, **51**(2), 181–183.  
  
Labouriau LG (1983). *A Germinacao Das Sementes*. Organizacao dos
Estados Americanos. Programa Regional de Desenvolvimento Cientifico e
Tecnologico. Serie de Biologia. Monografia 24.  
  
Mock JJ, Eberhart SA (1972). “Cold tolerance in adapted maize
populations.” *Crop Science*, **12**(4), 466–469.  
  
Ranal MA, de Santana DG (2006). “How and why to measure the germination
process?” *Brazilian Journal of Botany*, **29**(1), 1–11.  
  
Smith PG, Millet AH (1964). “Germinating and sprouting responses of the
tomato at low temperatures.” *Proceedings of the American Society for
Horticultural Science*, **84**, 480–484.

## See also

[`MeanGermRate`](https://aravind-j.github.io/germinationmetrics/reference/MeanGermRate.md)

## Examples

``` r
x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
int <- 1:length(x)

# From partial germination counts
#----------------------------------------------------------------------------
MeanGermTime(germ.counts = x, intervals = int)
#> [1] 6.7
VarGermTime(germ.counts = x, intervals = int)
#> [1] 1.446154
SEGermTime(germ.counts = x, intervals = int)
#> [1] 0.1901416
CVGermTime(germ.counts = x, intervals = int)
#> [1] 0.1794868

# From cumulative germination counts
#----------------------------------------------------------------------------
MeanGermTime(germ.counts = y, intervals = int, partial = FALSE)
#> [1] 6.7
VarGermTime(germ.counts = y, intervals = int, partial = FALSE)
#> [1] 1.446154
SEGermTime(germ.counts = y, intervals = int, partial = FALSE)
#> [1] 0.1901416
CVGermTime(germ.counts = y, intervals = int, partial = FALSE)
#> [1] 0.1794868
```
