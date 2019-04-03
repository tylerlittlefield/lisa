context("test-lisa_palette")

test_that("lisa_palette works", {

  # various lisa_palette tests
  expect_error(lisa::lisa_palette("JosefAlbers", -1))
  expect_error(lisa::lisa_palette("JosefAlbers", Inf))
  expect_length(lisa::lisa_palette("JosefAlbers"), 5)
  expect_error(lisa::lisa_palette("JosefAlbers",20))
  expect_error(lisa::lisa_palette("JosefAlbers", 20, "discrete"))
  expect_length(lisa::lisa_palette("JosefAlbers", 20, "continuous"), 20)
  expect_error(lisa::lisa_palette("NotAPalette"))

})
