UC Berkeley’s Ninov 2.0
================
Not Charlie
2023-02-23

![Frontmatter
check](https://github.com/Stat585-at-ISU/blog-5-charlestbonk/actions/workflows/check-yaml.yaml/badge.svg)

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
    - The Retraction Watch article I chose to investigate is [Exclusive:
      Deepfake pioneer to lose two papers after misconduct finding of
      faked
      data](https://retractionwatch.com/2023/01/30/exclusive-deepfake-pioneer-to-lose-two-papers-after-misconduct-finding/#comment-2153368)
      for two main reasons: 1) a commentor uses “imho” and imho, “imho”
      should be used more and 2) the irony of it all. Hao Li worked at
      UC Berkeley, which is known for [Victor
      Ninov](https://www.chemistryworld.com/features/victor-ninov-and-the-element-that-never-was/3010596.article),
      a chemist who faked discovering Element 118 “Ninovium” (now known
      as Oganesson for the man who actually discovered the element) and
      ruined his entire career. If Li genuinely did not fake his data,
      he should have learned from the past and did more to ensure that
      his data was reproducible, and put more effort into letting people
      know the simulations were pre-constructed in the event of
      communication errors (like I don’t know, maybe slapping a
      watermark on the simulation that said “Hey, this is
      pre-constructed, we are having some issues rn with
      communicating”).
    - The steps he should have taken from Sandve et al. would be 1, 7,
      and 8. For “1 : For Every Result, Keep Track of How It Was
      Produced”, he could have simply included a log and held himself
      accountable for acknowledging that the simulations were
      pre-generated, rather than hiding that fact. Yes, he would have
      looked a little silly on stage admitting there was a communication
      bug, but less silly than what he looks now. “7 : Always Store Raw
      Data behind Plots” applies less to plots and more to the
      simulations. If the simulation was supposed to be real, show that
      it is real. That may not be always feasible with the magnitude of
      arrays needed to contain data for the entire image and simulation,
      but having it somewhat accessible and visible rather than hidden
      behind the curtain would have made him more creditable. Finally,
      “8 : Generate Hierarchical Analysis Output, Allowing Layers of
      Increasing Detail to Be Inspected” could be easily fixed by not
      including this debug output in the first place. Make sure that it
      works and then make sure that it works again. 10 times. And then,
      know how to fix the communication errors if they show up. He
      shouldn’t have banked on his debug code being a good safety net,
      assuming that it really was debug code.
    - Ideally, he would have made his script public, that way everyone
      could see it, work with it, and help debug if need be, but also
      the code was probably extremely expensive, so I do understand not
      following Rule 10.
2.  After reading the paper by Sandve et al. describe which rule you are
    most likely to follow and why, and which rule you find the hardest
    to follow and will likely not (be able to) follow in your future
    projects.
    - I already follow “Rule 4: Version Control All Custom Scripts” and
      “Rule 6: For Analyses That Include Randomness, Note Underlying
      Random Seeds” religiously. If I can think of any reason as to push
      my code to Git, I will. Even if it may not need to exist there, I
      will push it to be safe and protect myself from fat-fingering
      myself into failure. With Rule 6, if I don’t need the data to be
      truly random, I will set a seed, and run it with a few different
      randomly generated, but constant seeds, that way I can show it
      works with different numbers than my nicely picked seed.

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
check](https://github.com/Stat585-at-ISU/blog-5-charlestbonk/actions/workflows/check-yaml.yaml/badge.svg)

    ---
    author: "Your Name"
    title: "Specify your title"
    date: "2023-02-23"
    categories: "Ethics and Reproducibility..."
    ---
