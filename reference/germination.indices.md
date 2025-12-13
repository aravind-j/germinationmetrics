# Germination Indices

Compute germination indices from a data frame of germination counts
recorded at specific time intervals for multiple samples in batch.

## Usage

``` r
germination.indices(
  data,
  total.seeds.col,
  counts.intervals.cols,
  intervals,
  partial = TRUE,
  PeakGermPercent = TRUE,
  FirstGermTime = TRUE,
  LastGermTime = TRUE,
  PeakGermTime = TRUE,
  TimeSpreadGerm = TRUE,
  t50 = TRUE,
  MeanGermTime = TRUE,
  VarGermTime = TRUE,
  SEGermTime = TRUE,
  CVGermTime = TRUE,
  MeanGermRate = TRUE,
  CVG = TRUE,
  VarGermRate = TRUE,
  SEGermRate = TRUE,
  GermRateRecip = TRUE,
  GermSpeed = TRUE,
  GermSpeedAccumulated = TRUE,
  GermSpeedCorrected = TRUE,
  WeightGermPercent = TRUE,
  MeanGermPercent = TRUE,
  MeanGermNumber = TRUE,
  TimsonsIndex = TRUE,
  GermRateGeorge = TRUE,
  max.int,
  GermIndex = TRUE,
  EmergenceRateIndex = TRUE,
  PeakValue = TRUE,
  GermValue = TRUE,
  gv.k = 10,
  CUGerm = TRUE,
  GermSynchrony = TRUE,
  GermUncertainty = TRUE
)
```

## Arguments

- data:

  A data frame with the germination count data. It should possess
  columns with

  - Partial or cumulative germination counts per time interval (to be
    indicated by the argument `counts.intervals.cols` and

  - Total number of seeds tested (to be indicated by the argument
    `total.seeds.col`).

- total.seeds.col:

  The name of the column in `data` with the total number of seeds
  tested.

- counts.intervals.cols:

  The names of columns in `data` with the germination counts (partial or
  cumulative, as indicated by the argument `partial`) per time interval
  (indicated by the argument `intervals`).

- intervals:

  The time intervals at which germination counts (in the columns
  specified in argument `counts.intervals.cols`) were recorded.

- partial:

  logical. If `TRUE`, germination counts in `counts.intervals.cols` is
  considered as partial and if `FALSE`, it is considered as cumulative.
  Default is `TRUE`.

- PeakGermPercent:

  logical. If `TRUE`, then the Peak germination percentage (Vallance
  1950; Roh et al. 2004) is computed. Default is `TRUE`.

- FirstGermTime:

  logical. If `TRUE`, the Time of first germination or Germination time
  lag (\\t\_{0}\\) (Edwards 1932; Czabator 1962; Goloff and Bazzaz 1975;
  Labouriau 1983; Ranal 1999; Quintanilla et al. 2000) is computed.
  Default is `TRUE`.

- LastGermTime:

  logical. If `TRUE`, the Time of last germination (\\t\_{g}\\) (Edwards
  1932; Labouriau 1983; Ranal and de Santana 2006) . is computed.
  Default is `TRUE`.

- PeakGermTime:

  logical. If `TRUE`, the Peak time of germination or Modal time of
  germination (Ranal and de Santana 2006) is computed. Default is
  `TRUE`.

- TimeSpreadGerm:

  logical. If `TRUE`, the Time spread of germination (Al-Mudaris 1998;
  Kader 2005) or Germination distribution (Schrader and Graves 2000) .
  is computed. Default is `TRUE`.

- t50:

  logical. If `TRUE`, the Median germination time (\\t\_{50}\\)
  (Coolbear et al. 1984; Farooq et al. 2005) is computed. Default is
  `TRUE`.

- MeanGermTime:

  logical. If `TRUE`, the Mean germination time (\\\overline{T}\\) or
  Mean length of incubation time (Edmond and Drapala 1958; Czabator
  1962; Ellis and Roberts 1980; Labouriau 1983; Ranal and de
  Santana 2006) . or Sprouting index (\\SI\\) (Smith and Millet 1964) or
  Germination Resistance (\\GR\\) Gordon (1969, 1971) is computed.
  Default is `TRUE`.

- VarGermTime:

  logical. If `TRUE`, the Variance of germination time (\\s\_{T}^{2}\\)
  (Labouriau 1983; Ranal and de Santana 2006) is computed. Default is
  `TRUE`.

- SEGermTime:

  logical. If `TRUE`, the Standard error of germination time
  (\\s\_{\overline{T}}\\) (Labouriau 1983; Ranal and de Santana 2006) .
  is computed. Default is `TRUE`.

- CVGermTime:

  logical. If `TRUE`, the Coefficient of variation of the germination
  time (\\CV\_{T}\\) (Ranal and de Santana 2006) is computed. Default is
  `TRUE`.

- MeanGermRate:

  logical. If `TRUE`, the Mean germination rate (\\\overline{V}\\)
  (Labouriau and Valadares 1976; Labouriau 1983; Ranal and de
  Santana 2006) . is computed. Default is `TRUE`.

- CVG:

  logical. If `TRUE`, the Coefficient of velocity/rate of germination or
  Kotowski's coefficient of velocity (\\CVG\\) (Kotowski 1926; Nichols
  and Heydecker 1968; Labouriau 1983; Scott et al. 1984; Bewley and
  Black 1994) . is computed. Default is `TRUE`.

