Ethics and Reproducibility…
================
Parvin Mohammadiarvejeh
2023-02-23

![Frontmatter
check](https://github.com/Stat585-at-ISU/Blog-5/actions/workflows/check-yaml.yaml/badge.svg)

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

Parvin’s answer: From the Retraction Watch website, among the top 10
most highly retracted papers, I picked the paper with the title of
“Selective killing of cancer cells by a small molecule targeting the
stress response to ROS”. This paper has been retracted because of issues
and data availability related to Fig. 1d, and supplementary Fig. 31b.
Basically, these two figures shows the results of the experiments that
authors did; in the other words, authors summarized their results using
showing the associations by graphical figures. Unfortunately, the
authors did not provided the original data related to these two figures
when the Nature asked them. The fact of not providing the original
results of their experiment questioned the integrity and correctness of
this study. Some of the authors agreed with the retraction while rest of
the authors never reply to this letters. Based on the article with the
tittle of “Ten Simple Rules for Reproducible Computational Research”, I
think rule number 7 which is “Always Store Raw Data behind Plots” is the
first helpful rule to this study. If the authors had saved the raw data
related to the plots, they could share them. Then, possibly rule number
5 which is “Record All Intermediate Results, When Possible in
Standardized Formats” could help them to have the intermediate and final
results to defend from themselves. Then, rule number 10 which is
“Provide Public Access to Scripts, Runs, and Results” could prevent any
problem or suspicions related to the experiments.

2.  After reading the paper by Sandve et al. describe which rule you are
    most likely to follow and why, and which rule you find the hardest
    to follow and will likely not (be able to) follow in your future
    projects.

Parvin’s answer: I always follow all the rules except than rules number
4 and 10. For me, these two rules are not easy to follow because of some
reasons. About rule number 4, I sometimes need to update my R or
Anaconda version, or update some packages; keep tracking of theses
details for each research parts is not easy for me because I may forget
to do it while I am busy. About rule number 10, I often cannot publish
my scripts and data because most of data set I use are not public.
People must have grants and enrolled research projects, pay for the data
to have them. THerefore, publishing the codes and data is limited.

## Submission

1.  Push your changes to your repository.

2.  You are ready to call it good, once all your github actions pass
    without an error. You can check on that by selecting ‘Actions’ on
    the menu and ensure that the last item has a green checkmark. The
    action for this repository checks the yaml of your contribution for
    the existence of the author name, a title, date and categories.
    Don’t forget the space after the colon! Once the action passes, the
    badge along the top will also change its color accordingly. As of
    right now, the status for the YAML front matter is:

![Frontmatter
check](https://github.com/Stat585-at-ISU/Blog-5/actions/workflows/check-yaml.yaml/badge.svg)

    ---
    author: "Your Name"
    title: "Specify your title"
    date: "2023-02-23"
    categories: "Ethics and Reproducibility..."
    ---
