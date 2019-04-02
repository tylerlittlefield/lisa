# Store palettes as yaml, idea ripped from https://github.com/ewenme/ghibli
# devtools::install_github('viking/r-yaml')

library(dplyr)

# converts to yaml, preview output
lisa::lisa %>%
  .[1:3] %>%
  yaml::as.yaml() %>%
  cat(sep =  "\n")

# save it
lisa::lisa %>%
  yaml::as.yaml() %>%
  write.table(
    here::here("inst/extdata/palettes.yml"),
    quote = FALSE,
    col.names = FALSE
  )
