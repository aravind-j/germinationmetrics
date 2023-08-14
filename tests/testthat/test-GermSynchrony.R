x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
int <- 1:length(x)

test_that("GermSynchrony works; Partial germination counts", {

  # From partial germination counts
  expect_equal(object = GermSynchrony(germ.counts = x, intervals = int),
               expected = 0.266666666666667, tolerance = 1e+12)
})

test_that("GermSynchrony works; Cumulative germination counts", {

  # From cumulative germination counts
  expect_equal(object = GermSynchrony(germ.counts = y, intervals = int,
                                      partial = FALSE),
               expected = 0.266666666666667, tolerance = 1e+12)
})

test_that("GermUncertainty works; Partial germination counts", {

  # From partial germination counts
  expect_equal(object = GermUncertainty(germ.counts = x, intervals = int,),
               expected = 2.06298725227405, tolerance = 1e+12)
})

test_that("GermUncertainty works; Cumulative germination counts", {

  # From cumulative germination counts
  expect_equal(object = GermUncertainty(germ.counts = y, intervals = int,
                                        partial = FALSE),
               expected = 2.06298725227405, tolerance = 1e+12)
})


test_that("Identical results with Cumulative and Partial germination counts", {

  expect_identical(object = GermSynchrony(germ.counts = x, intervals = int),
                   expected = GermSynchrony(germ.counts = y, intervals = int,
                                            partial = FALSE))
  expect_identical(object = GermUncertainty(germ.counts = x, intervals = int),
                   expected = GermUncertainty(germ.counts = y, intervals = int,
                                              partial = FALSE))

})
