pals_nms <- na.omit(hoCort$region)

brain_pals = list(
  hoCort = setNames(rgb(runif(length(pals_nms)),runif(length(pals_nms)),runif(length(pals_nms))), pals_nms)
)
usethis::use_data(brain_pals, internal = TRUE, overwrite = TRUE)
