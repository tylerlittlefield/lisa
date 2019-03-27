
<!-- README.md is generated from README.Rmd. Please edit that file -->

# lisa

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/tyluRp/lisa.svg?branch=master)](https://travis-ci.org/tyluRp/lisa)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/tyluRp/lisa?branch=master&svg=true)](https://ci.appveyor.com/project/tyluRp/lisa)
<!-- badges: end -->

This is a color palette R package that contains 128 palettes from
[**colorlisa**](http://colorlisa.com/).

## Installation

You can install `lisa` from GitHub with `devtools`:

``` r
devtools::install_github("tylurp/lisa")
```

## Palettes

Here’s a sample of the available palettes:

``` r
library(lisa)

par(mfrow = c(6, 3))
lapply(sample(lisa, 18), plot)
```

<img src="man/figures/README-example1-1.png" width="100%" />

You can also call and/or modify palettes using `lisa_palette`:

``` r
x <- lisa_palette("JackBush_1", n = 100, "continuous")
plot(x)
```

<img src="man/figures/README-example2-1.png" width="100%" />

## Acknowledgements

  - [**colorlisa**](http://colorlisa.com/) for the color palettes
  - The [`wesanderson`](https://github.com/karthik/wesanderson) package
    for source code that powers pretty much everything in this
    repository.
