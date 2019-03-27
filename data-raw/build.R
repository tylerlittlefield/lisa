library(tidyverse)
library(rvest)

raw <- "http://colorlisa.com/" %>%
  read_html()

# authors first name, 97 total
raw %>%
  html_nodes("h2>em") %>%
  html_text()

# authors last name, 97 total
raw %>%
  html_nodes("h2>strong") %>%
  html_text() %>%
  .[1:97]

# name or work, 128 total
raw %>%
  html_nodes("h3>a") %>%
  html_text()

raw %>%
  html_nodes("artist")

# artist + work, 128 total
artist_work <- raw %>%
  html_nodes("div>div>div>h3") %>%
  html_text() %>%
  gsub("\n", "", .) %>%
  enframe("id") %>%
  separate(value, c("work", "artist"), "by") %>%
  mutate_all(str_trim) %>%
  mutate(id = as.integer(id))

p_split <- raw %>%
  html_nodes("ul>li") %>%
  html_text() %>%
  enframe("id") %>%
  filter(str_detect(value, "\n")) %>%
  mutate(value = str_remove_all(value, "\n")) %>%
  mutate(value = str_trim(value)) %>%
  mutate(palette = rep(1:128, times=1, each=5)) %>%
  left_join(artist_work, by = c("palette" = "id")) %>%
  select(-id) %>%
  split(.$palette)

artist_names <- make.unique(gsub(" ", "", artist_work$artist), sep = "_")
artist_names[22:23] <- c("SalvadorDali", "SalvadorDali_1")
artist_names[71:72] <- c("ReneMagritte", "ReneMagritte_1")
hex <- lapply(p_split, `[[`, 1)
names(hex) <- artist_names

for (i in 1:length(hex)) {
  attr(hex[[i]], "class") <- c("lisa_palette", class(hex[[i]]))
  attr(hex[[i]], "name") <- artist_names[i]
  attr(hex[[i]], "work") <- artist_work$work[i]
}

lisa <- hex
usethis::use_data(lisa, overwrite = TRUE)
