library(dplyr)
library(stringr)
library(rvest)

# html content
colorlisa <- read_html("http://colorlisa.com/")

# colors in hexcodes
colors <- colorlisa %>%
  html_nodes(xpath = "//div[@class='palette__content']") %>%
  html_text() %>%
  str_squish()

# urls of the artwork
url <- colorlisa %>%
  html_nodes(xpath = "//h3[@class='palette__author']") %>%
  html_nodes("a") %>%
  html_attr("href")

# artwork name
work <- colorlisa %>%
  html_nodes(xpath = "//h3[@class='palette__author']") %>%
  html_nodes("strong") %>%
  html_text()

# author name
author <- colorlisa %>%
  html_nodes(xpath = "//h3[@class='palette__author']") %>%
  html_text() %>%
  gsub(".*by", "", .) %>%
  str_squish()

# list
lisa <- str_split(colors, " ")
for (i in seq_along(colors)) {
  lisa[i] <- structure(
    str_split(colors[i], " "),
    class = c("lisa_palette", class(colors[i])),
    name = author[i],
    work = work[i]
  )
}

lisa <- str_split(colors, " ")
for (i in seq_along(colors)) {
  attr(lisa[[i]], "class") <- c("lisa_palette", class(colors[i]))
  attr(lisa[[i]], "name") <- author[i]
  attr(lisa[[i]], "work") <- work[i]
}

listnames <- make.unique(gsub(" ", "", author), sep = "_")
listnames[22:23] <- c("SalvadorDali", "SalvadorDali_1")
listnames[71:72] <- c("ReneMagritte", "ReneMagritte_1")
names(lisa) <- listnames

# dataframe
artwork <- tibble::tibble(
  author = author,
  work = work,
  palette = listnames,
  colors = colors,
  url = url
)

usethis::use_data(lisa, overwrite = TRUE)
usethis::use_data(artwork, overwrite = TRUE)
