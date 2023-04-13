Error Fixing for the package
================
Kundan Kumar
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

**Solution:**

The error, i am getting Error in `purrr::map()`: ℹ In index: 1. Caused
by error: ! HTTP error 401. Bad credentials

Rate limit remaining: 59/60 Rate limit reset at: 2023-03-29 03:21:47 UTC

Describe your experience below. Push this blog post to your blog-9 repo.
Make sure the front matter check passes.

**Which error or warning did you fix? … and how?** I tried fixing the
error by setting the key the github but it is not working. I am not sure
what causing the error.I have key set up earlier,it is working fine for
others.

Error: Consider adding importFrom(“utils”, “download.file”, “write.csv”)
to your NAMESPACE file.

Finally, I fixed the error and able to fix few warning and notes check
for Team3.

1.  I have changed separate(Call_Received_Date_Time) function to
    separate(‘Call_Received_Date_Time’) as it is unable to recognize the
    variable globally.

2.  I have included the few imports and param in the R file like \#’
    @importFrom utils download.file

\#’ @importFrom magrittr %\>%

\#’ @importFrom lubridate ymd_hms

\#’ @importFrom pdftools pdf_text

\#’ @importFrom stringr str_replace_all

\#’ @param pdf name of pdf with data

\#’ @param save_as optional for saving a csv file

This helps to fix the 2 notes to 0 notes , but unable to fix the 2
warning.
