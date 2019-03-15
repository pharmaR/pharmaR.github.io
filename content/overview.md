+++
title = "Validation Overview"
parent = "valid"
+++

**THE FOLLOWING TEXT IS DRAFT ONLY**

# Description

The FDA’s definition of validation specifies the need for high degree of assurance (*accuracy*) that a process consistently (*reproducibility*)  meets predetermined specifications (*traceability*) (see FDA's [Glossary of Computer System Software Development Terminology](https://www.fda.gov/iceci/inspections/inspectionguides/ucm074875.htm) for more details).  This site focuses on the accuracy of the validation of R. However, in order to validate R, a framework should be developed to incorporate all three of these elements to show that an installation of R is maintained in a controlled environment and that any outputs from it will be accurate, reproducible and traceable. 

# Accuracy

For the assessment of the validation of R in terms of accuracy, we differentiate different kinds of R packages (see German et al, 2013[^1]): 

* base and recommended packages, which are shipped with the basic installation
* contributed packages, which may differ in their popularity and/or accuracy

![source: German et al (2013): The Evolution of the R Software Ecosystem](/img/overview/German-et-al.png)

The process to manage base, recommended, and open source community packages varies so that different requirements are needed to ensure that the use of these packages will reliably produce accurate results.  

## Base R and Recommended Packages

The R Foundation follows many good practices during the development of Base R and the Recommended Packages, which ensure accuracy. Some practices are highlighted:

* The R source code is properly maintained, and releases are controlled
* The extensive R community plays an important role in testing the software and formally identifying bugs for the Core Team to address
* The R Core Team consists of highly qualified individuals
* Any R release can be qualified using the tests provided with each release

After careful consideration various points, it can be concluded that there is minimal risk in using Base R and Recommended Packages for regulatory analysis and reporting. For more details see [Base R](../base).

## Contributed Packages

Any contributed package on CRAN must pass a series of technical checks, including an “R CMD check”. These checks are designed to ensure that examples run successfully, tests pass and that packages on CRAN are compatible with each other. However, further requirements are necessary to ensure the accuracy of an package. These can be differentiated into two categories

1.	Package Maintenance, e.g. release rate, size of code base, formal bug tracking
2.	Community Usage and Testing, e.g. average downloads during in the last 12 months and code coverage by formal testing framework. 

Additional details are already discussed on the [R Packages](../packages) page. 

### Tidyverse

The tidyverse is a "collection of R packages, which share an underlying design philosophy, grammar, and data structures" (https://www.tidyverse.org/).  

In particular, the tidyverse is governed by a set of publically available [Design Principles](https://principles.tidyverse.org/) that are "used by the tidyverse team to promote consistency across packages in the core tidyverse".

Based on higher standards and large user community many would conclude that there is minimal risk in using the tidyverse collection for regulatory analysis and reporting.  The point is currently tabled for discussion by the R Validation Hub members.

# Reproducibility

## Creating and Maintaining Environments

Docker containers and other tools like RStudio Package manager can be used to create and maintain R environments to ensure that R outputs can be recreated.  This becomes more complex as R versions and package versions change over time so a process needs to be implemented that checks and tests package integrity with dependencies as versions are updated.  

# Traceability

System and process controls can be developed to automatically document the R packages and environment dependencies that goes into any particular R analyses.


[^1]: German, D.M. & Adams, Bram & Hassan, Ahmed E.. (2013). The Evolution of the R Software Ecosystem. Proceedings of the Euromicro Conference on Software Maintenance and Reengineering, CSMR. 243-252. 10.1109/CSMR.2013.33. 


