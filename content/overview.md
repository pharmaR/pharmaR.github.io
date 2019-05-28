+++
title = "Validation Overview"
parent = "valid"
+++

**THE FOLLOWING TEXT IS DRAFT ONLY**

For statistical analyses, the process of validation ensures quality output.

According to the FDA's [Glossary of Computer System Software Development Terminology](https://www.fda.gov/iceci/inspections/inspectionguides/ucm074875.htm):

**Validation:** Establishing documented evidence which provides a high degree of assurance (*accuracy*) that a specific process consistently (*reproducibility*) produces a product meeting its predetermined specifications (*traceability*) and quality attributes.

Since the [FDA does not require use of any specific software for statistical analyses](https://www.fda.gov/media/109552/download), the programming language R can be used if the R installation incorporates all of the following elements:

1. Accuracy 
2. Reproducibility
3. Traceability

R Validation Hub outlines how to assess the **accuracy** of R packages, and how to ensure the **reproducibility** and **traceability** of R installations.

## Accuracy of R packages

When assessing the accuracy of R packages, the R Validation Hub differentiates R packages by the following types (see German et al, 2013[^1]): 

* base and recommended (core) packages - developed by the R Foundation and shipped with the basic installation
* contributed (open source) packages - developed by anyone, and may differ in popularity and accuracy

![source: German et al (2013): The Evolution of the R Software Ecosystem](/img/overview/German-et-al.png)

Core packages and contributed packages are managed by different processes. Therefore, different requirements are needed to ensure that both types of packages reliably produces accurate results. 

### Base R and Recommended Packages

The R Foundation develops both the base and recommended packages, and follows practices that ensures the accuracy of each. These practices include:

* Proper maintenance of the R source code, and control of releases
* Testing the software and identifying issues for the Core Team to address
* The R Core Team hiring highly qualified individuals
* Validation testing each R release against known data and known results, and resolving all errors prior to release

After careful consideration, the R Validation Hub concludes that there is minimal risk using these core packages for regulatory analysis and reporting. For more information, see [Base R and Recommended R Packages](../base).

### Contributed Packages

Since R is Open Source, contributed packages can be developed by anyone. Therefore, ensuring the accuracy of each contributed package is necessary.

R Validation Hub focuses on contributed packages on The Comprehensive R Archive Network (CRAN). All packages available on CRAN must pass a series of technical checks including an “R CMD” check. An “R CMD” check ensures that all submitted code’s:

* examples run successfully
* tests pass
* packages are compatible with other packages on CRAN

However, these checks do not guarantee the accuracy of a package and a risk assessment is necessary. The risk assessment proposed by the R Validation Hub includes:

1. Package Maintenance
   * release rate
   * size of code base
   * formal bug tracking
2. Community Usage and Testing 
   * average downloads during in the last 12 months 
   * the amount of code that is tested by a formal testing framework

For more information about Package Maintenance and Community Usage and Testing, see
 [R Packages](../packages) page. 

### Tidyverse

According to (https://www.tidyverse.org/):

*The tidyverse is an opinionated [collection of R packages](https://www.tidyverse.org/packages) designed for data science. All packages share an underlying design philosophy, grammar, and data structures.*

Furthermore, the tidyverse is governed by a set of [Design Principles](https://principles.tidyverse.org/) that are used by the tidyverse team for consistency and to write better code.

Since tidyverse is held to such high standards and has a large user community, the R Validation Hub members are discussing if tidyverse can be labelled as minimal risk for regularly analysis and reporting.


## Reproducibility of R installations

To ensure that R outputs can be reproducible, create and maintain R installations by using Docker containers and tools such as RStudio Package Manager.

As R versions and package versions change over time, creating and maintaining R installations becomes more complex. As versions are updated, define a process that checks and tests package integrity with dependencies.

**Please note that investigation of reproducability is ongoing.**


## Traceability of R installations

Develop system and process controls to automatically document the R packages and installation dependencies that are used in R analyses.

**Please note that investigation of traceability is ongoing.**


[^1]: German, D.M. & Adams, Bram & Hassan, Ahmed E.. (2013). The Evolution of the R Software Ecosystem. Proceedings of the Euromicro Conference on Software Maintenance and Reengineering, CSMR. 243-252. 10.1109/CSMR.2013.33. 


