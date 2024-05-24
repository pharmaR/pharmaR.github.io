---
title: "Risk Assessment"
parent: "valid"
---

The R Validation Hub has develops & maintains useful tools that make the risk assessment approach proposed in our published [white paper](https://www.pharmar.org/white-paper/) much easier to adopt for R packages.

## Open-source tools

Though these tools likely won't encapsulate every aspect of your organization's end-to-end validation pipeline, we are constantly seeking to fill known gaps in the process. Thanks to partnerships with a sleuth of pharma organizations, these tools were designed to leverage [industry consensus](https://www.pharmar.org/casestudies/) and provide flexibility for customization when needed. We're proud that both `{riskmetric}` and `{riskassessment}` have claimed membership in the [{pharmaverse}](https://pharmaverse.org/) suite of packages.

<!--- remember to swap before publishing -->
<!--- ../static/img/risk/riskmetric_logo.png -->
<!--- ../static/img/risk/riskassessment_logo.png -->
<!--- ../static/img/risk/pharmaverse_logo.png -->

<br>

<center>
<a href="https://pharmar.github.io/riskmetric/">
<img src="/img/risk/riskmetric_logo.png" alt="riskmetric package" height = "172px;" style = "height:172px; padding-right: 50px;">
</a>
<a href="https://bit.ly/raa_docs">
<img src="/img/risk/riskassessment_logo.png" alt="riskassessment app" height = "172px;" style = "height:172px; padding-left: 50px; padding-right: 50px;">
</a>
<a href="https://pharmaverse.org/">
<img src="/img/risk/pharmaverse_logo.png" alt="pharmaverse suite" height = "172px;" style = "height:172px; padding-left: 50px;">
</a>
</center>


<br>

* `{riskmetric}` is a framework to quantify an R package's "risk" by assessing several meaningful metrics designed to evaluate package development best practices, code documentation, community engagement, and development sustainability. Users embrace an overall assessment of the package or rely solely on hand-picked metrics. 

* `{riskassessment}` is a full-fledged R package delivering a shiny front-end to augment the utility & adoption of `{riskmetric}`. The application's goal is to provide a central hub for an organization to review and assess the risk of R packages, providing handy tools and guide rails along the way. Specifically useful features include the ability to manage reviewer privileges, explore package source files hands-on, automate decisions based on pre-set rules, and generate a handy summary report to share.

* `{riskscore}` (hex logo not yet designed) is an experimental Github-only "data package" containing risk assessments & scores for every R package on CRAN or Bioconductor. This package exists to establish an easily retrievable trend of risk over time, useful for both `riskmetric` and `riskassessment` development workflows.

<br>

### {riskmetric}

Contributed R packages are developed by anyone & everyone, and may differ in popularity and accuracy. As such, the R Validation Hub developed an R package titled [`riskmetric`](https://pharmar.github.io/riskmetric/articles/riskmetric.html) whose goal is to assess the risk of contributed R packages.



 `{riskmetric}` has four groups of metric criteria:

* Unit testing metrics - includes unit test coverage and composite coverage of dependencies
* Documentation metrics - availability of vignettes, news tracking, example(s) and return object description for exported functions
* Community engagement - number of downloads, availability of the code in a public repository, formal bug tracking and user interaction
* Maintainability and reuse - number of active contributors, author / maintainer contacts, and type of license

Note: Even though the quality of software is sometimes measurable, sometimes it is not. For example, assessing the **accuracy** of a contributed open-source R package should be done outside of `{riskmetric}`. The term *accuracy* refers to the risk of an error in the code that, when used, could lead to an incorrect calculation. This incorrect calculation may lead to an incorrect decision during data analysis. The relative impact of an error should be determined by the individual organisation. Thus, impact is not a part of the risk assessment performed by `{riskmetric}`.

For a comprehensive list of metrics assessed via `{riskmetric}`, see the current state of our package [reference guide](https://pharmar.github.io/riskmetric/reference/index.html#package-assessment) or browse the [Metric Development Progress](https://github.com/pharmaR/riskmetric/projects/1) GitHub project.

#### Interested in supporting package development?

* Contribute your implementation of a new or previously posed metric. For information about extending the functionality of `riskmetric` with your own metrics, see [Extending `riskmetric`](https://pharmar.github.io/riskmetric/articles/extending-riskmetric.html).
* Take part in the [discussion](https://github.com/pharmaR/riskmetric/issues?q=is%3Aopen+is%3Aissue+label%3A%22Metric+Proposal%22)
* [Propose a new metric](https://github.com/pharmaR/riskmetric/issues/new?labels=Metric%20Proposal)
* [Fill out our survey](https://bit.ly/risk_survey) so we can learn how you use `{riskmetric}` and `{riskassessment}`


<br>

### {riskassessment}

The app's **main goal** is to help those making "package inclusion" requests for validated GxP environments. So, the highest and best of [`{riskassessment}`](https://bit.ly/raa_gh) revolves around two things:

* Empower members of your organization to embrace their responsibility to assess package risk themselves, prior to making uninformed IT requests like: "please add package xyz to our validated environment".

* Establish guide rails that adopt to your organizations validation strategy and use of `{riskmetric}` which culminates in a report for IT that summarizes each package's adherence to those inclusion requirements. 

The `{riskassessment}` app achieves that main goal with the following handy offerings:

-   Provides a platform for package exploration without the need to write any custom `{riskmetric}`
-   Runs `{riskmetric}` on the same machine with the same environment -- creating a central hub for reproducibility
-   Maintains consistent, org-specific settings/options when producing risk outputs
-   Automates a risk-based "decision triage" based on an org-defined set of rules, saving time & effort
-   Manages who's involved in the review process via user authentication & role management
-   Facilitates and stores user written summaries & communication, on certain packages and/or certain metrics
-   Generates risk summary reports, for sharing with the decision making parties

Below is a screenshot from the application's current [demo app](https://bit.ly/raa_demo), hosted on shinyapps.io. Feel free to give it a test ride and 

<br>

<!--- remember to swap before publishing -->
<!--- ../static/img/risk/uploaded_pkgs.png -->

<center>
<a href="https://bit.ly/raa_demo">
<img src="/img/risk/uploaded_pkgs.png" alt="riskassessment demo app" width = "90%;" style = "width:90%;">
</a>
</center>
<br>

#### Interested in supporting package development?

We could always use extra help / feedback! Please consider one of the following options:

* [Propose a feature](https://github.com/pharmaR/riskassessment/issues/new) for us to consider
* [Join the dev team](https://www.pharmar.org/contribute/) - extra hands make light work
* [Fill out our survey](https://bit.ly/risk_survey) so we can learn how you use `{riskmetric}` and `{riskassessment}`


<br>

### {riskscore}

A data package for cataloging riskmetric results across public repositories. WARNING: Right now, the [`{riskscore}`](https://github.com/pharmaR/riskscore) is in a PoC stage that is not fully operational. With that said, there are several use cases that make the concept of {riskscore} valuable, including (but not limited to) the following: it ...

* Guides more effective discussion around how to summarize risk
* Helps communicate changes to `{riskmetric}`'s summarizing algorithm or interpretations of assessment data
* Aids the `{riskmetric}` dev team in identifying "edge cases" for analysis and code refinement.
* Provides a channel to distribute handy tools for building `{riskmetric}` result data (ie, mimicking how our process for external packages could serve as a useful template for when comparing to internal or private repos).
* Allows everyone to report risk scores in terms of a "CRAN percentile" instead of just some arbitrary numeric value.
* Establishes a central repository for package scores, which can be used for many applications, like generating badge scores or trending in a package's score over time to measure performance.

With this type of data at your finger tips, you can analyze package risk statistics with plots like the following (below), which allocates packages into different subgroups based on developers membership in the tidyverse / pharmaverse and groups defined by "most downloads".

<br>

<!--- remember to swap before publishing -->
<!--- ../static/img/risk/risk_scores_by_group_all_cran.png -->

<center>
<a href="https://bit.ly/raa_demo">
<img src="/img/risk/risk_scores_by_group_all_cran.png" alt="All CRAN scored" width = "90%;" style = "width:90%;">
</a>
</center>

<br>

#### Interested in supporting package development?

We could always use extra help / feedback! Please consider one of the following options:

* [Propose a feature](https://github.com/pharmaR/riskscore/issues/new) for us to consider
* [Join the dev team](https://www.pharmar.org/contribute/) - extra hands make light work
* [Fill out our survey](https://bit.ly/risk_survey) so we can learn how you use `{riskmetric}` and `{riskassessment}`


<br>
<br>


