x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
int <- 1:length(x)

test_that("MeanGermRate works; Partial germination counts", {

  # From partial germination counts
  expect_equal(object = WeightGermPercent(germ.counts = x, total.seeds = 50,
                                          intervals = int),
               expected = 47.4285714285714, tolerance = 1e-12)
})

test_that("MeanGermRate works; Cumulative germination counts", {

  # From partial germination counts
  expect_equal(object = WeightGermPercent(germ.counts = y, total.seeds = 50,
                                          intervals = int, partial = FALSE),
               expected = 47.4285714285714, tolerance = 1e-12)
})

test_that("Identical results with Cumulative and Partial germination counts", {

  expect_identical(object = WeightGermPercent(germ.counts = x,
                                              total.seeds = 50,
                                              intervals = int),
                   expected = WeightGermPercent(germ.counts = y,
                                                total.seeds = 50,
                                                intervals = int,
                                                partial = FALSE))
})
