---
title: "Risk Assessment"
parent: "valid"
---

Contributed R packages are developed by anyone and may differ in popularity and accuracy. 

Assessing their accuracy of a contributed open-source R package should be done via risk assessment. The term, *risk* refers to the risk of an error in the code that, when used appropriately, could lead to an incorrect calculation and hence an incorrect decision when analyzing pharmaceutical data. The relative impact of an error should be determined by the individual organisation. Impact is therefore not considered as part of the risk assessment.

There is a R package with the working title [`riskmetic` under development](https://pharmar.github.io/riskmetric/articles/riskmetric.html), which has the goal to implement the risk assessment for contributed R packages. The risk assessment has been grouped into four areas:

* Unit testing metrics including unit test coverage and composite coverage of dependencies,
* Documentation metrics, e.g. availability of vignettes, news tracking, example(s) and return object description for exported functions,
* Community engagement, e.g., number of downloads, availability of the code in a public repository, formal bug tracking and user interaction
* Maintainability and reuse, e.g., number of active contributors, author / maintainer contacts, and type of license.

A comprehensive list with more details and the ongoing discussion can be found on [github](https://github.com/pharmaR/riskmetric/projects/1). `riskmetric` is designed to be readily extensible.

If you are interested to support the package development

* Contribute your implementation of a new or previously prosed metric. Check out the [`extending-riskmetric` vignette](https://pharmar.github.io/riskmetric/articles/extending-riskmetric.html) to see how to extend the functionality with your own metrics. 
* Take part in the [discussion](https://github.com/pharmaR/riskmetric/issues?q=is%3Aopen+is%3Aissue+label%3A%22Metric+Proposal%22)
* Propose a new metric on the [`riskmetric` GitHub](https://github.com/pharmaR/riskmetric/issues/new?labels=Metric%20Proposal)
