All For One
================
Logan Johnson
2023-03-30

<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->

[![Frontmatter
check](../../actions/workflows/check-yaml.yaml/badge.svg)](../../actions/workflows/check-yaml.yaml)
<!-- badges: end -->

## Prompt:

Fix one of the problems in one of our community packages at
`https://github.com/Stat585-at-ISU/lab-3-all-all-for-one-and-one-for-all`,
and write about it.

## Instructions:

What we want to know is the **exact** warning or error message of the
item you fixed, and a description of what you did, also as specific as
possible.

Describe your experience below. Push this blog post to your blog-9 repo.
Make sure the front matter check passes.

**Which error or warning did you fix? … and how?**

The error messages that I fixed were within the Team2 package and
included various import requirements in NAMESPACE and the DESCRIPTION
files. To fix these issues, I added in the “@importFrom” component to
the function to the pdf_to_tbl package for the utils and magrittr
packages for the write.csv and %\>% functions, respectively. I also
added the libraries to the functions that were called within the R
package to make more clear where each function is intended to be pulled
from. I then documented these changes and loaded the package again.

There was also an issue in the pdf_to_tbl function where “.,” as a
global variable was not defined. In this instance, I simply removed the
“.,” from the pdf_to_tbl function as the data was already being piped
from the area above and the “.,” notation was not necessary.

I also fixed two issues that I found when running the package. I removed
the exact url from the input section of the function and instead put it
at the top of the area within the section. I also changed the format of
the save_as function and instead removed the “./data/” part of the
save_as function to improve the saving of the pdf files.
