It’s not the end…
================
An Phan
2023-03-09

<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->

[![Frontmatter
check](../../actions/workflows/check-yaml.yaml/badge.svg)](../../actions/workflows/check-yaml.yaml)
[![Render
rmarkdown](../../actions/workflows/render-rmarkdown.yaml/badge.svg)](../../actions/workflows/render-rmarkdown.yaml)
<!-- badges: end -->

## Prompt:

The `DESCRIPTION` file of a package contains the package’s meta
information. Most of the fields in this file are quite straight forward:
author, version number, and a short package description. When you call
`library(help="<package name>")` for package `<package name>` you can
see the contents of the `DESCRIPTION` file for that package (and some
parts of the `NAMESPACE` file).

Read through Colin Fay’s (short) book on [Licensing
R](https://thinkr-open.github.io/licensing-r/)

Write a blog post addressing the following questions:

``` r
library(rmarkdown)
```

### Under what license does R operate? What is the license for ggplot2?

R operates under many licenses, including `GPL-2 | GPL-3` (General
Public License, version 2 and 3), all of which are listed
[here](https://www.r-project.org/Licenses/) or in [Licensing
R](https://thinkr-open.github.io/licensing-r/rworld.html#package-licenses).

ggplot2 is MIT-licensed as stated on [CRAN
documentation](https://cran.r-project.org/web/packages/ggplot2/index.html)

### What are the dependencies of the package you made?

Read through [chapter 5.2 of Licensing
R](https://thinkr-open.github.io/licensing-r/practical.html#dependencies-exploration).

#### Combine and adjust the code pieces to create the dependencies for a package that is on github rather than CRAN. (Don’t forget about the package `desc`.)

``` r
## Get all information on CRAN packages
# install.packages("pkgnet")
library(pkgnet)
pkgdb <- tools::CRAN_package_db()

## Filter dependencies: input a list of package names, output a dataframe of these packages' information on CRAN
extract_from_cran_db <- function(pkg_names, pkgdb){
  pkgdb %>%
    as_tibble(.name_repair = "universal") %>%
    filter(Package %in% pkg_names)
}
```

#### What dependencies does the package have that you created for Lab-3?

Because our package is not on CRAN, we need `desc` to extract the
dependencies.

``` r
## Do the following in our team's package repo, load `plogdeps` and `plCRAN` dataframe here
load("Lab-3-UNL-dependencies.RData")
# plogdeps <- desc::desc_get_deps(file="PressLogTeamUNL/")
plogdeps
```

    ##      type   package  version
    ## 1 Depends         R  >= 2.10
    ## 2 Imports lubridate        *
    ## 3 Imports     purrr        *
    ## 4 Imports tabulizer >= 0.2.3
    ## 5 Imports     dplyr        *
    ## 6 Imports     readr        *

``` r
# plCRAN <- extract_from_cran_db(plogdeps$package, pkgdb)%>%
#  select(Package,Version,Depends,License,License_is_FOSS,License_restricts_use)
plCRAN
```

    ##     Package Version             Depends            License License_is_FOSS
    ## 1     dplyr   1.1.0        R (>= 3.4.0) MIT + file LICENSE            <NA>
    ## 2 lubridate   1.9.2 methods, R (>= 3.2)         GPL (>= 2)            <NA>
    ## 3     purrr   1.0.1        R (>= 3.4.0) MIT + file LICENSE            <NA>
    ## 4     readr   2.1.4          R (>= 3.5) MIT + file LICENSE            <NA>
    ##   License_restricts_use
    ## 1                  <NA>
    ## 2                  <NA>
    ## 3                  <NA>
    ## 4                  <NA>

#### Which licenses are involved? Are all of these dependencies required? Elaborate.

6 dependencies are reported using `desc` package:

- Base R is required
- Imports (as shown in **plCRAN**): `lubridate` (GPL \>= 2), `purrr`,
  `dplyr`, `readr` (MIT licensed for these 3 pacakges)
- `tabulizer` also needs to be imported (as shown in **plogdeps**), but
  this package is not on CRAN so it is not found in CRAN **pkgdb**.
  `tabulizer` is also under MIT license as shown in this
  [documentation](https://docs.ropensci.org/tabulizer/)

#### Under which license should this blog post be published? Make sure that you are using an appropriate license. (You can change the current licenses with the help of commands from the `use_license_XXX` family in the `usethis` package)

According to the book, blog posts are also copyrighted and *the content
should be licensed in a way that allows others to reuse (or not reuse)
your work*. For example, answeres on StackOverflow (what we did in
Blog 1) is released in `CC-BY-SA 3.0`. So I’m guessing this blog post
should be licensed similarly.

``` r
usethis::use_ccby_license()
```

    ## ✔ Setting active project to '/home/ahphan/Downloads/blog-7-anphan0828'

### Can I publish an R package on CRAN under an MIT license when I have a dependency on a package that is licensed under GPL-3?

When confronted with the above question, ChatGPT gave two – quite
different – responses, as shown below. The main point in both responses
is ‘your package may be considered derivative work’. At the specific
problem of the package developed for Lab 3, what is your opinion about
potential copyright infringements when releasing the package with an MIT
license? Make sure to take the relevant passage in Colin Fay’s book
under consideration.

    The legal implications of publishing an R package on CRAN under an MIT license while having a dependency on a package that is licensed under GPL-3 are complex and can vary depending on the specific circumstances. It is always advisable to seek legal advice from a licensed attorney if you have any doubts or concerns about licensing issues.

    However, in general, it is possible to publish an R package on CRAN under an MIT license when you have a dependency on a package that is licensed under GPL-3. This is because the MIT license is a permissive open-source license that allows for more flexibility in how the software can be used and distributed, and it is generally considered compatible with the GPL-3 license.

    That being said, if your package depends on a GPL-3-licensed package, your package may be considered a derivative work and therefore subject to the terms of the GPL-3 license. This means that if you distribute your package, you may need to also distribute the source code for your package under the GPL-3 license or a compatible license, and you may need to ensure that the requirements of the GPL-3 license are met for the entire distribution, including any dependencies.

    It is also worth noting that the R community has its own guidelines and recommendations for package licensing, and it is important to comply with these guidelines if you want to publish your package on CRAN. The CRAN Repository Policy states that packages should have a "permissive" or "GPL-compatible" license, but does not explicitly require that packages use the GPL license or any other specific license.

    In summary, while it is possible to publish an R package on CRAN under an MIT license while having a dependency on a package that is licensed under GPL-3, it is important to understand the implications of the different licenses and to ensure that you comply with any applicable guidelines and recommendations from the R community.

After harping a bit on copyright infringement in general, ChatGPT
changed its response to

    Technically, you can publish an R package on CRAN under an MIT license when you have a dependency on a package that is licensed under GPL-3, but doing so would not be compliant with the terms of the GPL-3 license.

    The GPL-3 license is a strong copyleft license that requires derivative works to be released under the same license. If your package depends on a GPL-3-licensed package, your package may be considered a derivative work and therefore must be licensed under the GPL-3 license or a compatible license.

    The MIT license, on the other hand, is a permissive license that allows for more flexibility in how the software is used and distributed. However, it is not compatible with the GPL-3 license, and therefore cannot be used for derivative works of GPL-3-licensed software.

    Publishing an R package on CRAN under an MIT license when you have a dependency on a package that is licensed under GPL-3 would be a licensing violation, and could potentially result in legal action or other consequences. It is important to comply with the licensing requirements of all dependencies in your package to avoid any legal issues.

The ‘harping’ questions:

- Is it legal to publish an R package on CRAN under an MIT license when
  I have a dependency on a package that is licensed under GPL-3?

- Is it illegal to publish an R package on CRAN under an MIT license
  when I have a dependency on a package that is licensed under GPL-3?

- Is it a copyright infringement to publish an R package on CRAN under
  an MIT license when I have a dependency on a package that is licensed
  under GPL-3?

- Can I publish an R package on CRAN under an MIT license when I have a
  dependency on a package that is licensed under GPL-3 without
  infringing copyright?

#### My answer

*As we can see in this part of the GPL FAQ, “Linking a GPL covered work
statically or dynamically with other modules is making a combined work
based on the GPL covered work”. That would mean that, as R is GPL, any
work linking dynamically or statically to R would have to be GPL-based
also*

I got this from the book, but I am not sure if it means that if my
package dependency is licensed under GPL-3, my package has to be
licensed under GPL-3 also. I really struggled understanding these legal
stuff.

## Submission

Write answers to the questions directly into the file `README.Rmd`. Push
the blog post to your blog-7 repo. Make sure that all of the checks are
passing.