- VarGermRate:

  logical. If `TRUE`, the Variance of germination rate (\\s\_{V}^{2}\\)
  (Labouriau 1983; Ranal and de Santana 2006) is computed. Default is
  `TRUE`.

- SEGermRate:

  logical. If `TRUE`, the Standard error of germination rate
  (\\s\_{\overline{V}}\\) (Labouriau 1983; Ranal and de Santana 2006) is
  computed. Default is `TRUE`.

- GermRateRecip:

  logical. If `TRUE`, the Germination rate as reciprocal of median time
  (\\v\_{50}\\) (Went 1957; Labouriau 1983; Ranal and de Santana 2006)
  is computed.

- GermSpeed:

  logical. If `TRUE`, the Speed of germination or Germination rate index
  or Index of velocity of germination or Germination index or Emergence
  rate index (Throneberry and Smith 1955; Maguire 1962; Allan et al.
  1962; Kendrick and Frankland 1969; Bouton et al. 1976; AOSA 1983;
  Khandakar and Bradbeer 1983; Bradbeer 1988; Wardle et al. 1991)
  considering both counts and percentages is computed.

- GermSpeedAccumulated:

  logical. If `TRUE`, the Speed of accumulated germination (Bradbeer
  1988; Wardle et al. 1991; Haugland and Brandsaeter 1996; de Santana
  and Ranal 2004) considering both counts and percentages is computed.

- GermSpeedCorrected:

  logical. If `TRUE`, the Corrected speed of germination or Corrected
  germination rate index and the Corrected speed of accumulated
  germination (Evetts and Burnside 1972) is computed.

- WeightGermPercent:

  logical. If `TRUE`, the Weighted germination percentage \\WGP\\ or
  Weighted germination index \\WGI\\ (Reddy 1978; Reddy et al. 1985) is
  computed.

- MeanGermPercent:

  logical. If `TRUE`, the Mean/average germination percentage per unit
  time (\\\overline{GP}\\) (Czabator 1962) is computed.

- MeanGermNumber:

  logical. If `TRUE`, the Number of seeds germinated per unit time
  (\\\overline{N}\\) (Khamassi et al. 2013) is computed.

- TimsonsIndex:

  logical. If `TRUE`, the Timson's index or Timson's germination
  velocity index (Grose and Zimmer 1958; Timson 1965; Brown and Mayer
  1988; Baskin and Baskin 1998) and it's modifications by Labouriau
  (Ranal and de Santana 2006) and (Khan and Ungar 1984) is computed.

- GermRateGeorge:

  logical. If `TRUE`, the George's index George (1961) is computed.

- max.int:

  The maximum interval value up to which Timson's index/George's
  germination rate is to be computed.

- GermIndex:

  logical. If `TRUE`, the Germination index according to Melville et
  al. (1980) and its modification by de Santana and Ranal (2004) (Ranal
  and de Santana 2006) are computed.

- EmergenceRateIndex:

  logical. If `TRUE`, the Emergence rate index or Germination rate index
  are computed according to

  - Shmueli and Goldberg (1971) and it's modification by de Santana and
    Ranal (2004) (Ranal and de Santana 2006) ;

  - Bilbro and Wanjura (1982) ; and

  - Fakorede and Ayoola (1980) , Fakorede and Ojo (1981) , and Fakorede
    and Agbana (1983) .

- PeakValue:

  logical. If `TRUE`, the Peak value (\\PV\\) or Emergence Energy
  (\\EE\\) (Czabator 1962; Bonner 1967) is computed.

- GermValue:

  logical. If `TRUE`, the Germination value (Czabator 1962; Djavanshir
  and Pourbeik 1976) and its modification considering duration from
  start of test instead of from onset of germination (Brown and
  Mayer 1988) is computed.

- gv.k:

  The k Constant for computation of germination value. Default is 10.

- CUGerm:

  logical. If `TRUE`, the Coefficient of uniformity of germination (CUG)
  (Heydecker 1972; Bewley and Black 1994) is computed.

- GermSynchrony:

  logical. If `TRUE`, the Synchrony of germination (\\Z\\ index)
  (Primack 1985; Ranal and de Santana 2006) is computed.

- GermUncertainty:

  logical. If `TRUE`, the Synchronization index (\\\overline{E}\\) or
  Uncertainty of the germination process (\\U\\) or Informational
  entropy (\\H\\) (Shannon 1948; Labouriau and Valadares 1976;
  Labouriau 1983) is computed.

