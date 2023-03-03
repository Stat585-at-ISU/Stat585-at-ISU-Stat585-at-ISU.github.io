
![Frontmatter
check](https://github.com/Stat585-at-ISU/Blog-5-HarunCelikOtto/actions/workflows/check-yaml.yaml/badge.svg)

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
    
    For this question, I chose the featured news "Journal investigating Sodom
    comet paper for data problems" to review. I figured that because it involved
    archaeology that I could also have something to say about the methodology of
    original data collection involved. It turns out that there is honestly not much
    to say besides that there was very clear manipulation of archaeological records
    used in the publication. In short, the authors of this article manipulated 
    archaeological documentation and mislabeled valid images and simulations to support
    their hypothesis that a comet destroyed an ancient city. Sandve's recommendation 
    of clear documentation is critical in archaeology since an excavated site can never be restored
    to its original state afterwards. For this reason, the excavation must be planned 
    meticulously and executed methodically. In the case of the excavation, the original
    documentation seems to be methodologically sound with the original data being altered
    significantly to suggest the evidence that it has in the published article.
    
    Sandve's article rightfully assumes that academic fraud is not involved in the
    making of a publication so the revelance is a little lost in respect to the article
    above. Nevertheless, The rule I think that is most relevant here would probably be regarding
    the "Avoid Manual Data Manipulation Steps" (Rule 2). Sandve's recommendation is obviously
    for cases regarding the manipulation of data for non-fraudulent cases, but if
    the data was better reviewed in terms of all the manual image "touch ups" which were
    supposedly done, then the falsity of the claims would probably have been revealed earlier. 
    The author whose simulation results were misrepresented also indicates that no raw data 
    is provided by the fradulent authors for result reproducibility and this clearly relates to the 
    "Always Store Raw Data behind Plots" (Rule 7) in Sandve's list. As a reviewer, demanding
    reproducibility in the data and the exact changes underlying the image altering
    would have been sufficient reasons to retract this article.
    
    

2.  After reading the paper by Sandve et al. describe which rule you are
    most likely to follow and why, and which rule you find the hardest
    to follow and will likely not (be able to) follow in your future
    projects.
    
    After reading the paper, I've come to full agreement that manually
    changing data is often more detrimental than helpful when working with
    data in programs like R. I've encountered countless times where changing
    the original data has altered my code outputs without me being aware of them
    immediately. These are serious issues in the validity of research and I think
    they could be avoided quite simply taking the time to make those manipulations
    in R. Sometimes it really is easier to make the changes in a program like
    Excel but I think that if a lot of manual changes are in order, then that is 
    representative of poor data structure in the original collection.
    
    The rule I have the most difficulty with is "Recording All Intermediate Results, 
    When Possible in Standardized Formats" (Rule 5). I think the difficulty stems
    from how dynamic the workflow can be in exploratory analysis. I find
    that I write a lot of code to examine data that a lot of the times shouldn't make
    the final cut in the process of reproducibility. Taking the time to document
    all of those steps to find that they'll be deleted is very time consuming and exhausting 
    especially with regards to how cruel publication and project deadlines can be. I do of 
    course make the effort to be as careful as possible but errors are bound to happen.
    

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
