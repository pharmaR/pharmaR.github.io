---
title: 'Status Update: CRAN Release of `riskmetric`'
author: Juliane Manitz, Yilong Zhang and Doug Kelkhoff
date: '2021-04-02'
slug: status-update-riskmetric-cran
categories:
  - news
tags:
  - riskmetric
  - risk assessment
  - white paper
banner: 'img/banners/news.png'
---

We have reached a major milestone. The R package [`riskmetric`](https://pharmar.github.io/riskmetric/) has been released and is now available on CRAN. 

### What is riskmetric?

`riskmetric` is a collection of risk metrics to evaluate the quality of R packages following the framework suggested by the R validation hub (see our [white paper](https://www.pharmar.org/white-paper/) for details). 
Various quality metrics are provided which evaluate best practices of software development, code documentation, community engagement and development sustainability. This package serves as a starting point for exploring the heterogeneity of code quality, and begin a broader conversation about the validation of R packages. 

### How to use it?

We separate three steps in the workflow to assess the risk of an R package using riskmetric:

1. Finding a source for package information (installed package or CRAN/git source) `pkg_ref()`
2. Assessing the package under validation criteria `pkg_assess()`
3. Scoring assessment criteria `pkg_score()`

The results will be assembled in a dataset of validation criteria containing an overall risk score for each package

A detailed demo can be found in this [blogpost](https://www.pharmar.org/blog/2020/06/09/2020-06-02-riskmetric-intro-jun-2020/) from last year. 


### What comes next? 

The development of riskmetric continues and it is a community project. Comfort with a quantification of risk comes via consensus, and for that this project is dependent on close community engagement. There are plenty of ways to help:

* Share the package
* File issues when you encounter bugs
* Weigh in on proposed metrics, or suggest a new one
* Help us devise the best way to summarize risk into a single score
* Help us keep documentation up to date
* Contribute code to tackle the metric backlog

*If you are interested in getting involved in contributing to our technical efforts then please send an email to [psi.aims.r.validation@gmail.com](mailto:psi.aims.r.validation@gmail.com).  Or join our [mailing list](https://lists.r-consortium.org/g/RConsortium-Validation-Hub) to receive an invite to our quarterly meeting and receive notifications of new blog posts.*
