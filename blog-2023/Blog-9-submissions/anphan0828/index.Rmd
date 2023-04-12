---
output: github_document
title: "The painful green ticks"
author: An Phan
date: "2023-03-30"
categories: "Errors and warnings in packages"
---

<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->
[![Frontmatter check](../../actions/workflows/check-yaml.yaml/badge.svg)](../../actions/workflows/check-yaml.yaml)
<!-- badges: end -->

## Prompt:

Fix one of the problems in one of our community packages at `https://github.com/Stat585-at-ISU/lab-3-all-all-for-one-and-one-for-all`, and write about it. 

**Which error or warning did you fix? ... and how?**

I chose Team2's package to fix and enjoyed the pain. I used `devtools` to install, load, document, check, and repeated all over again.

First try, 2 notes (seems easy to solve!):

- Non-standard file/directory found at top level: easy, put the `.pdf` extension in .Rbuildignore
- Undefined global functions or variables: `%>% . download.file presslog_ames write.csv`. I went to each R source file and added `@importFrom` (e.g., purrr %>%, utils download.file, utils write.csv), then rerun `devtools::document()` to update the `NAMESPACE` file. For the dot ("."), I could not figure out which package it came from, so I had to edit the code to not use "." within an lapply function. For the `presslog_ames` dataset, it was not loaded into the environment before using, so I declared it.

Second try, 1 error (that is worse than 2 notes!):

- Namespace dependency missing from DESCRIPTION Imports/Depends entries: purrr. So, it gets imported previously, but the `DESCRIPTION` file did not have that information (I felt weird that `devtools::document()` only updates `NAMESPACE`, not `DESCRIPTION`. I went ahead and manually added `purrr` under **Imports**.

Third try, 1 warning (I'm getting there!!):

- Documented arguments not in \usage in documentation object 'get\_presslog': ‘df’. I wasn't sure about the @usage tag, so I just override the argument `df` passed into the function with the `presslog_ames` data (not the best way, but it works)

Fourth try (I lied, it took me way many more times to reach here but I only describe the main problems): SUCCESS!! 0 errors, 0 warnings, 0 notes!
