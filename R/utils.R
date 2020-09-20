is.lisa_palette <- function(x) {
  inherits(x, "lisa_palette")
}

#' @export
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
plot.lisa_palette <- function(x, ...) {
  if(is.lisa_palette(x)) {

    if(length(list(...))) {
      label = list(...)[[1]]
    } else {
      label = attr(x, "name")
    }

    n <- length(x)
    old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
    on.exit(par(old))

    image(1:n, 1, as.matrix(1:n), col = x,
          ylab = "", xaxt = "n", yaxt = "n", bty = "n")

    rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
    text((n + 1) / 2, 1, labels = label, cex = 1, family = "mono")
  }
}

#' @export
print.lisa_palette <- function(x, ...) {
  if (is.lisa_palette(x)) {
    if (length(x) > 5) {
      cols <- paste(paste(x[1:5], collapse = " "),"... and", length(x) - 5, "more")
    } else {
      cols <- x
    }
    cat("* Work:", attr(x, "work"), "\n")
    cat("* Author:", attr(x, "name"), "\n")
    cat("* Colors:", cols)
  }
}
