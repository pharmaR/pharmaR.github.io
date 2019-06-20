+++
title = "R"
parent = "valid"
+++

R is a free programming language and software environment that is used for statistical computing. R was first created in 1993, and is now supported by the R Foundation for Statistical Computing.

For more information, see [What is R?](https://www.r-project.org/about.html)

### Base R
As of May 31, 2019, Base R is comprised of 14 packages, with an additional 15 packages included as “Recommended Packages.” These 29 packages compose the core of R and are included with basic R installations. Functionalities of this basic installation include:

-   statistics
-   graphics
-   file handling
-   matrix handling
    

### R Development Core Team
The Base R packages are developed and maintained by the R Development Core Team (R Core), through their controlled Software Development Life Cycle (SDLC).

All source code is available for review under the Free Software Foundation’s GNU Public License (GPL). As such, peer review of R development is done by both the R Core team and the community.

### R is Open Source
As open source software, the source code is provided for free under the (GPL) license.

**Note:** Although R is open source, its updates, maintenance and releases are tightly controlled by the R Core Team to ensure stable development.

## Using R for Regulatory Analyses and Reporting
In response to [federal regulations](../regulations), the R Foundation released [R: Regulatory Compliance and Validation Issues. A Guidance Document for the Use of R in Regulated Clinical Trial Environments](https://www.r-project.org/doc/R-FDA.pdf). This document relates to both Base R and recommended R packages. The R Foundation addresses the validation of R, and includes the following information:

-   Relevance of 21 CFR Part 11 to R
-   R’s definition of validation
-   Organizations are responsible for validating their R installations
-   R Foundation’s System Development Life Cycle (SDLC)
-   Responses to various sections of 21 CFR Part 11
   
### Relevance of 21 CFR Part 11 to R
The R Foundation summarizes takeaways from 21 CFR Part 11. Most importantly:

>If there are predicate rules that require records to be maintained, and these records are managed electronically, then Part 11 controls apply to those records.

>If there are predicate rules that require a signature to be applied, and this signature is applied electronically or digitally, then Part 11 controls apply.

Part 11 records are records submitted to the FDA. Any records that are not submitted, but are used in generating a submission, are not considered to be relevant to Part 11.

Therefore, the R Foundation concludes that Part 11 does not apply to data analysis software systems that are not used in record transmission or storage.

However, elements of Part 11 may still apply when R is used as part of a validated system. GxP regulations may also drive a requirement for validation. Ultimately, it is the responsibility of the organisation to identify how a system relates to current legislation.

### Definition of validation
The R Foundation uses the FDA’s [Glossary of Computer System Software Development Terminology](https://www.fda.gov/iceci/inspections/inspectionguides/ucm074875.htm) definition of validation:

> **Validation:** Establishing documented evidence which provides a high degree of assurance (*accuracy*) that a specific process consistently (*reproducibility*) produces a product meeting its predetermined specifications (*traceability*) and quality attributes.

For more information about validation, see [Validation Overview](https://www.pharmar.org/overview/).

The R Foundation identifies the scope of R. That is, R may be a *part* of data analysis and other technologies may exist.

### Organizations are responsible for validating their R installations
The R Foundation states that organizations are responsible for validating their R installations. They recommend creating Standard Operating Procedures (SOPs). These SOPs should manage risk and define quality control for R installations.

### R Foundation’s System Development Life Cycle (SDLC)

#### Operational Overview
The R Core team develop, release, and maintain R code. R Core members come from many statistical backgrounds, and are located all over the world.

Since R is open source, all of the source code is available to be reviewed by members of the user community. The user community is estimated between the tens and hundreds of thousands. Therefore, the functionality is subject to constant evaluation and improvements. This amount of testing in the real world is unique, and lends itself to a high-quality product.

#### Source Code Management
R’s source code is managed in a Subversion (SVN) [repository](https://svn.r-project.org/R/) with write access limited to the R Core team. R Core defines procedures to protect the source code and the hosting server including:

-   Maintaining separate source code branches for the Release Branch and the Development Version
-   Logging code changes daily within the SVN repository
-   Maintaining a “NEWS” file that allows users to track all changes made to R
    

#### Testing and validation
R Core maintains and updates a set of validation tests. These tests test source code against known data and known results. All errors found while testing are fixed before release.

These tests are available to end users to ensure the validation of their R installation.

R Foundation monitors feedback from users by the [r-devel e-mail list](https://stat.ethz.ch/mailman/listinfo/r-devel) and the [R Bug Tracking System](http://bugs.r-project.org/). This process allows for more extensive testing, and increases the likelihood that bugs are fixed before releases.

#### More information
The R Foundation provides more information in their documentation, including:

-   Release cycle description
-   Maintenance, support, and retirement details of R
-   Qualifications of R Core members
-   Physical security
-   IT security
-   Disaster recovery plans
-   Responses to various sections of 21 CFR Part 11
    
For more detailed information, see [R: Regulatory Compliance and Validation Issues. A Guidance Document for the Use of R in Regulated Clinical Trial Environments](https://www.r-project.org/doc/R-FDA.pdf).

## Conclusion
R Foundation documents practices in the development of Base R and the Recommended Packages, including:

-   R Foundation maintains source code and controls releases
-   The R community is between the tens and hundreds of thousands
-   The R community tests software in the real world and identifies bugs that the Core Team addresses
-   The R Core Team consists of qualified individuals
-   Users can verify installations with tests provided in each release
    
The size of the user community leads to unique and extensive community testing. Using R is arguably lower risk than using proprietary software that is not as user-tested before release.

R Validation Hub concludes that there is minimal risk in using Base R and Recommended Packages as a component in a validated system for regulatory analysis and reporting.
