---
author: Katherine Goode, Yonghui Huo, Jing Zhao, Kellie McClernon, Yudi Zhang
title: redres -  Redress Your Mixed Model Assumptions
topic: "Presentations"
layout: post
root: ../../../
---

We have created a package that takes random effect, or mixed, models fitted using lmer from the lme4 package and returns residual diagnostics. There are functions for calculating the marginal standardized residuals, conditional residuals, and generalized residuals. The user can look at residual plots for these residuals or any of the residuals also provided by lme4. In the Shiny app, the user can interact with the residual plots to identify outliers or other problematic observations and potential exploratory variables.