## Value

A data frame with the original data along with the various single-value
germination indices specified in the function arguments.

## References

Al-Mudaris MA (1998). “Notes on various parameters recording the speed
of seed germination.” *Der Tropenlandwirt - Journal of Agriculture in
the Tropics and Subtropics*, **99**(2), 147–154.  
  
Allan RE, Vogel OA, Peterson CJ (1962). “Seedling emergence rate of
fall-sown wheat and its association with plant height and coleoptile
length.” *Agronomy Journal*, **54**(4), 347.  
  
AOSA (1983). *Seed Vigor Testing Handbook*. Association of Official Seed
Analysts, Ithaca, NY, USA.  
  
Baskin CC, Baskin JM (1998). *Seeds: Ecology, Biogeography, and
Evolution of Dormancy and Germination*. Academic Press, San Diego. ISBN
0-12-080260-0.  
  
Bewley JD, Black M (1994). *Seeds: Physiology of Development and
Germination*. Plenum Publishing Corporation, New York, USA. ISBN
0-306-44748-7, tex.ids= bewley\_ seeds:\_1994, bewley\_ seeds:\_1994-1,
bewley\_ seeds:\_1994-2 googlebooksid: W6EbrewcpDwC.  
  
Bilbro JD, Wanjura DF (1982). “Soil crusts and cotton emergence
relationships.” *Transactions of the ASAE*, **25**(6), 1484–1487.  
  
Bonner FT (1967). “Ideal sowing depth for sweetgum seed.” *Tree
Planters' Notes*, **18**(1), 1–1.  
  
Bouton JH, Dudeck AE, Smith RL (1976). “Germination in freshly harvested
seed of centipedegrass.” *Agronomy Journal*, **68**(6), 991.  
  
Bradbeer JW (1988). *Seed Dormancy and Germination*. Blackie, Glasgow
and London.  
  
Brown RF, Mayer DG (1988). “Representing cumulative germination. 1. A
critical analysis of single-value germination indices.” *Annals of
Botany*, **61**(2), 117–125.  
  
Coolbear P, Francis A, Grierson D (1984). “The effect of low temperature
pre-sowing treatment on the germination performance and membrane
integrity of artificially aged tomato seeds.” *Journal of Experimental
Botany*, **35**(11), 1609–1617.  
  
Czabator FJ (1962). “Germination value: An index combining speed and
completeness of pine seed germination.” *Forest Science*, **8**(4),
386–396.  
  
de Santana DG, Ranal MA (2004). *Analise Da Germinacao: Um Enfoque
Estatistico*. Universidade de Brasilia, Brasilia.  
  
Djavanshir K, Pourbeik H (1976). “Germination value-A new formula.”
*Silvae Genetica*, **25**(2), 79–83.  
  
Edmond JB, Drapala WJ (1958). “The effects of temperature, sand and
soil, and acetone on germination of okra seed.” *Proceedings of the
American Society for Horticultural Science*, **71**, 428–434.  
  
Edwards TI (1932). “Temperature relations of seed germination.” *The
Quarterly Review of Biology*, **7**(4), 428–443.  
  
Ellis RH, Roberts EH (1980). “Improved equations for the prediction of
seed longevity.” *Annals of Botany*, **45**(1), 13–30.  
  
Evetts LL, Burnside OC (1972). “Germination and seedling development of
common milkweed and other species.” *Weed Science*, **20**(4),
371–378.  
  
Fakorede MAB, Agbana SB (1983). “Heterotic effects and association of
seedling vigour with mature characteristics and grain yield in some
tropical maize cultivars.” *Maydica*, **28**, 327–338.  
  
Fakorede MAB, Ayoola AO (1980). “Relation between seedling vigor and
selection for yield improvement in maize.” *Maydica*, **25**(3),
135–147.  
  
Fakorede MAB, Ojo DK (1981). “Variability for seedling vigour in maize.”
*Experimental Agriculture*, **17**(2), 195–201.  
  
Farooq M, Basra SMA, Ahmad N, Hafeez K (2005). “Thermal hardening: A new
seed vigor enhancement tool in rice.” *Journal of Integrative Plant
Biology*, **47**(2), 187–193.  
  
George DW (1961). “Influence of germination temperature on the
expression of post-harvest dormancy in wheat.” In *Crop Science
Abstracts; Western Society of Crop Science Annual Meeting, 1961*, 15.  
  
Goloff AA, Bazzaz FA (1975). “A germination model for natural seed
populations.” *Journal of Theoretical Biology*, **52**(2), 259–283.  
  
Gordon AG (1969). “Some observations on the germination energy tests for
cereals.” *Proceedings of the Association of Official Seed Analysts*,
**59**, 58–72.  
  
