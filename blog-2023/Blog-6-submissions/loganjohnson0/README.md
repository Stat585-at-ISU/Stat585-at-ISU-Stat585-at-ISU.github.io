‘renv’ Package and Data Reproducibility
================
Logan Johnson
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

The renv package allows you to create different R libraries of different
packages. Essentially, this allows one to designate the specific package
version that is used in the workflow. This way, any new updates or
changes can be ignored because renv creates a project specific library
of packages and calls specific version of packages to avoid any changes
that may break or cause errors with previous code.

2.  **In 50 to 100 words describe your experience working with `renv`.
    What went well? What did not go so well?**

I think this package is a beneficial package. I think it helps to save
the version associated with the code as often times with various
updates, the package version number is likely to be the last thing that
might be remembered when working on the project. I had an easy time
getting it to work. A challenge was understanding what exactly the
package was doing, what the files it was saving were, and how to add
packages to the local library and work with that. I also had issues with
getting the GitHub Actions render-rmarkdown to run successfully. I
installed the “curl” through command line to get “libcurl” working.

Submit this blog post to your blog-6 repo.
