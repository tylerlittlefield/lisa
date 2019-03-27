#' List of all available palettes
#'
#' Source: \url{http://colorlisa.com/}
"lisa"

#' Call or modify lisa palettes
#'
#' @param n Number of colors desired.
#' @param name Name of desired palette. See \code{names(geopalettes)}
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
