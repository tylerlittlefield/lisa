
<!-- README.md is generated from README.Rmd. Please edit that file -->

# lisa <img src="man/figures/logo.png" align="right" height=150/>

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/tyluRp/lisa.svg?branch=master)](https://travis-ci.org/tyluRp/lisa)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/tyluRp/lisa?branch=master&svg=true)](https://ci.appveyor.com/project/tyluRp/lisa)
[![CRAN
status](https://www.r-pkg.org/badges/version/lisa)](https://cran.r-project.org/package=lisa)
[![CRAN\_Download\_Badge](https://cranlogs.r-pkg.org/badges/lisa)](https://cran.r-project.org/package=lisa)
[![Codecov test
coverage](https://codecov.io/gh/tyluRp/lisa/branch/master/graph/badge.svg)](https://codecov.io/gh/tyluRp/lisa?branch=master)
<!-- badges: end -->

This is a color palette R package that contains 128 palettes from
[**Color Lisa**](http://colorlisa.com/).

<img src="man/figures/README-waffle-1.png" width="100%" />

## Installation

Install the released version of `lisa` from CRAN:

``` r
install.packages("lisa")
```

Or install the development version from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("tylurp/lisa")
```

If you aren’t an R user, you might be interested in
[palettes.yml](inst/extdata/palettes.yml) which contains all palettes in
[YAML](https://en.wikipedia.org/wiki/YAML) format.

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
x <- lisa_palette("JackBush_1", 1000, "continuous")
y <- lisa_palette("PabloPicasso", 2, "discrete")
z <- lisa_palette("KatsushikaHokusai", 1000, "continuous")
lapply(list(x, y, z), plot)
```

<img src="man/figures/README-example2-1.png" width="100%" /><img src="man/figures/README-example2-2.png" width="100%" /><img src="man/figures/README-example2-3.png" width="100%" />

All palettes have 3 attributes associated with them:

``` r
# shows the class, artist name, and name of work
attributes(lisa$VincentvanGogh)
#> $class
#> [1] "lisa_palette" "character"   
#> 
#> $name
#> [1] "VincentvanGogh"
#> 
#> $work
#> [1] "The Starry Night"

# attributes do not print by default
lisa$VincentvanGogh
#> [1] "#1a3431" "#2b41a7" "#6283c8" "#ccc776" "#c7ad24"

# there is also a data.frame with palette descriptions
head(artwork, 5)
#>              artist          palette                              work
#> 1      Josef Albers      JosefAlbers     Adobe (Variant): Luminous Day
#> 2      Josef Albers    JosefAlbers_1 Homage to the Square (La Tehuana)
#> 3 Gretchen Albrecht GretchenAlbrecht                      Golden Cloud
#> 4       Billy Apple       BillyApple                           Rainbow
#> 5       Per Arnoldi       PerArnoldi                              Spar
```

Example `ggplot2` usage:

``` r
library(ggplot2)

ggplot(mtcars, aes(mpg, disp)) + 
  geom_point(aes(col = factor(gear)), size = 3) + 
  scale_color_manual(values = lisa$`Jean-MichelBasquiat`) + 
  theme_bw()
```

<img src="man/figures/README-ggplot2-example-1.png" width="100%" />

## Acknowledgements

  - [**Color Lisa**](http://colorlisa.com/) for the color palettes
  - [`wesanderson`](https://github.com/karthik/wesanderson) for source
    code that powers most things in this repository
