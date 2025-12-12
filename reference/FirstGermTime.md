# Time for first, last and peak germination

Compute the following metrics:

- `FirstGermTime`:

  Time of first germination or Germination time lag (\\t\_{0}\\)
  (Edwards 1932; Czabator 1962; Goloff and Bazzaz 1975; Labouriau 1983;
  Ranal 1999; Quintanilla et al. 2000) .

- `LastGermTime`:

  Time of last germination (\\t\_{g}\\) (Edwards 1932; Labouriau 1983;
  Ranal and de Santana 2006) .

- `TimeSpreadGerm`:

  Time spread of germination (Al-Mudaris 1998; Kader 2005) or
  Germination distribution (Schrader and Graves 2000) .

- `PeakGermTime`:

  Peak time of germination or Modal time of germination (\\t\_{peak}\\)
  (Ranal and de Santana 2006) .

## Usage

``` r
FirstGermTime(germ.counts, intervals, partial = TRUE)

LastGermTime(germ.counts, intervals, partial = TRUE)

PeakGermTime(germ.counts, intervals, partial = TRUE)

TimeSpreadGerm(germ.counts, intervals, partial = TRUE)
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

For `FirstGermTime`, the time of first germination value in the same
unit of time as specified in the argument `intervals`.

For `LastGermTime`, the time of last germination value in the same unit
of time as specified in the argument `intervals`.

For `TimeSpreadGerm`, the time spread of germination value in the same
unit of time as specified in the argument `intervals`.

For `PeakGermTime`, the time(s) of peak germination value(s) as a
numeric vector in the same unit of time as specified in the argument
`intervals`.

## Details

Time of first germination indicates time of germination of the faster
seeds in a seedlot.

Lower value of time of first germination indicates faster initiation of
germination and lower value of time of last germination indicates faster
termination of germination.

\\t\_{0} = \min \lbrace T\_{i} : N\_{i} \neq 0 \rbrace\\

\\t\_{g} = \max \lbrace T\_{i} : N\_{i} \neq 0 \rbrace\\

Where, \\T\_{i}\\ is the time from the start of the experiment to the
\\i\\th interval and \\N\_{i}\\ is the number of seeds germinated in the
\\i\\th time interval (not the accumulated number, but the number
corresponding to the \\i\\th interval).

Time spread of germination (\\t\_{g}-t\_{0}\\) indicates difference
between faster and slower germinating members of a sample.

Peak time of germination is the time in which highest frequency of
germinated seeds are observed. Multiple peak times of germination are
possible and if detected are indicated by a warning message.

\\t\_{peak} = \lbrace T\_{i} : N\_{i} = N\_{max} \rbrace\\

Where, \\N\_{max}\\ is the maximum number of seeds germinated per
interval.

## References

Al-Mudaris MA (1998). “Notes on various parameters recording the speed
of seed germination.” *Der Tropenlandwirt - Journal of Agriculture in
the Tropics and Subtropics*, **99**(2), 147–154.  
  
Czabator FJ (1962). “Germination value: An index combining speed and
completeness of pine seed germination.” *Forest Science*, **8**(4),
386–396.  
  
Edwards TI (1932). “Temperature relations of seed germination.” *The
Quarterly Review of Biology*, **7**(4), 428–443.  
  
Goloff AA, Bazzaz FA (1975). “A germination model for natural seed
populations.” *Journal of Theoretical Biology*, **52**(2), 259–283.  
  
Kader MA (2005). “A comparison of seed germination calculation formulae
and the associated interpretation of resulting data.” *Journal and
Proceedings of the Royal Society of New South Wales*, **138**, 65–75.  
  
Labouriau LG (1983). *A Germinacao Das Sementes*. Organizacao dos
Estados Americanos. Programa Regional de Desenvolvimento Cientifico e
Tecnologico. Serie de Biologia. Monografia 24.  
  
Quintanilla LG, Pajaron S, Pangua E, Amigo J (2000). “Effect of
temperature on germination in northernmost populations of *Culcita
macrocarpa* and *Woodwardia radicans*.” *Plant Biology*, **2**(6),
612–617.  
  
Ranal MA (1999). “Effects of temperature on spore germination in some
fern species from semideciduous mesophytic forest.” *American Fern
Journal*, **89**(2), 149.  
  
Ranal MA, de Santana DG (2006). “How and why to measure the germination
process?” *Brazilian Journal of Botany*, **29**(1), 1–11.  
  
Schrader JA, Graves WR (2000). “Seed germination and seedling growth of
*Alnus maritima* from its three disjunct populations.” *Journal of the
American Society for Horticultural Science*, **125**(1), 128–134.

## Examples

``` r
x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
z <- c(0, 0, 0, 0, 11, 11, 9, 7, 1, 0, 1, 0, 0, 0)
int <- 1:length(x)

# From partial germination counts
#----------------------------------------------------------------------------
FirstGermTime(germ.counts = x, intervals = int)
#> [1] 5
LastGermTime(germ.counts = x, intervals = int)
#> [1] 11
TimeSpreadGerm(germ.counts = x, intervals = int)
#> [1] 6
PeakGermTime(germ.counts = x, intervals = int)
#> [1] 6
# For multiple peak germination times
PeakGermTime(germ.counts = z, intervals = int)
#> Warning: Multiple peak germination times exist.
#> [1] 5 6

# From cumulative germination counts
#----------------------------------------------------------------------------
FirstGermTime(germ.counts = y, intervals = int, partial = FALSE)
#> [1] 5
LastGermTime(germ.counts = y, intervals = int, partial = FALSE)
#> [1] 11
TimeSpreadGerm(germ.counts = y, intervals = int, partial = FALSE)
#> [1] 6
PeakGermTime(germ.counts = y, intervals = int, partial = FALSE)
#> [1] 6
# For multiple peak germination time
PeakGermTime(germ.counts = cumsum(z), intervals = int, partial = FALSE)
#> Warning: Multiple peak germination times exist.
#> [1] 5 6
```
