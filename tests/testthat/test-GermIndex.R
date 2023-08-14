x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
int <- 1:length(x)

test_that("MeanGermRate works; Partial germination counts", {

  # From partial germination counts
  expect_equal(object = GermIndex(germ.counts = x, intervals = int,
                                  total.seeds = 50),
               expected = 5.84, tolerance = 1e-12)
  expect_equal(object = GermIndex(germ.counts = x, intervals = int,
                                  total.seeds = 50, modification = "none"),
               expected = 5.84, tolerance = 1e-12)
  expect_equal(object = GermIndex(germ.counts = x, intervals = int,
                                  total.seeds = 50,
                                  modification = "santanaranal"),
               expected = 7.3, tolerance = 1e-12)
})

test_that("MeanGermRate works; Cumulative germination counts", {

  # From partial germination counts
  expect_equal(object = GermIndex(germ.counts = y, intervals = int,
                                  partial = FALSE, total.seeds = 50),
               expected = 5.84, tolerance = 1e-12)
  expect_equal(object = GermIndex(germ.counts = y, intervals = int,
                                  partial = FALSE, total.seeds = 50,
                                  modification = "none"),
               expected = 5.84, tolerance = 1e-12)
  expect_equal(object = GermIndex(germ.counts = y, intervals = int,
                                  partial = FALSE, total.seeds = 50,
                                  modification = "santanaranal"),
               expected = 7.3, tolerance = 1e-12)
})


test_that("Identical results with Cumulative and Partial germination counts", {

  expect_identical(object = GermIndex(germ.counts = x, intervals = int,
                                      total.seeds = 50),
                   expected = GermIndex(germ.counts = y, intervals = int,
                                        partial = FALSE, total.seeds = 50))
  expect_identical(object = GermIndex(germ.counts = x, intervals = int,
                                      total.seeds = 50, modification = "none"),
                   expected = GermIndex(germ.counts = y, intervals = int,
                                        partial = FALSE, total.seeds = 50,
                                        modification = "none"))
  expect_identical(object = GermIndex(germ.counts = x, intervals = int,
                                      total.seeds = 50,
                                      modification = "santanaranal"),
                   expected = GermIndex(germ.counts = y, intervals = int,
                                        partial = FALSE, total.seeds = 50,
                                        modification = "santanaranal"))
})
