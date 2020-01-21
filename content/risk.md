---
title: "Risk Assessment"
parent: "valid"
---

Contributed R packages are developed by anyone and may differ in popularity and accuracy. 

Assessing the accuracy of a contributed open-source R package should be done via risk assessment. The term *risk* refers to the risk of an error in the code that, when used appropriately, could lead to an incorrect calculation. This incorrect calculation may lead to an incorrect decision during data analysis. The relative impact of an error should be determined by the individual organisation. Impact is therefore not considered as part of the risk assessment.

RValidationHub developed an R package titled [`riskmetric`](https://pharmar.github.io/riskmetric/articles/riskmetric.html) (under development). The goal of `riskmetric` is to assess the risk of contributed R packages. `Riskmetric` has four groups of metric criteria:

* Unit testing metrics - includes unit test coverage and composite coverage of dependencies
* Documentation metrics - availability of vignettes, news tracking, example(s) and return object description for exported functions
* Community engagement - number of downloads, availability of the code in a public repository, formal bug tracking and user interaction
* Maintainability and reuse - number of active contributors, author / maintainer contacts, and type of license


For a comprehensive list of metrics, see [Metric Development - Github](https://github.com/pharmaR/riskmetric/projects/1).

## Interested in supporting package development?

* Contribute your implementation of a new or previously posed metric. For information about extending the functionality of `riskmetric` with your own metrics, see [Extending `riskmetric`](https://pharmar.github.io/riskmetric/articles/extending-riskmetric.html).
* Take part in the [discussion](https://github.com/pharmaR/riskmetric/issues?q=is%3Aopen+is%3Aissue+label%3A%22Metric+Proposal%22)
* [Propose a new metric](https://github.com/pharmaR/riskmetric/issues/new?labels=Metric%20Proposal)
