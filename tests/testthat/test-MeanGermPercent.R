x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
int <- 1:length(x)

test_that("MeanGermPercent works; Partial germination counts", {

  # From partial germination counts
  expect_equal(object = MeanGermPercent(germ.counts = x, total.seeds = 50,
                                        intervals = int),
               expected = 5.71428571428571, tolerance = 1e-12)
})

test_that("MeanGermPercent works; Cumulative germination counts", {

  # From cumulative germination counts
  expect_equal(object = MeanGermPercent(germ.counts = y, total.seeds = 50,
                                        intervals = int, partial = FALSE),
               expected = 5.71428571428571, tolerance = 1e-12)
})

test_that("MeanGermPercent works; Number of germinated seeds", {

  # From number of germinated seeds
  expect_equal(object = MeanGermPercent(germinated.seeds = 40,
                                        total.seeds = 50, intervals = int),
               expected = 5.71428571428571, tolerance = 1e-12)
})

test_that("MeanGermNumber works; Partial germination counts", {

  # From partial germination counts
  expect_equal(object = MeanGermNumber(germ.counts = x, intervals = int),
               expected = 2.85714285714286, tolerance = 1e-12)
})

test_that("MeanGermNumber works; Cumulative germination counts", {

  # From cumulative germination counts
  expect_equal(object = MeanGermNumber(germ.counts = y, intervals = int,
                                       partial = FALSE),
               expected = 2.85714285714286, tolerance = 1e-12)
})

test_that("Identical results with Cumulative and Partial germination counts", {

  expect_identical(object = MeanGermPercent(germ.counts = x, total.seeds = 50,
                                            intervals = int),
                   expected = MeanGermPercent(germ.counts = y, total.seeds = 50,
                                              intervals = int, partial = FALSE))
  expect_identical(object = MeanGermNumber(germ.counts = x, intervals = int),
                   expected = MeanGermNumber(germ.counts = y, intervals = int,
                                             partial = FALSE))
})
