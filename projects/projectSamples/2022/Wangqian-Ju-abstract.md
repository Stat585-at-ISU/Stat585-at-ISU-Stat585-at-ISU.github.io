---
author: Wangqian Ju, Zhili Qiao, Jinji Pang
title: Build modularized shiny app with ggpaintr
topic: "Presentations"
layout: post
root: ../../../
---

We here introduce an open-source R package ggpaintr, for building a modularized shiny app in the similar grammar of ggplot2. This package provides built-in modules for both ui and server side of a shiny app so that a shiny app with a graphical user interface for ggplot2 can be easily implemented. And users can write and provide their own modules to further extend and customize the package's functionality. A shiny app called ggpaintr_app is built with the ggpaintr package and included in the package. ggpaintr_app serves as a shiny app for those unfamiliar with the Grammar of Graphics or ggplot2 but want to create a plot using ggplot2. The corresponding ggplot2 R codes will also be provided once a plot has been created. Additionally, another shiny app called ggpaintr_iris_app is included in the package to showcase how to deploy the basic functionality of this package to build other shiny apps or packages.
