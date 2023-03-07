renv package
================
yc bai
2023-03-02

<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->

[![Frontmatter
check](../../actions/workflows/check-yaml.yaml/badge.svg)](../../actions/workflows/check-yaml.yaml)
[![Render
rmarkdown](../../actions/workflows/render-rmarkdown.yaml/badge.svg)](../../actions/workflows/render-rmarkdown.yaml)
<!-- badges: end -->

What happens when we change the Rmd file and commit?

In Blog 5 you had the first exposure to Github Actions. We just checked
frontmatter compliance (as we do for this round). You see that we have
added a second action - here, we are converting the Rmarkdown document
to a markdown file by running `render_rmarkdown` on Github. This action
passes successfully for this document. We want to do something similar
for blog \#4.

Now start reading …

Read the vignette [Introduction to
renv](https://rstudio.github.io/renv/articles/renv.html) for the `renv`
R package by Kevin Ushey.

Then do:

1.  **Install the R package `renv` on your local machine.**

2.  **In the project for blog 4, initialize the workflow used by the
    `renv` package.**

3.  **Add all dependencies to the environment (implicitly by installing
    all the depepndencies or explicilty by listing dependencies in a
    DESCRIPTION file).**

4.  **Add the `renv` folder to your blog 4 repository, and push the
    changes.**

5.  **Is the github action working? Read any potential error messages in
    the workflow and try to fix things. Make sure to check stackoverflow
    for help, don’t forget our Discussion board!**

Write a blog post addressing the following questions:

1.  **What is the idea of the renv package?**

‘renv’ package is a tool to help create project-local libraries. It
records all packages used in the project and also saved the states of
these libraries. It isolates the project library from the system
environment, which makes packages used in the project reproducible. By
using the ‘snapshot’ function, the state of the project’s library will
be saved in a lockfile. By using ‘restore’, the state of the project’s
library can be restored.

2.  **In 50 to 100 words describe your experience working with `renv`.
    What went well? What did not go so well?**

By following the workflow in ‘renv’ package website, I could
successfully create ‘renv’ folder and see the dependencies used in blog
4 in the ‘renv.lock’ file. I run into problems when I try to figure out
whether packages ‘dplyr’ and ‘plyr’ are recorded by using renv, but it
turns out that they are automatically recorded by using
‘renv::snapshot()’, and many other base R packages I didn’t know I used
have also been recorded.
