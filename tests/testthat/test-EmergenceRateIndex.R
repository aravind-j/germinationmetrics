x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
int <- 1:length(x)

test_that("EmergenceRateIndex works; Partial germination counts", {

  # From partial germination counts
  expect_equal(object = EmergenceRateIndex(germ.counts = x, intervals = int),
               expected = 292, tolerance = 1e+12)
  expect_equal(object = EmergenceRateIndex(germ.counts = x, intervals = int,
                                           method = "shmueligoldberg"),
               expected = 292, tolerance = 1e+12)
  expect_equal(object = EmergenceRateIndex(germ.counts = x, intervals = int,
                                           method = "sgsantanaranal"),
               expected = 7.3, tolerance = 1e+12)
  expect_equal(object = EmergenceRateIndex(germ.counts = x, intervals = int,
                                           method = "bilbrowanjura"),
               expected = 5.97014925373134, tolerance = 1e+12)
})

test_that("EmergenceRateIndex works; Cumulative germination counts", {

  # From cumulative germination counts
  expect_equal(object = EmergenceRateIndex(germ.counts = y, intervals = int,
                                           partial = FALSE),
               expected = 292, tolerance = 1e+12)
  expect_equal(object = EmergenceRateIndex(germ.counts = y, intervals = int,
                                           partial = FALSE,
                                           method = "shmueligoldberg"),
               expected = 292, tolerance = 1e+12)
  expect_equal(object = EmergenceRateIndex(germ.counts = y, intervals = int,
                                           partial = FALSE,
                                           method = "sgsantanaranal"),
               expected = 7.3, tolerance = 1e+12)
  expect_equal(object = EmergenceRateIndex(germ.counts = y, intervals = int,
                                           partial = FALSE,
                                           method = "bilbrowanjura"),
               expected = 5.97014925373134, tolerance = 1e+12)
})

test_that("Identical results with Cumulative and Partial germination counts", {

  expect_identical(object = EmergenceRateIndex(germ.counts = x, intervals = int),
                   expected = EmergenceRateIndex(germ.counts = y, intervals = int,
                                                 partial = FALSE))
  expect_identical(object = EmergenceRateIndex(germ.counts = x, intervals = int,
                                               method = "shmueligoldberg"),
                   expected = EmergenceRateIndex(germ.counts = y, intervals = int,
                                                 partial = FALSE,
                                                 method = "shmueligoldberg"))
  expect_identical(object = EmergenceRateIndex(germ.counts = x, intervals = int,
                                               method = "sgsantanaranal"),
                   expected = EmergenceRateIndex(germ.counts = y, intervals = int,
                                                 partial = FALSE,
                                                 method = "sgsantanaranal"))
  expect_identical(object = EmergenceRateIndex(germ.counts = x, intervals = int,
                                               method = "bilbrowanjura"),
                   expected = EmergenceRateIndex(germ.counts = y, intervals = int,
                                                 partial = FALSE,
                                                 method = "bilbrowanjura"))
})
