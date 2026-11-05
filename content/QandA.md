---
title: "Q&A: Validated R Workflows"
---

This page answers common questions about adopting the R Validation Hub's package assessment and repository tools. For workflow details, see the [Early Adoption Guide](/adoption_guide/); for the underlying risk-based approach, see the [R Validation Hub white paper](/white-paper/).

## What does validation mean for an R workflow?

Validation is documented evidence that a process consistently produces results meeting predetermined specifications. The white paper frames this in terms of **accuracy**, **reproducibility**, and **traceability**. Package assessment is one part of a broader validated system: organizations also need to qualify and document the R installation and the environment in which it runs. See the [validation overview](/overview/) and [glossary](/glossary/).

## Does a package metric or score prove that a package is accurate?

No. Metrics provide evidence about characteristics such as testing, documentation, maintenance, and community activity; they do not prove that a package's calculations are correct for your intended use. Organizations define their own policy, consider the consequences of errors, and decide whether additional review or testing is needed. A package's score should inform—not replace—expert judgment.

The [white paper](/white-paper/) also notes that CRAN checks verify matters such as examples, tests, and compatibility, but do not guarantee package accuracy.

## What are the `val.*` tools?

The [Early Adoption Guide](/adoption_guide/) describes these components:

- [`val.meter`](https://github.com/pharmaR/val.meter) measures package characteristics and is described as the successor to [`riskmetric`](https://github.com/pharmaR/riskmetric).
- [`val.repo`](https://github.com/pharmaR/val.repo) is a curated, CRAN-like repository with additional package metadata and published reports.
- [`val.report`](https://github.com/pharmaR/val.report) generates reports and supplies the report template used by `val.repo`.
- [`val.criterion`](https://github.com/pharmaR/val.criterion) provides default and custom filtering criteria and tools to visualize filters as decision trees.
- [`val.pipeline`](https://github.com/pharmaR/val.pipeline) is cited as an example used to generate a closed repository for Arcus.

The guide also describes `val.dashboard` as a Shiny review interface and `val.setup` as a repository intended to combine the tools in a GitHub Actions workflow. Tool capabilities and support are evolving; check the linked projects for their current status before planning a production deployment.

## How do `riskmetric`, `riskassessment`, and the `val.*` tools relate?

`riskmetric` is the earlier package for collecting package risk metrics. The adoption guide describes `val.meter` as its successor. The earlier `riskassessment` Shiny app used `riskmetric` to support package review, organization-specific decision rules, and summary reports; the guide says `val.dashboard` builds on that experience. In the new toolchain, report generation is assigned to `val.report`, filtering to `val.criterion`, and repository metadata and distribution to `val.repo`.

This describes the relationship presented in the website documentation; it does not assert that the newer tools are feature-for-feature replacements for the earlier app. The guide does not mention a package named `riskreports`; if you meant report generation in the current toolchain, see [`val.report`](https://github.com/pharmaR/val.report).

For the earlier tool descriptions, see [risk assessment](/risk/) and [the `riskassessment` app](/riskassessment/).

## Which workflow should our organization start with?

The guide offers four levels of adoption:

1. **Analyst-led review:** use public repository metrics to inform individual package choices.
2. **Policy-based curation:** agree on package criteria and curate a reusable package list.
3. **Enterprise enforcement:** configure a managed R environment to restrict package installation according to policy.
4. **Internal repository or image:** build and maintain an organization-specific distribution with reports and repeatable automation.

Start with the approach that fits your governance model and maturity. A focused pilot is encouraged before attempting a full organizational deployment. See [Choose a starting workflow](/adoption_guide/#choose-a-starting-workflow).

## How should we choose validation criteria?

Criteria should reflect your organization's intended package use, compliance processes, and the potential impact of an error. The tools can provide metrics and help apply rules, but they do not prescribe a universal acceptable-risk threshold. Document the criteria, how evidence is evaluated, who makes decisions, and when reassessment is needed.

## What if an internal package has no download metrics?

That does not automatically disqualify it. The adoption guide specifically notes that internal packages may lack external download metrics and may still be validated. Assess the evidence relevant to that package and its intended use under your organization's policy.

## Do package assessments replace system qualification?

No. The white paper distinguishes assessment of individual packages from qualification of the overall system. System qualification typically includes installation, operational, and performance tests to establish that the R installation performs as expected. Package metrics do not replace those activities.

## How do we keep analyses reproducible and traceable?

Manage and document R and package versions, dependencies, and relevant system configuration; test package and dependency integrity as the environment changes; and record the packages used in a standard, logged workflow. The white paper highlights complex dependency trees and version compatibility as reproducibility challenges and recommends controls that document packages and dependencies used in analyses.

## What is expected of an early adopter?

Choose a clear pilot use case, record the packages and metrics assessed, document findings and challenges, share actionable feedback, and participate in community knowledge sharing. Feedback on usability, useful metrics and reports, gaps, and documentation needs helps shape the tools and guidance. See [Early Adopter Expectations](/adoption_guide/#early-adopter-expectations).

## Where can we ask questions or report issues?

For technical questions, bugs, or feature requests, the guide recommends opening an issue in the relevant tool repository, such as [`val.meter`](https://github.com/pharmaR/val.meter), [`val.report`](https://github.com/pharmaR/val.report), or [`val.criterion`](https://github.com/pharmaR/val.criterion). For questions about participating or adopting the guide, contact the community through the [R Validation Hub Slack channel](https://rconsortium.slack.com/archives/C07VAVDBR3M).
