+++
title = "R Packages"
parent = "valid"
+++


**THE FOLLOWING TEXT IS DRAFT ONLY**

The value of R lies not within the official distribution but within the many R packages that support it.  R packages provide the means to extend the language, implementing new statistical methods, graphics and code structures.  However, this is also where the majority of risk lies for an organisation.

R packages can be written by anyone.  The author/maintainer could be an organisation but they are perhaps more likely to be an individual and no qualification is required in order to develop an R package and submit it to CRAN (or any other package repository).  Unlike the base distribution, R packages may or may not follow any software development best practices.  

Packages on CRAN must pass a series of technical checks, including an "R CMD check".  These checks are designed to ensure that examples run successfully, tests pass and that packages on CRAN are compatible with each other.  However, there is no requirement for package authors to write tests or implement a formal unit-testing framework.  In fact, less than 26% of the >13,500 packages on CRAN are known to implement a formal test framework.  In addition, there is no obligation to maintain bug reports and unless a bug in a package affects another package on CRAN, the bugs may never be identified nor fixed.  Unlike the base distribution, the amount of user testing can also vary widely.  Popular packages such as dplyr may have been downloaded and used by tens of thousands of individuals, whilst others might never have been used by anyone except the package author.

In order to apportion an appropriate level of validation effort across different R packages, it is important to establish a risk assessment framework that can be applied to any R package in order to determine a base level of risk.


## Risk Assessment




The term, "risk" refers to the risk of an error in the code that, when used appropriately, could lead to an incorrect calculation and hence an incorrect decision when analysing pharmaceutical data.  The relative impact of an error should be determined by the individual organisation.  Impact is therefore not considered as part of the risk assessment.

### Risk Philosophy

The following tables highlight metrics that could be used in order to assess the risk of an R package. The risk assessment has been grouped into two areas:

1.	Package Maintenance
2.	Community Usage and Testing

#### Package Maintenance


|Metric                           |Reason for Inclusion                                                                                                                                                                                                                                                                                                                                                             |
|:--------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Vignette                         |It is good practice to provide additional help documentation for a package in the form of one or more vignettes.                                                                                                                                                                                                                                                                 |
|Website                          |It is good practice to maintain a website with further information about the package, contact details, and other supporting information.                                                                                                                                                                                                                                         |
|Source control (public)          |The use of source control is good practice that facilitates development.  In general it will not be possible to determine whether the maintainer is using a source code repository unless this is in the public domain.                                                                                                                                                          |
|Formal bug tracking              |Bugs can be logged by emails, but the better practice is to provide a formal mechanism for bug tracking.                                                                                                                                                                                                                                                                         |
|News                             |A news feed is good practice as it makes users aware of updates to the package, thereby highlighting the areas of greatest risk.                                                                                                                                                                                                                                                 |
|Release rate (18 months)         |A stable but continuing release pattern is a sign of active maintenance.  Active maintenance reduces the risk of bugs/errors and so a higher frequency indicates a reduced risk.  However, it should be noted that as a package stabilises over time, the release rate may slow.  When interpreting this metric it is therefore also important to consider the package maturity. |
|Number of dependencies           |Reusing code means less new code and hence less potential for error.  The higher the number of dependencies, the lower the risk.                                                                                                                                                                                                                                                 |
|Size of codebase (lines of code) |The larger the code base, the greater the risk of error                                                                                                                                                                                                                                                                                                                          |
|License?                         |x                                                                                                                                                                                                                                                                                                                                                                                |
|Author reputation?               |[Need to think about how we'd measure this - number of packages authored?]                                                                                                                                                                                                                                                                                                       |

#### Community Usage and Testing


|Metric                                             |Reason for Inclusion                                                                                                                                                                                                                                                                                                                                                    |
|:--------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Maturity (package)                                 |The longer a package has been in existence, the more exposure it has had to community testing                                                                                                                                                                                                                                                                           |
|Maturity (version)                                 |When measuring package maturity, it is also important to consider the version maturity.  The more recent a version, the less exposure it has had to community testing                                                                                                                                                                                                   |
|Package available from CRAN or Bioconductor        |CRAN and Bioconductor are the two standard public repositories for R packages.  To publish a package on these repositories, a package maintainer must ensure that the package passes a series of technical checks including the 'R CMD check'.  Packages on GitHub and other popular public repositories are not required to meet these checks and pose a greater risk. |
|Implements a standard unit-testing framework       |The three standard R unit-testing frameworks are testthat, RUnit and svUnit.  It is good practice to adopt one of these frameworks in order to write unit tests.  A user may implement their own framework but this increases the risk of error.                                                                                                                        |
|Code coverage                                      |For packages that implement a test framework, it is possible to use the R package, covr, to work out the proportion of the source code covered by these tests.  Although there are an infinite number of ways of testing code, a 100% covr score would mean that every line of source code is at least called when running the tests.                                   |
|Number of reverse dependencies                     |A high number of reverse dependencies increases the indirect exposure of the package and reduces the risk of error                                                                                                                                                                                                                                                      |
|Average downloads in past 12 months (all versions) |The more times a package has been downloaded the more extensive the user testing and the greater chance there is of someone finding a bug and logging it.                                                                                                                                                                                                               |
