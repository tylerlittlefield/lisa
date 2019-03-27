#' List of all available palettes
#'
#' A list containing all available palettes (128) and their attributes (artist
#' name, name of work).
#'
#' Source: \url{http://colorlisa.com/}
"lisa"

#' Name of work and artist
#'
#' A dataset containing the artist name and the name of the work which the palette
#' comes from. These values are also recorded as \code{attributes} for each palette.
#'
#' @format A data frame with 128 rows and 2 variables:
#' \describe{
#'   \item{work}{name of work}
#'   \item{artist}{name of artist}
#' }
#'
#' Source: \url{http://colorlisa.com/}
"work"

#' Call or modify lisa palettes
#'
#' @param n Number of colors desired.
#' @param name Name of desired palette. See \code{names(lisa)}
#' @param type Either "continuous" or "discrete". Use continuous if you want
#' to automatically interpolate between colours.
#'
#' @importFrom graphics rect par image text
#' @return A vector of colours.
#' @export
lisa_palette <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)

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
  structure(out, class = "lisa_palette", name = name)
}
