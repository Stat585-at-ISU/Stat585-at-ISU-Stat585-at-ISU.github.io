---
author: Yunhui Qi
title: Post Selection Inference of Estimation from Penalized Matrix Decomposition
topic: "Presentations"
layout: post
root: ../../../
---

Penalized matrix decomposition (PMD) has been used as a multivariate analysis tool in many disciplines such as precision medicine, integrative omics data analysis. However, since it is an estimation tool, its accuracy ic not guaranteed. We developed a set of tests so that we can do the post selection inference on the estimation from PMD. In this package TestPMD, we focus on sparse canonical correlation analysis using PMD. This package provides functions for estimation, test of canonical correlations, test of the canonical loadings, visualization using scatter plot, bar plot and fisher exact test for group enrichment analysis. Users can therefore decide the dimension used for downstream analysis, which feature truly contributes to the canonical component and how these results relate to the covariates.  For some statisticians, it is not easy to gain biological insights from the identified features due to the complex name of molecules. So, we provide a search tool which can be used to pull the top 5 papers from PubMed  by searching the feature names.  A shiny app is created to facilitate the use of TestPMD.
