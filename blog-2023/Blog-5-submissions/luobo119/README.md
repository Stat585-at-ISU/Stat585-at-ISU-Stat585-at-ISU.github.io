Reproducible Computational Research
================
yc bai
2023-02-23

![Frontmatter
check](https://github.com/Stat585-at-ISU/blog-5-luobo119/actions/workflows/check-yaml.yaml/badge.svg)

## Prompt:

In May 2015 Science retracted - without consent of the lead author - a
paper on how canvassers can sway people’s opinions about gay marriage,
see also:
<http://www.sciencemag.org/news/2015/05/science-retracts-gay-marriage-paper-without-agreement-lead-author-lacour>
The Science Editor-in-Chief cited as reasons for the retraction that the
original survey data was not made available for independent reproduction
of results, that survey incentives were misrepresented and that
statements made about sponsorships turned out to be incorrect.<br> The
investigation resulting in the retraction was triggered by two Berkeley
grad students who attempted to replicate the study and discovered that
the data must have been faked.

[FiveThirtyEight](https://fivethirtyeight.com/features/how-two-grad-students-uncovered-michael-lacour-fraud-and-a-way-to-change-opinions-on-transgender-rights/)
has published an article with more details on the two Berkeley students’
work.

Malicious changes to the data such as in the LaCour case are hard to
prevent, but more rigorous checks should be built into the scientific
publishing system. All too often papers have to be retracted for
unintended reasons. [Retraction Watch](https://retractionwatch.com/) is
a data base that keeps track of retracted papers (see the related
[Science
magazine](https://www.sciencemag.org/news/2018/10/what-massive-database-retracted-papers-reveals-about-science-publishing-s-death-penalty)
publication).

Read the paper [Ten Simple Rules for Reproducible Computational
Research](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1003285)
by Sandve et al.

Write a blog post addressing the questions:

1.  Pick one of the papers from Retraction Watch that were retracted
    because of errors in the paper (you might want to pick a paper from
    the set of featured papers, because there are usually more details
    available). Describe what went wrong. Would any of the rules by
    Sandve et al. have helped in this situation?

The article ‘Inhaled Nitric Oxide Protects Cerebral Autoregulation and
Reduces Hippocampal Necrosis After Traumatic Brain Injury Through
Inhibition of ET-1, ERK MAPK and IL-6 Upregulation in Pigs’ has been
retracted. This article has problems with duplicated plots, identical
data found in an earlier publication, unclear descriptions of the
experiment conducted, and unmatched data of animals reported with the
surgical records.

The entire retraction details are as followed:

*The Editor-in-Chief has retracted this article on the request of
William M. Armstead. An institutional investigation by the University of
Pennsylvania found that images in Figures 6A, B, C, E and F duplicate,
without attribution, images in earlier publications that reported on
different experiments; numerical data, presented in the histogram of
Figure 6G, appeared identical to data found in earlier publications \[1,
2\]. The University notes that the authors were unable to provide raw
data supporting the results for Figure 6G; the methodology section of
the article did not accurately describe the conduct of the reported
experiment; and the number, age or treatment condition of the animals
reported did not match the surgical records.*

*Victor Curvello and William M. Amrstead agree to this retraction.
Philip Pastor and Monica S. Vavilala have not responded to any
correspondence from the editor or publisher about this retraction.*

The following rules might help:

- Rule 7: Always Store Raw Data behind Plots. It might help if they can
  raw data supporting the results for Figure 6G.

- Rule 9: Connect Textual Statements to Underlying Results. It might
  help if they have textual statements for all figures allowing peers to
  make their own assessment of the claims they make.

- Rule 10: Provide Public Access to Scripts, Runs, and Results.

2.  After reading the paper by Sandve et al. describe which rule you are
    most likely to follow and why, and which rule you find the hardest
    to follow and will likely not (be able to) follow in your future
    projects.

Rule 1 is most important to me, but I think Rule 1 is closely related to
other rules. Simulations and applications usually are important parts of
my research. For simulations, the setting of parameters is essential,
and sometimes random seeds (related to Rule 6) might also be needed to
reproduce the results that support the conclusion. For applications, the
accessibility of original data is important for reproducible results. So
providing public access to the input data and code like stating in Rule
10 is also important. And many cleaning steps might be needed for the
raw data in the application, so keep track of all details is a golden
rule to follow.

I think Rule 8 is hard to follow. Even though it is essential to check
the data behind the summarized results, it is hard for the co-authors
and readers to generalize useful information from these data. So I think
storing raw data behind the plots for reproducing as suggested in Rule 7
or connecting textual statements to underlying results as suggested in
Rule 9 is more useful. We might do this for self check, but a hypertext
as suggested in this rule seems unnecessary to me.

<!-- ## Submission -->
<!-- 1. Push your changes to your repository.  -->
<!-- 2. You are ready to call it good, once all your github actions pass without an error. You can check on that by selecting 'Actions' on the menu and ensure that the last item has a green checkmark. The action for this repository checks the yaml of your contribution for the existence of the author name, a title, date and categories. Don't forget the space after the colon! -->
<!-- Once the action passes, the badge along the top will also change its color accordingly.  -->
<!-- As of right now, the status for the YAML front matter is: -->
<!-- ![Frontmatter check](https://github.com/Stat585-at-ISU/blog-5-luobo119/actions/workflows/check-yaml.yaml/badge.svg) -->
<!-- ``` -->
<!-- --- -->
<!-- author: "Your Name" -->
<!-- title: "Specify your title" -->
<!-- date: "2023-02-23" -->
<!-- categories: "Ethics and Reproducibility..." -->
<!-- --- -->
<!-- ``` -->
