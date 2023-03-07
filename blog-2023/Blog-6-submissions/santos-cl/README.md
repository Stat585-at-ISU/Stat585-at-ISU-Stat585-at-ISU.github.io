R env
================
Caio dos Santos
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

2.  **In 50 to 100 words describe your experience working with `renv`.
    What went well? What did not go so well?**

Submit this blog post to your blog-6 repo.

# The idea behind the renv package

The package was designed to allow R users to manage their project
dependencies. This allows users to manage their r packages separately
for each project, improving reproducibility and reliability of the code.
The ***renv*** package allows users to lock the versions of their
dependencies for each project, decreasing the chances of a script
crashing after updating a package. Other languages, such as Python, have
similar frameworks of virtual environment.

# My experience with renv

Overall, it was quick and easy to set up. The *renv.lock* file contains
all the dependency versions that need to be recorded. When initializing
the environment, the ***renv*** package checks the dependencies and sets
up a folder for the project libraries. I believe this will make code
much more reproducible.
