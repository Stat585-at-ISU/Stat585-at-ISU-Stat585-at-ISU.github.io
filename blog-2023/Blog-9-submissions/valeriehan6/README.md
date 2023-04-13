Fixing a note
================
Valerie Han
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

I fixed a note in Team 2’s package. The note was

    checking top-level files ... NOTE
      Non-standard file/directory found at top level:
        ‘presslog_amespd_2023-03-07.pdf’

I looked up the note on Google and found a [Stack Overflow
post](https://stackoverflow.com/questions/48955103/non-standard-file-directory-found-at-top-level-readme-rmd-persists-even-after)
describing a similar issue. I then resolved the note by adding
`^presslog_amespd_2023-03-07\.pdf$` to the `.Rbuildignore` file.
