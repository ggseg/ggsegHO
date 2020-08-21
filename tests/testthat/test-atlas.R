# ggseg ----
context("test-adapt_scales")
test_that("Check that ggseg:::adapt_scales is working", {
  expect_equal(mode(ggseg:::adapt_scales(unnest(hoCort, ggseg))), "list")
})

context("test-palettes")
test_that("check new palettes work", {
  expect_equal(length(brain_pal("hoCort", package = "ggsegHO")), 120)

  expect_error(brain_pal("hoCort"), "not a valid")

  expect_true(all(names(brain_pal("hoCort", package = "ggsegHO")) %in% hoCort$region))
})

context("test-ggseg-atlas")
test_that("atlases are true ggseg atlases", {

  expect_true(is_ggseg_atlas(hoCort))

})

context("test-ggseg")
test_that("Check that polygon atlases are working", {
  expect_is(ggseg(atlas = hoCort),c("gg","ggplot"))

  expect_is(ggseg(atlas = hoCort, mapping = aes(fill = region)),
            c("gg","ggplot"))

  expect_is(ggseg(atlas = hoCort, mapping = aes(fill = region)) +
              scale_fill_brain("hoCort", package = "ggsegHO"),
            c("gg","ggplot"))

  expect_is(ggseg(atlas = hoCort, mapping = aes(fill = region)) +
              scale_fill_brain("hoCort", package = "ggsegHO"),
            c("gg","ggplot"))

  expect_is(ggseg(atlas = hoCort, mapping=aes(fill=area), adapt_scales = F ),
            c("gg","ggplot"))

})


# ggseg3d ----
# context("test-ggseg3d")
# test_that("Check that mesh atlases are working", {
#   expect_is(
#     ggseg3d(atlas=hoCort_3d),
#     c("plotly", "htmlwidget")
#   )
# })



# context("test-ggseg3d-atlas")
# test_that("atlases are true ggseg3d atlases", {
#
#   expect_true(is_ggseg3d_atlas(hoCort_3d))
#
# })
