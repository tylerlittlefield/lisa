
<!-- README.md is generated from README.Rmd. Please edit that file -->

# lisa

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/tyluRp/lisa.svg?branch=master)](https://travis-ci.org/tyluRp/lisa)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/tyluRp/lisa?branch=master&svg=true)](https://ci.appveyor.com/project/tyluRp/lisa)
<!-- badges: end -->

This is a color palette R package that contains 128 palettes from
[**Color Lisa**](http://colorlisa.com/).

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
x <- lisa_palette("JackBush_1", n = 1000, "continuous")
y <- lisa_palette("KatsushikaHokusai", n = 1000, "continuous")
lapply(list(x, y), plot)
```

<img src="man/figures/README-example2-1.png" width="100%" /><img src="man/figures/README-example2-2.png" width="100%" />

Finally, all palettes have 3 attributes associated with them: *class*,
*name*, and *work*:

``` r
sample(lisa, 3)
#> $RoyLichtenstein_1
#> [1] "#00020E" "#FFDE01" "#A5BAD6" "#F1C9C7" "#BD0304"
#> attr(,"class")
#> [1] "lisa_palette" "character"   
#> attr(,"name")
#> [1] "RoyLichtenstein_1"
#> attr(,"work")
#> [1] "Hopeless"
#> 
#> $RichardDiebenkorn
#> [1] "#2677A5" "#639BC1" "#639BC1" "#90A74A" "#5D8722"
#> attr(,"class")
#> [1] "lisa_palette" "character"   
#> attr(,"name")
#> [1] "RichardDiebenkorn"
#> attr(,"work")
#> [1] "Seawall"
#> 
#> $BillyApple
#> [1] "#F24D98" "#813B7C" "#59D044" "#F3A002" "#F2F44D"
#> attr(,"class")
#> [1] "lisa_palette" "character"   
#> attr(,"name")
#> [1] "BillyApple"
#> attr(,"work")
#> [1] "Rainbow"
```

## Acknowledgements

  - [**Color Lisa**](http://colorlisa.com/) for the color palettes
  - The [`wesanderson`](https://github.com/karthik/wesanderson) package
    for source code that powers pretty much everything in this
    repository.
