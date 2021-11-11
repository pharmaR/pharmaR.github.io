---
title: "Package Qualification Example"
---

We provide a way to qualify R packages to be used for regulatory purposes as an organization 
following the [R validation hub white paper](https://www.pharmar.org/white-paper/).

> Here an organization can be a group of people within a company or research institute 
> who share common use cases for regulatory purposes. 

Before we start the journey, we need to reiterate what is "validation" and clearly define our goal.

FDA defined validation as "Establishing documented evidence which provides a high degree of
assurance that a specific process will consistently produce a product meeting its predetermined specifications
and quality attributes." More discussion can be found in Section 5.2 of the [R-FDA document](https://www.r-project.org/doc/R-FDA.pdf)

Based on the definition of validation, our goal (as an organization) is to create documentations 
that describe qualification details of R packages based on pre-specified criteria. 
Importantly, our goal is not to write testing R code
for every function an organization is used. 

To improve the communication between IT and business unit. 
It is also useful to define a user story.

User story: As an organization, we want to **qualify** external R packages 
for xxx use cases in a regulatory compliance way. 

> Here, external indicate those R packages are developed and maintained 
> by developer outside of our organization. 

## Assumptions 

To achieve our goal, we need to make several infrastructure assumptions for our organization.

> In reality, you will need to work closely with the IT department
> to ensure these assumptions are hold

### Validated System 

Our organization need a validated system. For example:

- Operation System: Ubuntu 20.04  
- System dependency: listed in "Install System Prerequisites" section of https://packagemanager.rstudio.com/client/#/repos/1/overview 
- (optional) RStudio: version 2021.09.1 
- R: version 4.1.1

> Sometimes we also call the system or environment is GxP compliance. 

Our goal is to create documentations to qualify **external** 
R packages **in** this GxP compliance system or environment.  
These documentations are the **significant obligation** emphasized 
in Section 2 of the [R-FDA document](https://www.r-project.org/doc/R-FDA.pdf)

> "It is important to note that there is a significant obligation on the part of the end-user’s organization to
> define, create, implement and enforce R installation, validation and utilization related Standard Operating
> Procedures (SOPs) within the end-user’s environment.

### Use Cases 

Our organization need to clearly define use cases. For example:

- Analysis and reporting for clinical study reports and submission. 

The use case is to deliver table, listing and figures using R following  
[ICH E3: structure and content of clinical study reports](https://database.ich.org/sites/default/files/E3_Guideline.pdf).
More details can be found in [R for Clinical Study Reports and Submission](https://r4csr.org/)

### R packages 

Based on the use cases, our organization needs to define a cohort of R packages to be qualified.

- Base R packages: listed in Section 2 of the R-FDA document
- Recommended Packages: listed in Section 2 of the R-FDA document
- tidyverse Packages: listed in https://github.com/tidyverse
- stan packages: listed in https://github.com/stan-dev

### Trusted Vendor 

Our organization have a list of trusted vendor after reviewing their SDLC documents.   

- [The R Foundation](https://www.r-project.org/foundation/)
  + [R: Regulatory Compliance and Validation Issues. A Guidance Document for the Use of R in Regulated Clinical Trial Environments](https://www.r-project.org/doc/R-FDA.pdf)
- [RStudio](https://www.rstudio.com/) 
  + [tidyverse, tidymodels, r-lib, and gt R packages: Regulatory Compliance and Validation Issues](https://resources.rstudio.com/assets/img/validation-tidy.pdf)
- [stan development team](https://mc-stan.org/about/team/)
  + [Stan's Software Development Lifecycle](https://mc-stan.org/docs/sdlc.html)

## Qualification Criteria

An R package is qualified if at least one of the criteria is met. 

- c1: an R package is developed and maintained by a trusted vendor. 
- c2: an R package is user faced with sufficient SDLC evidence equivalent to our internal SDLC requirement. 
- c3: an R package is user faced with additional internal work to complete necessary steps following our internal SDLC requirement. 
- c4: an R package is not user faced and all packages depends on this R package are qualified. 

Here user faced R packages means the R package will directly be loaded by a user in our organziation in R. 

For an internal SDLC requirement, one can refer 
[A Process to Validate Internal Developed R Package under Regulatory Environment]( https://www.pharmasug.org/proceedings/2021/SI/PharmaSUG-2021-SI-084.pdf)

## Qualification Documents

**ToDo**:

- list all R packages in a table with in formation below
  + package name
  + package version
  + user faced (Y / N)
  + package criteria
- example qualification document (maybe directly get from riskmetric shiny app???) 






