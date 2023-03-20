License
================
yc bai
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

### Under what license does R operate? What is the license for ggplot2?

R: GPL-2 \| GPL-3. The GNU General Public License, either Version 2,
June 1991 or Version 3, June 2007.

ggplot2: MIT + file LICENSE

### What are the dependencies of the package you made?

Read through [chapter 5.2 of Licensing
R](https://thinkr-open.github.io/licensing-r/practical.html#dependencies-exploration).
Combine and adjust the code pieces to create the dependencies for a
package that is on github rather than CRAN. (Don’t forget about the
package `desc`.)

#### What dependencies does the package have that you created for Lab-3?

R6, cli, dplyr, fansi, generics, glue, grDevices, graphics, lifecycle,
magrittr, methods, pillar, pkgconfig, rlang, stats, tibble, tidyselect,
utf8, utils, vctrs, withr, lubridate, timechange, purrr, bit, bit64,
clipr, crayon, ellipsis, hms, readr, tzdb, vroom, png, rJava, tabulizer,
tabulizerjars, tools

#### Which licenses are involved?

Apache License (== 2.0), file LICENSE, GPL-2, GPL-3, MIT + file LICENSE,
GPL (\>= 2), LGPL-2.1

#### Are all of these dependencies required? Elaborate.

No. For example in ‘tabulizer’ package, ‘png’ is one dependency, but we
only use ‘extract_tables’ function from ‘tabulizer’ package, which can
also work without ‘png’ package. So not all dependencies are required.
But when you install ‘tabulizer’ package, ‘png’ will be asked to be
installed.

#### Under which license should this blog post be published? Make sure that you are using an appropriate license. (You can change the current licenses with the help of commands from the `use_license_XXX` family in the `usethis` package)

GPL-3 since ‘Rmarkdown’ is needed in this blog.

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

#### The ‘harping’ questions:

- Is it legal to publish an R package on CRAN under an MIT license when
  I have a dependency on a package that is licensed under GPL-3?

No. There might be legal issue.

- Is it illegal to publish an R package on CRAN under an MIT license
  when I have a dependency on a package that is licensed under GPL-3?

No. By complying all the licensing requirements and getting the
permission from all the contributors, there may not be a legal issue.

- Is it a copyright infringement to publish an R package on CRAN under
  an MIT license when I have a dependency on a package that is licensed
  under GPL-3?

Yes. MIT is a permissive license and GPL-3 is strongly protective
license. There might be copyright infringement.

- Can I publish an R package on CRAN under an MIT license when I have a
  dependency on a package that is licensed under GPL-3 without
  infringing copyright?

Yes, I think you can change the license if all contributors agree and
there is no infringing copyright.

My opinion about this is that even though it is doable, it requires a
lot of extra work and it may take time and effort to get permission from
every and adjust everything to comply with the license requirement. So
it might be better to decide from the beginning about which license to
use.

## Submission

Write answers to the questions directly into the file `README.Rmd`. Push
the blog post to your blog-7 repo. Make sure that all of the checks are
passing.
