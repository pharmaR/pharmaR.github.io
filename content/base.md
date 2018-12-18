# Base R and Recommended R Packages

The R Foundation’s "…Guidance Document for the Use of R in Regulated Clinical Trial Environments" relates specifically to Base R and Recommended R Packages.  It is the opinion of this author, and of many colleagues from across industry, that this document adequately addresses the question of R validation with respect to Base R and Recommended packages.  Some of the key points are highlighted below.

## R Validation Responsibility

The responsibility for the organisation installing R to ensure that their SOPs "define appropriate and reasonable quality control processes to manage end-user related risk".

## 21 CFR Part 11 

The R Foundation do not believe that 21 CFR Part 11 is appropriate to data analysis software systems and highlight the following text from the FDA’s revised definition of Part 11 records, "a record that is not itself submitted, but is used in generating a submission, is not a part 11 record unless it is otherwise required to be maintained under a predicate rule and it is maintained in electronic format".

## Validation

The R Foundation focus on the FDA definition of validation, "Establishing documented evidence which provides a high degree of assurance that a specific process will consistently produce a product meeting its predetermined specifications and quality attributes."   It is also highlighted that R is "a component in an overall data management, analysis and presentation process".

## SDLC

The development and maintenance of R is handled by the R Development Core Team.  Members of the team represent "multiple statistical disciplines and are based at academic, not-for-profit and industry-affiliated institutions on multiple continents".

"Reasonable software development and testing methodologies are employed by R Core in order to maximize the accuracy, reliability and consistency of R's performance."

The Foundation also point out that as an open source language, "… all of the functionality embodied within R is subject to continuous critique and improvement relative to its accuracy, reliability and consistency".  And the size of the community is "estimated as being in the tens of thousands, with some independent estimates in the hundreds of thousands".

In a summary statement, they state, "In conjunction with detailed documentation and references provided to end users, the size of the R user community, all having full access to the source code, enables a superior ability to anticipate and verify R's performance and the results produced by R."

## Source Code Management

The R code is managed in a Subversion (SVN) repository with write access limited to the R Core team.  There is a clearly defined approach to releases and this is reflected in the R version number.  All changes and updates to the source are publicly available and shared via a news feed.

## Testing and Validation

The most significant statement on testing and validation is that, "A set of validation tests are maintained and upgraded by R Core to enable the testing of source code against known data and known results. Any errors noted during this testing are resolved prior to release."  In other words there are a standard set of tests that can be accessed and executed in order to assist with the qualification of an R installation.

## Further Information

In addition to the points highlighted above, the R Foundation’s documentation: describes the release cycle; provides details on the maintenance, support and retirement of R versions; highlights the relative qualifications of R Core Team members; and briefly describes the Foundation’s approach to disaster recovery.  Further, despite the Foundation’s thoughts on the applicability of 21 CFR Part 11, a response is provided to various sections of the FDA’s Regulation.

## Conclusion

The R Foundation’s document highlights the many good practices that are followed in the development of Base R and the Recommended Packages.  In particular:

* The R source code is properly maintained, and releases are controlled
* The extensive R community plays an important role in testing the software and formally identifying bugs for the Core Team to address
* The R Core Team consists of highly qualified individuals
* Any R release can be qualified using the tests provided with each release

Given these points, there is minimal risk in using Base R and Recommended Packages for regulatory analysis and reporting.  Considering the size of the user community and the extent of community testing that the R distribution is subjected to, this risk is arguably lower than the risk an organisation takes in using proprietary software that would not be subjected to such extensive user testing before release.
