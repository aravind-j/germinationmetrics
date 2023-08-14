x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
int <- 1:length(x)

test_that("t50 works; Partial germination counts", {

  # From partial germination counts
  expect_equal(object = t50(germ.counts = x, intervals = int,
                            method = "coolbear"),
               expected = 5.97058823529412, tolerance = 1e-12)
  expect_equal(object = t50(germ.counts = x, intervals = int,
                            method = "farooq"),
               expected = 5.94117647058824, tolerance = 1e-12)
})

test_that("t50 works; Cumulative germination counts", {

  # From cumulative germination counts
  expect_equal(object = t50(germ.counts = y, intervals = int,
                            partial = FALSE, method = "coolbear"),
               expected = 5.97058823529412, tolerance = 1e-12)
  expect_equal(object = t50(germ.counts = y, intervals = int,
                            partial = FALSE, method = "farooq"),
               expected = 5.94117647058824, tolerance = 1e-12)
})

test_that("Identical results with Cumulative and Partial germination counts", {

  expect_identical(object = t50(germ.counts = x, intervals = int,
                                method = "coolbear"),
                   expected = t50(germ.counts = y, intervals = int,
                                  partial = FALSE, method = "coolbear"))

  expect_identical(object = t50(germ.counts = x, intervals = int,
                                method = "farooq"),
                   expected = t50(germ.counts = y, intervals = int,
                                  partial = FALSE, method = "farooq"))

})
