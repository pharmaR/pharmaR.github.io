---
title: "Announcing the R Validation Hub Early Adopter Guide"
author: R Validation Hub
date: "2026-10-14"
slug: early-adopter-guide
categories: 
  - news
tags: 
  - adoption
  - val.meter
  - val.repo
---

The R Validation Hub is looking for early adopters! We have published an **[Early Adopter Guide](/adoption_guide/)** to help organizations pilot our new set of tools for validating R packages in regulated environments, and we want your feedback on them.

### Why early adoption?

Early adopters play a dual role: *implementers*, piloting the tools in their own environment, and *contributors*, sharing insights that shape the tools and community best practices. In return, adopters get direct communication with the maintainers, early access to updates, influence on the roadmap, and (if they choose) recognition in community reports and presentations.

You don't need to be an expert R developer. The guide is written for the platform engineers, statisticians, data scientists, and IT teams who typically implement validation workflows.

### The tools

The tools are designed to work together as a pipeline:

-   [`{val.meter}`](https://github.com/pharmaR/val.meter): measure characteristics of packages and leave the decision about acceptable risk to you. It is the successor to [`{riskmetric}`](https://github.com/pharmaR/riskmetric).
-   [`val.repo`](https://github.com/pharmaR/val.repo): a curated, CRAN-like repository of R packages with additional metadata and validation reports. Explore the public example at <https://pharmar.github.io/val.repo/>.
-   [`{val.report}`](https://github.com/pharmaR/val.report): generate validation reports for packages.
-   [`{val.criterion}`](https://github.com/pharmaR/val.criterion): apply default or bespoke filtering criteria to metrics, and visualize them as decision trees.
-   `val.dashboard`: evolving support intended to provide a Shiny app for reviewing metrics, applying criteria, and discussing risk, based on the experience of [`{riskassessment}`](https://github.com/pharmaR/riskassessment).
-   `{val.setup}`: evolving support intended to bring the tools together in a single GitHub Actions workflow that produces the outputs needed to qualify R packages for a GxP system.

### Choose your starting point

The guide describes four workflows, so you can start at the level that fits your governance model and maturity:

1.  **Empower analysts** to make validation decisions with package metrics.
2.  **Curate packages** using a validation policy.
3.  **Impose a validation policy** for an enterprise system.
4.  **Generate an internal validated repository or image** with reports and repeatable automation.

You can begin with lightweight workflows and evolve toward centralized governance and automated validation over time.

### Get involved

-   Read the [Early Adopter Guide](/adoption_guide/) and pick a workflow to pilot.
-   Open issues on the tool repositories (`val.meter`, `val.report`, `val.criterion`, ...) for bugs and technical questions.
-   Join us in the [R Validation Hub Slack channel](https://rconsortium.slack.com/archives/C07VAVDBR3M) or at one of our [community meetings](/community-meetings/).
-   Share the guide with colleagues and teams who may be interested.

We look forward to learning with you!