Gordon AG (1971). “The germination resistance test - A new test for
measuring germination quality of cereals.” *Canadian Journal of Plant
Science*, **51**(2), 181–183.  
  
Grose RJ, Zimmer WJ (1958). “Some laboratory germination responses of
the seeds of river red gum, *Eucalyptus camaldulensis* Dehn. Syn.
*Eucalyptus rostrata* Schlecht.” *Australian Journal of Botany*,
**6**(2), 129.  
  
Haugland E, Brandsaeter LO (1996). “Experiments on bioassay sensitivity
in the study of allelopathy.” *Journal of Chemical Ecology*, **22**(10),
1845–1859.  
  
Heydecker W (1972). *Seed Ecology. Proceedings of the Nineteenth Easter
School in Agricultural Science, University of Nottingham, 1972*.
Pennsylvania State University Press, University Park, USA.  
  
Kader MA (2005). “A comparison of seed germination calculation formulae
and the associated interpretation of resulting data.” *Journal and
Proceedings of the Royal Society of New South Wales*, **138**, 65–75.  
  
Kendrick RE, Frankland B (1969). “Photocontrol of germination in
*Amaranthus caudatus*.” *Planta*, **85**(4), 326–339.  
  
Khamassi K, Harbaoui K, Jaime ATdS, Jeddi FB (2013). “Optimal
germination temperature assessed by indices and models in field bean
(*Vicia faba* L. var. *minor*).” *Agriculturae Conspectus Scientificus*,
**78**(2), 131–136.  
  
Khan MA, Ungar IA (1984). “The effect of salinity and temperature on the
germination of polymorphic seeds and growth of *Atriplex triangularis*
Willd.” *American Journal of Botany*, **71**(4), 481–489.  
  
Khandakar AL, Bradbeer JW (1983). *Jute seed quality*. Bangladesh
Agricultural Research Council, Dhaka.  
  
Kotowski F (1926). “Temperature relations to germination of vegetable
seeds.” *Proceedings of the American Society for Horticultural Science*,
**23**, 176–184.  
  
Labouriau LG (1983). *A Germinacao Das Sementes*. Organizacao dos
Estados Americanos. Programa Regional de Desenvolvimento Cientifico e
Tecnologico. Serie de Biologia. Monografia 24.  
  
Labouriau LG (1983). “Uma nova linha de pesquisa na fisiologia da
germinacao das sementes.” In *Anais do XXXIV Congresso Nacional de
Botanica. SBB, Porto Alegre*, 11–50.  
  
Labouriau LG, Valadares MEB (1976). “On the germination of seeds of
*Calotropis procera* (Ait.) Ait. f.” *Anais da Academia Brasileira de
Ciencias*, **48**(263-284).  
  
Maguire JD (1962). “Speed of germination - Aid in selection and
evaluation for seedling emergence and vigor.” *Crop Science*, **2**(2),
176–177.  
  
Melville AH, Galletta GJ, Draper AD, Ng TJ (1980). “Seed germination and
early seedling vigor in progenies of inbred strawberry selections.”
*HortScience*, **15**(6, I), 749–750.  
  
Nichols MA, Heydecker W (1968). “Two approaches to the study of
germination data.” *Proceedings of the International Seed Testing
Association*, **33**(3), 531–540.  
  
Primack RB (1985). “Longevity of individual flowers.” *Annual Review of
Ecology and Systematics*, **16**(1), 15–37.  
  
Quintanilla LG, Pajaron S, Pangua E, Amigo J (2000). “Effect of
temperature on germination in northernmost populations of *Culcita
macrocarpa* and *Woodwardia radicans*.” *Plant Biology*, **2**(6),
612–617.  
  
Ranal MA (1999). “Effects of temperature on spore germination in some
fern species from semideciduous mesophytic forest.” *American Fern
Journal*, **89**(2), 149.  
  
Ranal MA, de Santana DG (2006). “How and why to measure the germination
process?” *Brazilian Journal of Botany*, **29**(1), 1–11.  
  
Reddy LV (1978). *Effect of temperature on seed dormancy and
alpha-amylase activity during kernel maturation and germination in wheat
(Triticum aestivum L.) cultivars*. Ph.D. Thesis, Oregon State
University.  
  
Reddy LV, Metzger RJ, Ching TM (1985). “Effect of temperature on seed
dormancy of wheat.” *Crop Science*, **25**(3), 455.  
  
Roh M, Bentz J, Wang P, Li E, Koshioka M (2004). “Maturity and
temperature stratification affect the germination of *Styrax japonicus*
seeds.” *The Journal of Horticultural Science and Biotechnology*,
**79**(4), 645–651.  
  
Schrader JA, Graves WR (2000). “Seed germination and seedling growth of
*Alnus maritima* from its three disjunct populations.” *Journal of the
American Society for Horticultural Science*, **125**(1), 128–134.  
  
