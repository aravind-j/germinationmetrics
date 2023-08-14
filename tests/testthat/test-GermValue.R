x <- c(0, 0, 34, 40, 21, 10, 4, 5, 3, 5, 8, 7, 7, 6, 6, 4, 0, 2, 0, 2)
y <- c(0, 0, 34, 74, 95, 105, 109, 114, 117, 122, 130, 137, 144, 150,
       156, 160, 160, 162, 162, 164)
int <- 1:length(x)

test_that("PeakValue works; Partial germination counts", {

  # From partial germination counts
  expect_equal(object = PeakValue(germ.counts = x, intervals = int,
                                  total.seeds = 200),
               expected = 2.375, tolerance = 1e+12)
})

test_that("PeakValue works; Cumulative germination counts", {

  # From cumulative germination counts
  expect_equal(object = PeakValue(germ.counts = y, intervals = int,
                                  total.seeds = 200,
                                  partial = FALSE),
               expected = 2.375, tolerance = 1e+12)
})

test_that("GermValue works; Partial germination counts", {

  # From partial germination counts
  expect_equal(object = GermValue(germ.counts = x, intervals = int,
                                  total.seeds = 200,
                                  method = "dp", k = 10)[[1]],
               expected = 3.62118119975263, tolerance = 1e+12)
  expect_equal(object = GermValue(germ.counts = x, intervals = int,
                                  total.seeds = 200,
                                  method = "czabator",
                                  from.onset = FALSE)[[1]],
               expected = 3.39285714285714, tolerance = 1e+12)
  expect_equal(object = GermValue(germ.counts = x, intervals = int,
                                  total.seeds = 200,
                                  method = "dp", k = 10,
                                  from.onset = FALSE)[[1]],
               expected = 2.47254769040483, tolerance = 1e+12)
})

test_that("GermValue works; Cumulative germination counts", {

  # From cumulative germination counts
  expect_equal(object = GermValue(germ.counts = y, intervals = int,
                                  total.seeds = 200,
                                  partial = FALSE,
                                  method = "dp", k = 10)[[1]],
               expected = 3.62118119975263, tolerance = 1e+12)
  expect_equal(object = GermValue(germ.counts = y, intervals = int,
                                  total.seeds = 200,
                                  partial = FALSE,
                                  method = "czabator",
                                  from.onset = FALSE)[[1]],
               expected = 3.39285714285714, tolerance = 1e+12)
  expect_equal(object = GermValue(germ.counts = y, intervals = int,
                                  total.seeds = 200,
                                  partial = FALSE,
                                  method = "dp", k = 10,
                                  from.onset = FALSE)[[1]],
               expected = 2.47254769040483, tolerance = 1e+12)
})

test_that("Identical results with Cumulative and Partial germination counts", {

  expect_identical(object = PeakValue(germ.counts = x, intervals = int,
                                      total.seeds = 200),
                   expected = PeakValue(germ.counts = y, intervals = int,
                                        total.seeds = 200,
                                        partial = FALSE))
  expect_identical(object = GermValue(germ.counts = x, intervals = int,
                                      total.seeds = 200,
                                      method = "dp", k = 10)[[1]],
                   expected = GermValue(germ.counts = y, intervals = int,
                                        total.seeds = 200,
                                        partial = FALSE,
                                        method = "dp", k = 10)[[1]])
  expect_identical(object = GermValue(germ.counts = x, intervals = int,
                                      total.seeds = 200,
                                      method = "czabator",
                                      from.onset = FALSE)[[1]],
                   expected = GermValue(germ.counts = y, intervals = int,
                                        total.seeds = 200,
                                        partial = FALSE,
                                        method = "czabator",
                                        from.onset = FALSE)[[1]])
  expect_identical(object = GermValue(germ.counts = x, intervals = int,
                                      total.seeds = 200,
                                      method = "dp", k = 10,
                                      from.onset = FALSE)[[1]],
                   expected = GermValue(germ.counts = y, intervals = int,
                                        total.seeds = 200,
                                        partial = FALSE,
                                        method = "dp", k = 10,
                                        from.onset = FALSE)[[1]])
})

