# A really crude and messy way of scraping the palettes...

library(tidyverse)
library(rvest)

x <- "http://colorlisa.com/" %>%
  read_html() %>%
  html_text() %>%
  gsub("\n", ",", .) %>%
  gsub(" ", "", .) %>%
  str_split(., "by") %>%
  enframe() %>%
  unnest() %>%
  filter(
    !str_detect(value, "ColorLisa-Colorpalettemasterpiecesoftheworld"),
    !str_detect(value, "sharingColorLisawithyourfriends"),
    !str_detect(value, "RyanMcGuire|BellsDesign|colorobsessedd")
  ) %>%
  mutate(value = str_replace_all(value, "[,]+", ",")) %>%
  separate(value, c("artist", "col1", "col2", "col3", "col4", "col5"), ",")

artist_names <- x$artist
artist_names <- make.unique(artist_names, sep = "_")
artist_names[22:23] <- c("SalvadorDali", "SalvadorDali_1")
artist_names[71:72] <- c("ReneMagritte", "ReneMagritte_1")

x <- x %>%
  mutate(id = row_number()) %>%
  select(-name) %>%
  gather(key, value, -c(artist, id)) %>%
  split(.$id) %>%
  lapply(., `[[`, 4) %>%
  unname()

names(x) <- artist_names

for (i in 1:length(x)) {
  x[[i]] <- structure(x[[i]], class = c("lisa_palette", "character"), name = artist_names[[i]])
}

lisa <- x
lisa
usethis::use_data(lisa, overwrite = TRUE)
