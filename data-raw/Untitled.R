library(tidyverse)
library(rvest)

x <- "http://colorlisa.com/" %>%
  read_html() %>%
  html_text()

x <- x %>%
  gsub("\n", ",", .) %>%
  gsub(" ", "", .) %>%
  gsub("by", "SEP", .) %>%
  str_split(., "SEP") %>%
  enframe() %>%
  unnest() %>%
  filter(
    !str_detect(value, "ColorLisa-Colorpalettemasterpiecesoftheworld"),
    !str_detect(value, "sharingColorLisawithyourfriends"),
    !str_detect(value, "RyanMcGuire|BellsDesign|colorobsessedd")
  ) %>%
  mutate(value = str_replace_all(value, "[,]+", ",")) %>%
  separate(value, c("artist", "col1", "col2", "col3", "col4", "col5"), ",") %>%
  print(n = Inf)

artist_names <- x$artist
artist_names <- make.unique(artist_names, sep = "_")

x <- x %>%
  mutate(id = row_number()) %>%
  select(-name) %>%
  gather(key, value, -c(artist, id)) %>%
  split(.$id)

palettes <- lapply(x, `[[`, "value")
# names(palettes) <- artist_names

names(palettes) <- artist_names

palettes <- unname(palettes)

assign_structure <- function(palette, name) {
  structure(palette, class = c("lisa_palette", class(palette)), name = name)
}

lisa_palettes <- list()
for (i in 1:length(palettes)) {
  lisa_palettes[[i]] <- assign_structure(palettes[i], name = names(palettes[i]))
}

names(lisa_palettes) <- artist_names
lisa <- lisa_palettes

usethis::use_data(lisa, overwrite = TRUE)
