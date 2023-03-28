Building a website
================
Valerie Han
2023-03-23

<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->

[![Frontmatter
check](../../actions/workflows/check-yaml.yaml/badge.svg)](../../actions/workflows/check-yaml.yaml)
<!-- badges: end -->

## Prompt:

GitHub is an incredibly useful tool for project management and
collaboration. It also has several useful features for professional
promotion: you can host your own site on github using [GitHub
pages](https://pages.github.com/), describe yourself using a GitHub
developer profile, and even use
[resume.github.io](http://resume.github.io/) to generate a resume
summary of your activity on GitHub (you must opt-in by [starring the
project page](https://github.com/resume/resume.github.com)).

posit and the associated package infrastructure provide multiple ways to
generate websites using Quarto (or Rmarkdown). You can complete this
assignment using one of the two options detailed in [Prompt
8](https://stat585-at-isu.github.io/blog-2023/Prompts/Blog-8/Prompt.html)

Describe your experience creating your website below. Don’t forget to
link to your website! Push this blog post to your blog-8 repo. Make sure
that all of the checks are passing.

**How did building your own website go?**

Here’s my website: <https://valeriehan6.github.io/>.

I chose to use Quarto. The website building itself wasn’t too bad since
it felt pretty similar to RMarkdown and the changes I made to the layout
were straightforward. However, I got frustrated when I was trying to
figure out how to publish the website from Github. The rendering to
`docs` method did not work for me. I tried re-organizing my file
structure to get it to work and added `.nojekyll` files in each layer
just to see if it wasn’t checking it in the git root directory, but it
still only displayed the default page generated from the `README.md`
file. I then tried the other method of publishing. Luckily, that method
worked after only minor debugging.
