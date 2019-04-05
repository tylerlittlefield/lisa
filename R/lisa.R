#' List of all available palettes
#'
#' A list containing all available palettes (128) and their attributes (class,
#' artist name and the name of the artwork).
#'
#' Source: \url{http://colorlisa.com/}
"lisa"

#' Artist, palettes, and artwork names
#'
#' A dataset containing the name of the artist, palette, and artwork.
#'
#' @format A data frame with 128 rows and 3 variables:
#' \describe{
#'   \item{artist}{name of artist}
#'   \item{palette}{name of the palette}
#'   \item{work}{name of artwork}
#' }
#'
#' Source: \url{http://colorlisa.com/}
"artwork"

#' Call or modify lisa palettes
#'
#' @param n Number of colors desired.
#' @param name Name of desired palette. See \code{names(lisa)}.
#' @param type Either "continuous" or "discrete". Use continuous if you want
#' to automatically interpolate between colors.
#'
#' @importFrom graphics rect par image text
#' @return A vector of colors.
#' @examples
#' lisa_palette(name = "Prince", n = 10, type = "continuous")
#' lisa_palette("PabloPicasso", 2, "discrete")
#' @export
lisa_palette <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)
  work <- attributes(lisa::lisa[[name]])$work

  pal <- lisa::lisa[[name]]
  if (is.null(pal))
    stop("Palette not found.")

  if (missing(n)) {
    n <- length(pal)
  }

  if (type == "discrete" && n > length(pal)) {
    stop("Number of requested colors greater than what palette can offer")
  }

  out <- switch(type,
                continuous = grDevices::colorRampPalette(pal)(n),
                discrete = pal[1:n]
  )

  structure(out, class = c("lisa_palette", class(out)), name = name, work = work)
}
