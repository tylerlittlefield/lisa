context("test-lisa-data")

test_that("lisa data", {

  # confirm that lisa is a list and artwork is a data.frame
  expect_true(class(lisa::lisa) == "list")
  expect_true(class(lisa::artwork) == "data.frame")

})
