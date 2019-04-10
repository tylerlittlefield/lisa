context("test-attributes")

test_that("attributes are intact", {

  # confirm that attributes for each palette are intact, this also checks the
  # order of attribtues, if they were rearranged, this test would fail
  unique_atts <- unlist(unique(lapply(lisa, function(x) names(attributes(x)))))
  atts_intact <- all(unique_atts == c("class", "name", "work"))
  expect_true(atts_intact)

  unique_class <- unlist(unique(lapply(lisa, function(x) class(x))))
  class_intact <- all(unique_class == c("lisa_palette", "character"))
  expect_true(class_intact)

  expect_true(unlist(unique(lapply(lisa, function(x) lisa:::is.lisa_palette(x)))))

  expect_equal(names(attributes(lisa::lisa_palette("JosefAlbers"))), c("class", "name", "work"))

})
