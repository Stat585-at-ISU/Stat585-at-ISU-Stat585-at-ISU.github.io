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

I picked a research article “Optimization Method of Sports Service
Network Node Layout Based on Network Communication” in social science
area. The reasons for retraction are concerns about data, image and
unreliable data.

The journal “Security and Communication Networks” found out that a graph
that was unrelated to this paper was submitted to the journal, which had
appeared in several other submissions, all with text claiming to have
generated the graph. This raised the concerns about the authenticity of
data.

After communication, the authors claimed they had duplicated the graph
by accident, but could not provide their raw data or further evidence.

The rules “1. For Every Result, Keep Track of How It Was Produced”, and
“7. Always Store Raw Data behind Plots” can be helpful in this case. If
there is a clean record of data, code and generated files, this kind of
mistake may be avoided. Even if a submission mistake happens, there
could be evidence for the correctness of the results.

1.  After reading the paper by Sandve et al. describe which rule you are
    most likely to follow and why, and which rule you find the hardest
    to follow and will likely not (be able to) follow in your future
    projects.

Most likely to follow: Always Store Raw Data behind Plots. I store some
results as .RData files and put appropriate names to indicated what
plots/tables they generate. This avoids re-running the code and allows
me to check back easily. I should use this along with version control of
the code. Actually, I think I should store intermediate results too.
Sometimes I write too many steps as a single function and only output
the final result. This makes it hard to check the behavior of the
program.

Hard to follow: Archive the Exact Versions of All External Programs
Used. I don’t really know how to do this except recording the name and
version of the program.

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
