+++
title = "Validation Overview"
parent = "valid"
+++

**THE FOLLOWING TEXT IS DRAFT ONLY**

# Description

The FDA’s definition of validation specifies the need for high degree of assurance ("accuracy") that a process consistently ("reproducibility")  meets predetermined specifications ("traceability").  In order to validate R, a framework has been developed to incorporate all these elements to show that R is maintained in a controlled environment and that any outputs from it will be accurate, reproducible and traceable.  

# Accuracy

Process to manage base, recommended, and open source community packages such that the use of these packages will reliably produce accurate results.  Additional details are already covered on the [R Packages](../packages) page.  

## Base R and Recommended Packages

TODO

## Tidyverse

TODO

# Reproducibility

## Creating and Maintaining Environments

Docker containers and other tools like RStudio Package manager can be used to create and maintain R environments to ensure that R outputs can be recreated.  This becomes more complex as R versions and package versions change over time so a process needs to be implemented that checks and tests package integrity with dependencies as versions are updated.  

# Traceability

System and process controls can be developed to automatically document the R packages and environment dependencies that goes into any particular R analyses.