Scott SJ, Jones RA, Williams WA (1984). “Review of data analysis methods
for seed germination.” *Crop Science*, **24**(6), 1192–1199.  
  
Shannon CE (1948). “A mathematical theory of communication.” *Bell
System Technical Journal*, **27**(3), 379–423.  
  
Shmueli M, Goldberg D (1971). “Emergence, early growth, and salinity of
five vegetable crops germinated by sprinkle and trickle irrigation in an
arid zone.” *HortScience*, **6**, 563–565.  
  
Smith PG, Millet AH (1964). “Germinating and sprouting responses of the
tomato at low temperatures.” *Proceedings of the American Society for
Horticultural Science*, **84**, 480–484.  
  
Throneberry GO, Smith FG (1955). “Relation of respiratory and enzymatic
activity to corn seed viability.” *Plant Physiology*, **30**(4),
337–343.  
  
Timson J (1965). “New method of recording germination data.” *Nature*,
**207**(4993), 216.  
  
Vallance KB (1950). “Studies on the germination of the seeds of *Striga
hermonthica* I. The influence of moisture-treatment, stimulant-dilution,
and after-ripening on germination.” *Annals of Botany*, **14**(55),
347–363.  
  
Wardle DA, Ahmed M, Nicholson KS (1991). “Allelopathic influence of
nodding thistle (*Carduus nutans* L.) seeds on germination and radicle
growth of pasture plants.” *New Zealand Journal of Agricultural
Research*, **34**(2), 185–191.  
  
Went FW (1957). *The experimental control of plant growth*, volume 17.
Chronica Botanica Co., Waltham, Mass., USA and The Ronald Press Co., New
York, USA.

## See also

