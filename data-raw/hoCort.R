library(tidyverse)
library(ggseg)

load("data-raw/HarvardOxford/ho_atlases.Rda")
hoCort <- ho.df.final %>%
  mutate(hemi = case_when(hemi == "lh" ~ "left",
                          hemi == "rh" ~ "right"),
         side = case_when(side == "lat" ~ "lateral",
                          side == "med" ~ "medial"),
         area = ifelse(grepl("wall", area), NA, area),
         atlas = "hoCort",
         area = gsub(" division", "", area),
         area = gsub("anterior", "ant.", area),
         area = gsub("posterior", "post.", area),
         area = gsub(" formerly Supplementary Motor Cortex ", "", area),
         area = gsub("Inferior", "Inf.", area),
         area = gsub("inferior", "inf.", area),
         area = gsub("Superior", "Sup.", area),
         area = gsub("Lateral", "Lat.", area),
         area = gsub("Middle", "Mid.", area),
         area = gsub(" part", "", area),
         subid = (id*100)+1
         ) %>%
  select(-region) %>%
  rename(
    region = area
  )

hoCort <- hoCort %>%
  as_ggseg_atlas()

ggseg(atlas = hoCort, mapping = aes(fill = region)) +
  scale_fill_brain("hoCort", package = "ggsegHO")

hoCort <- as_brain_atlas(hoCort)
hoCort$palette <- brain_pals$hoCort
usethis::use_data(hoCort, internal = FALSE, overwrite = TRUE, compress = "xz")