This function is a wrapper around the different functions for
computation of single-value germination indices in
[germinationmetrics](https://cran.r-project.org/package=germinationmetrics)
([`PeakGermPercent`](https://aravind-j.github.io/germinationmetrics/reference/GermPercent.md),
[`FirstGermTime`](https://aravind-j.github.io/germinationmetrics/reference/FirstGermTime.md),
[`LastGermTime`](https://aravind-j.github.io/germinationmetrics/reference/FirstGermTime.md),
[`PeakGermTime`](https://aravind-j.github.io/germinationmetrics/reference/FirstGermTime.md),
[`TimeSpreadGerm`](https://aravind-j.github.io/germinationmetrics/reference/FirstGermTime.md),
[`t50`](https://aravind-j.github.io/germinationmetrics/reference/t50.md),
[`MeanGermTime`](https://aravind-j.github.io/germinationmetrics/reference/MeanGermTime.md),
[`VarGermTime`](https://aravind-j.github.io/germinationmetrics/reference/MeanGermTime.md),
[`SEGermTime`](https://aravind-j.github.io/germinationmetrics/reference/MeanGermTime.md),
[`CVGermTime`](https://aravind-j.github.io/germinationmetrics/reference/MeanGermTime.md),
[`MeanGermRate`](https://aravind-j.github.io/germinationmetrics/reference/MeanGermRate.md),
[`CVG`](https://aravind-j.github.io/germinationmetrics/reference/MeanGermRate.md),
[`VarGermRate`](https://aravind-j.github.io/germinationmetrics/reference/MeanGermRate.md),
[`SEGermRate`](https://aravind-j.github.io/germinationmetrics/reference/MeanGermRate.md),
[`GermRateRecip`](https://aravind-j.github.io/germinationmetrics/reference/MeanGermRate.md),
[`GermSpeed`](https://aravind-j.github.io/germinationmetrics/reference/GermSpeed.md),
[`GermSpeedAccumulated`](https://aravind-j.github.io/germinationmetrics/reference/GermSpeed.md),
[`GermSpeedCorrected`](https://aravind-j.github.io/germinationmetrics/reference/GermSpeed.md),
[`WeightGermPercent`](https://aravind-j.github.io/germinationmetrics/reference/WeightGermPercent.md),
[`MeanGermPercent`](https://aravind-j.github.io/germinationmetrics/reference/MeanGermPercent.md),
[`MeanGermPercent`](https://aravind-j.github.io/germinationmetrics/reference/GermSpeed.md),
[`TimsonsIndex`](https://aravind-j.github.io/germinationmetrics/reference/TimsonsIndex.md),
[`GermRateGeorge`](https://aravind-j.github.io/germinationmetrics/reference/TimsonsIndex.md),
[`GermIndex`](https://aravind-j.github.io/germinationmetrics/reference/GermIndex.md),
[`EmergenceRateIndex`](https://aravind-j.github.io/germinationmetrics/reference/EmergenceRateIndex.md),
[`GermValue`](https://aravind-j.github.io/germinationmetrics/reference/GermValue.md),
[`PeakValue`](https://aravind-j.github.io/germinationmetrics/reference/GermValue.md),
[`CUGerm`](https://aravind-j.github.io/germinationmetrics/reference/CUGerm.md),
[`GermSynchrony`](https://aravind-j.github.io/germinationmetrics/reference/GermSynchrony.md),
[`GermUncertainty`](https://aravind-j.github.io/germinationmetrics/reference/GermSynchrony.md))

## Examples

``` r
# \donttest{
data(gcdata)

counts.per.intervals <- c("Day01", "Day02", "Day03", "Day04", "Day05",
                          "Day06", "Day07", "Day08", "Day09", "Day10",
                          "Day11", "Day12", "Day13", "Day14")
germination.indices(gcdata, total.seeds.col = "Total Seeds",
                    counts.intervals.cols = counts.per.intervals,
                    intervals = 1:14, partial = TRUE, max.int = 5)
#>    Genotype Rep Day01 Day02 Day03 Day04 Day05 Day06 Day07 Day08 Day09 Day10
#> 1        G1   1     0     0     0     0     4    17    10     7     1     0
#> 2        G2   1     0     0     0     1     3    15    13     6     2     1
#> 3        G3   1     0     0     0     2     3    18     9     8     2     1
#> 4        G4   1     0     0     0     0     4    19    12     6     2     1
#> 5        G5   1     0     0     0     0     5    20    12     8     1     0
#> 6        G1   2     0     0     0     0     3    21    11     7     1     1
#> 7        G2   2     0     0     0     0     4    18    11     7     1     0
#> 8        G3   2     0     0     0     1     3    14    12     6     2     1
#> 9        G4   2     0     0     0     1     3    19    10     8     1     1
#> 10       G5   2     0     0     0     0     4    18    13     6     2     1
#> 11       G1   3     0     0     0     0     5    21    11     8     1     0
#> 12       G2   3     0     0     0     0     3    20    10     7     1     1
#> 13       G3   3     0     0     0     0     4    19    12     8     1     1
#> 14       G4   3     0     0     0     0     3    21    11     6     1     0
#> 15       G5   3     0     0     0     0     4    17    10     8     1     1
#>    Day11 Day12 Day13 Day14 Total Seeds GermPercent PeakGermPercent
#> 1      1     0     0     0          50    80.00000        34.00000
#> 2      0     1     0     0          51    82.35294        29.41176
#> 3      1     1     0     0          48    93.75000        37.50000
#> 4      1     1     0     0          51    90.19608        37.25490
#> 5      0     1     1     0          50    96.00000        40.00000
#> 6      1     1     0     0          49    93.87755        42.85714
#> 7      1     0     0     0          48    87.50000        37.50000
#> 8      0     1     0     0          47    85.10638        29.78723
#> 9      1     1     0     0          52    86.53846        36.53846
#> 10     0     1     0     0          50    90.00000        36.00000
#> 11     0     1     1     0          51    94.11765        41.17647
#> 12     1     1     0     0          51    86.27451        39.21569
#> 13     0     1     1     0          49    95.91837        38.77551
#> 14     1     1     0     0          48    91.66667        43.75000
#> 15     1     0     0     0          48    87.50000        35.41667
#>    FirstGermTime LastGermTime PeakGermTime TimeSpreadGerm t50_Coolbear
#> 1              5           11            6              6     5.970588
#> 2              4           12            6              8     6.192308
#> 3              4           12            6              8     6.333333
#> 4              5           12            6              7     6.041667
#> 5              5           13            6              8     5.975000
#> 6              5           12            6              7     5.976190
#> 7              5           11            6              6     5.972222
#> 8              4           12            6              8     6.208333
#> 9              4           12            6              8     6.310345
#> 10             5           12            6              7     6.076923
#> 11             5           13            6              8     5.928571
#> 12             5           12            6              7     5.975000
#> 13             5           13            6              8     6.083333
#> 14             5           12            6              7     5.928571
#> 15             5           11            6              6     6.050000
#>    t50_Farooq MeanGermTime VarGermTime SEGermTime CVGermTime MeanGermRate
#> 1    5.941176     6.700000    1.446154  0.1901416  0.1794868    0.1492537
#> 2    6.153846     6.857143    2.027875  0.2197333  0.2076717    0.1458333
#> 3    5.972222     6.866667    2.572727  0.2391061  0.2335882    0.1456311
#> 4    6.225806     6.891304    2.187923  0.2180907  0.2146419    0.1451104
#> 5    5.950000     6.812500    2.368351  0.2221275  0.2259002    0.1467890
#> 6    5.952381     6.869565    2.071498  0.2122088  0.2095140    0.1455696
#> 7    5.944444     6.690476    1.389663  0.1818989  0.1761967    0.1494662
#> 8    6.166667     6.875000    2.112179  0.2297923  0.2113940    0.1454545
#> 9    5.973684     6.866667    2.300000  0.2260777  0.2208604    0.1456311
#> 10   6.038462     6.822222    1.831313  0.2017321  0.1983606    0.1465798
#> 11   5.904762     6.791667    2.381206  0.2227295  0.2272072    0.1472393
#> 12   5.950000     6.886364    2.149577  0.2210295  0.2129053    0.1452145
#> 13   6.041667     6.936170    2.539315  0.2324392  0.2297410    0.1441718
#> 14   5.904762     6.772727    1.900634  0.2078370  0.2035568    0.1476510
#> 15   6.259259     6.809524    1.670151  0.1994129  0.1897847    0.1468531
#>     VarGermRate  SEGermRate      CVG GermRateRecip_Coolbear
#> 1  0.0007176543 0.004235724 14.92537              0.1674877
#> 2  0.0009172090 0.004673148 14.58333              0.1614907
#> 3  0.0011572039 0.005071059 14.56311              0.1578947
#> 4  0.0009701218 0.004592342 14.51104              0.1655172
#> 5  0.0010995627 0.004786184 14.67890              0.1673640
#> 6  0.0009301809 0.004496813 14.55696              0.1673307
#> 7  0.0006935558 0.004063648 14.94662              0.1674419
#> 8  0.0009454531 0.004861721 14.54545              0.1610738
#> 9  0.0010345321 0.004794747 14.56311              0.1584699
#> 10 0.0008453940 0.004334343 14.65798              0.1645570
#> 11 0.0011191581 0.004828643 14.72393              0.1686747
#> 12 0.0009558577 0.004660905 14.52145              0.1673640
#> 13 0.0010970785 0.004831366 14.41718              0.1643836
#> 14 0.0009033254 0.004531018 14.76510              0.1686747
#> 15 0.0007767634 0.004300508 14.68531              0.1652893
#>    GermRateRecip_Farooq GermSpeed_Count GermSpeed_Percent
#> 1             0.1683168        6.138925          12.27785
#> 2             0.1625000        6.362698          12.47588
#> 3             0.1674419        6.882179          14.33787
#> 4             0.1606218        6.927417          13.58317
#> 5             0.1680672        7.318987          14.63797
#> 6             0.1680000        6.931782          14.14649
#> 7             0.1682243        6.448449          13.43427
#> 8             0.1621622        6.053175          12.87909
#> 9             0.1674009        6.830592          13.13575
#> 10            0.1656051        6.812698          13.62540
#> 11            0.1693548        7.342796          14.39764
#> 12            0.1680672        6.622258          12.98482
#> 13            0.1655172        7.052320          14.39249
#> 14            0.1693548        6.706782          13.97246
#> 15            0.1597633        6.363925          13.25818
#>    GermSpeedAccumulated_Count GermSpeedAccumulated_Percent
#> 1                    34.61567                     69.23134
#> 2                    35.54058                     69.68741
#> 3                    38.29725                     79.78594
#> 4                    38.68453                     75.85202
#> 5                    41.00786                     82.01571
#> 6                    38.77620                     79.13509
#> 7                    36.38546                     75.80304
#> 8                    33.77079                     71.85275
#> 9                    38.11511                     73.29829
#> 10                   38.19527                     76.39054
#> 11                   41.17452                     80.73436
#> 12                   37.00640                     72.56158
#> 13                   39.29399                     80.19182
#> 14                   37.69490                     78.53103
#> 15                   35.69697                     74.36868
#>    GermSpeedCorrected_Normal GermSpeedCorrected_Accumulated WeightGermPercent
#> 1                  0.1534731                      0.8653917          47.42857
#> 2                  0.1514928                      0.8462043          47.89916
#> 3                  0.1529373                      0.8510501          54.46429
#> 4                  0.1505960                      0.8409680          52.24090
#> 5                  0.1524789                      0.8543303          56.14286
#> 6                  0.1506909                      0.8429608          54.51895
#> 7                  0.1535345                      0.8663205          51.93452
#> 8                  0.1513294                      0.8442698          49.39210
#> 9                  0.1517909                      0.8470024          50.27473
#> 10                 0.1513933                      0.8487837          52.57143
#> 11                 0.1529749                      0.8578026          55.18207
#> 12                 0.1505059                      0.8410547          50.00000
#> 13                 0.1500494                      0.8360424          55.24781
#> 14                 0.1524269                      0.8567022          53.86905
#> 15                 0.1515220                      0.8499278          51.19048
#>    MeanGermPercent MeanGermNumber TimsonsIndex TimsonsIndex_Labouriau
#> 1         5.714286       2.857143     8.000000                   1.00
#> 2         5.882353       3.000000     9.803922                   1.25
#> 3         6.696429       3.214286    14.583333                   1.40
#> 4         6.442577       3.285714     7.843137                   1.00
#> 5         6.857143       3.428571    10.000000                   1.00
#> 6         6.705539       3.285714     6.122449                   1.00
#> 7         6.250000       3.000000     8.333333                   1.00
#> 8         6.079027       2.857143    10.638298                   1.25
#> 9         6.181319       3.214286     9.615385                   1.25
#> 10        6.428571       3.214286     8.000000                   1.00
#> 11        6.722689       3.428571     9.803922                   1.00
#> 12        6.162465       3.142857     5.882353                   1.00
#> 13        6.851312       3.357143     8.163265                   1.00
#> 14        6.547619       3.142857     6.250000                   1.00
#> 15        6.250000       3.000000     8.333333                   1.00
#>    TimsonsIndex_KhanUngar GermRateGeorge GermIndex GermIndex_mod
#> 1               0.5714286              4  5.840000      7.300000
#> 2               0.7002801              5  5.882353      7.142857
#> 3               1.0416667              7  6.687500      7.133333
#> 4               0.5602241              4  6.411765      7.108696
#> 5               0.7142857              5  6.900000      7.187500
#> 6               0.4373178              3  6.693878      7.130435
#> 7               0.5952381              4  6.395833      7.309524
#> 8               0.7598784              5  6.063830      7.125000
#> 9               0.6868132              5  6.173077      7.133333
#> 10              0.5714286              4  6.460000      7.177778
#> 11              0.7002801              5  6.784314      7.208333
#> 12              0.4201681              3  6.137255      7.113636
#> 13              0.5830904              4  6.775510      7.063830
#> 14              0.4464286              3  6.625000      7.227273
#> 15              0.5952381              4  6.291667      7.190476
#>    EmergenceRateIndex_SG EmergenceRateIndex_SG_mod
#> 1                    292                  7.300000
#> 2                    300                  7.142857
#> 3                    321                  7.133333
#> 4                    327                  7.108696
#> 5                    345                  7.187500
#> 6                    328                  7.130435
#> 7                    307                  7.309524
#> 8                    285                  7.125000
#> 9                    321                  7.133333
#> 10                   323                  7.177778
#> 11                   346                  7.208333
#> 12                   313                  7.113636
#> 13                   332                  7.063830
#> 14                   318                  7.227273
#> 15                   302                  7.190476
#>    EmergenceRateIndex_BilbroWanjura EmergenceRateIndex_Fakorede PeakValue
#> 1                          5.970149                    8.375000  9.500000
#> 2                          6.125000                    8.326531  9.313725
#> 3                          6.553398                    7.324444 10.416667
#> 4                          6.675079                    7.640359 10.049020
#> 5                          7.045872                    7.096354 11.250000
#> 6                          6.696203                    7.317580 10.714286
#> 7                          6.277580                    7.646259 10.416667
#> 8                          5.818182                    8.078125  9.574468
#> 9                          6.553398                    7.934815  9.855769
#> 10                         6.596091                    7.580247 10.250000
#> 11                         7.067485                    7.216146 11.029412
#> 12                         6.389439                    7.981921  9.803922
#> 13                         6.776074                    7.231326 10.969388
#> 14                         6.496644                    7.388430 10.677083
#> 15                         6.167832                    7.782313 10.156250
#>    GermValue_Czabator GermValue_DP GermValue_Czabator_mod GermValue_DP_mod
#> 1            54.28571     57.93890               54.28571         39.56076
#> 2            54.78662     52.58713               54.78662         40.99260
#> 3            69.75446     68.62289               69.75446         53.42809
#> 4            64.74158     70.43331               64.74158         48.86825
#> 5            77.14286     80.16914               77.14286         56.23935
#> 6            71.84506     76.51983               71.84506         53.06435
#> 7            65.10417     69.41325               65.10417         47.37690
#> 8            58.20345     56.00669               58.20345         43.67948
#> 9            60.92165     58.13477               60.92165         45.30801
#> 10           65.89286     70.91875               65.89286         49.10820
#> 11           74.14731     77.39782               74.14731         54.27520
#> 12           60.41632     64.44988               60.41632         44.71582
#> 13           75.15470     78.16335               75.15470         54.94192
#> 14           69.90947     74.40140               69.90947         51.41913
#> 15           63.47656     67.62031               63.47656         46.48043
#>       CUGerm GermSynchrony GermUncertainty
#> 1  0.7092199     0.2666667        2.062987
#> 2  0.5051546     0.2346109        2.321514
#> 3  0.3975265     0.2242424        2.462012
#> 4  0.4672113     0.2502415        2.279215
#> 5  0.4312184     0.2606383        2.146051
#> 6  0.4934701     0.2792271        2.160545
#> 7  0.7371500     0.2729384        2.040796
#> 8  0.4855842     0.2256410        2.357249
#> 9  0.4446640     0.2494949        2.321080
#> 10 0.5584666     0.2555556        2.187983
#> 11 0.4288905     0.2686170        2.128670
#> 12 0.4760266     0.2737844        2.185245
#> 13 0.4023679     0.2506938        2.241181
#> 14 0.5383760     0.2991543        2.037680
#> 15 0.6133519     0.2497096        2.185028
# }
```
