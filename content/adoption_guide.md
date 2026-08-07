---
title: "Validated Repository Early Adoption Guide"
---

# **Validated Repository** **Early Adoption Guide** 🚀

## Welcome & Context {#welcome-&-context}

Thank you for joining the **R Validation Hub** as an early adopter! The R Validation Hub is a community-driven effort to bring transparency and confidence in the use of open-source R packages in regulated environments through solutions for the validation of R packages.

As an early adopter, you are part of a small group of organizations shaping how the life sciences community evaluates and manages risk in R-based analytics and applications.

Your participation helps refine tools, test workflows in real-world environments, and contribute to shared best practices that ultimately make open-source safer, more trusted, and more accessible across our industry.

Early adopters play a dual role:

- as *Implementers* by piloting the tools within their environment.
- as *Contributors* by offering insights and feedback.

This guide will help you plan and scale your adoption, while ensuring alignment with both your internal compliance requirements and the R Validation Hub working group goals.

## Who Typically Implements This Internally {#who-typically-implements-this-internally}

In many organizations, the people implementing validation workflows are not necessarily expert R developers. Often they are:

- Platform engineers
- Statisticians or analysts
- Data scientists responsible for analytics infrastructure
- IT teams supporting regulated systems

This guide is written to support practical implementation, even for teams that are still building experience with R package infrastructure. While some familiarity with R and package installation is helpful, the R Validation Hub tools are designed to support structured and automated workflows that reduce the need for manual package validation. Deep expertise in R package development is not required.

## Terminology {#terminology}

| Term | Definition |
|------------------------------------|------------------------------------|
| **Baseline Image** | A base container image containing a validated version of R and a minimal set of foundational packages upon which additional validated packages may be added. |
| **CI/CD Pipeline** | Automated workflows (e.g., GitHub Actions) used to compute metrics, generate reports, update repositories, and build validated environments. |
| **Closed Repository** | A restricted package repository where only packages that meet validation criteria are available for installation. |
| **Early Adopter** | An organization piloting the R Validation Hub tooling to help evaluate workflows, provide feedback, and contribute to community best practices. |
| **Filtering Criteria** | Logical rules applied to package metrics to determine whether a package satisfies validation requirements. |
| **Internal Repository** | A private package repository maintained by an organization that hosts approved or validated packages for internal use. |
| **Package Governance** | Organizational processes used to manage the lifecycle of open-source packages, including evaluation, approval, monitoring, and retirement. |
| **Package Validation** | The process of assessing an open-source package to determine whether it meets defined quality, reliability, and governance requirements. |
| **Qualified Environment** | A computing environment (e.g., container or system installation) containing a predefined set of validated packages and configuration settings approved for use in regulated workflows. |
| **Qualified Package** | An R package that has passed a defined validation policy and is approved for use within an organization. |
| **Reproducible Environment** | A computing environment that can be recreated reliably, ensuring that analyses and applications behave consistently across systems and time. |
| **Risk Assessment** | Evaluation of potential risks associated with using a package, typically informed by metrics such as maintenance activity, documentation completeness, and testing coverage. |
| **Validated Image / Container** | A containerized environment (e.g., Docker image) that includes an approved set of validated packages built according to an organization’s validation process. |
| **Validated Repository** | A curated repository of R packages where each package has undergone a documented assessment based on defined validation metrics and organizational policies. |
| **Validation Dashboard** | An interactive interface (e.g., Shiny app) used to explore package metrics, review validation status, and discuss approval decisions. |
| **Validation Metrics** | Quantitative measures used to evaluate characteristics of an R package (e.g., presence of tests, documentation, maintenance activity, reverse dependencies). |
| **Validation Policy** | A set of rules or criteria used by an organization to determine whether an R package is acceptable for use in production or regulated environments. |
| **Validation Report** | A structured report generated for each package summarizing validation metrics, evidence, and the resulting validation decision. |

## Why Early adoption matters {#why-early-adoption-matters}

Early adoption allows your team to:

- Help develop the standards for R package validation in pharma, biotech, finance, agriculture and beyond.
- Accelerate internal readiness for R in validated workflows.
- Gain visibility as a thought leader in open-source validation and regulatory compliance.
- Collaborate directly with the R Validation Hub.

## Early Adopter Expectations {#early-adopter-expectations}

As an early adopter of the R Validation Hub solutions, you’re joining a collaborative effort to strengthen how the life sciences industry uses and validates open-source R in regulated environments. Your participation is essential to ensure the tools, documentation, and workflows reflect real-world needs and constraints.

Here’s what we expect from early adopters — and what you can expect in return.

## What We Ask of Early Adopters {#what-we-ask-of-early-adopters}

- **Pilot with Purpose**: Select a clear use case, for example, assessing a small group of R packages already used in production or evaluating packages planned for use in submissions. Focus on learning and feedback rather than full organizational deployment.\
- **Share Honest, Actionable Feedback**:
  - We need your perspective on:
    - Usability of the solutions.
    - Which metrics and reports are most meaningful for your teams.
    - What gaps, pain points, or documentation needs arise during adoption.\
  - Your feedback directly informs future updates and community guidance.\
- **Participate in Knowledge Sharing**: attend the R Validation Hub Repository meetings or community meetings to exchange lessons learned.\
- (Optional but encouraged) Share anonymized workflows or process templates that could benefit other organizations.\
- **Document Your Journey**: Document
  - Packages assessed.
  - Metrics used.
  - Key findings or challenges.\
- **Respect the [R Consortium’s Code of Conduct](https://r-consortium.org/codeofconduct.html)**

## What You Can Expect in Return {#what-you-can-expect-in-return}

- **Priority Support and Collaboration**: Early adopters receive direct communication channels with the R Validation Hub maintainers, including feedback sessions and early access to updates.\
- **Recognition and Visibility**: Your organization’s role as an early adopter will be acknowledged in community reports, presentations, and case studies (if you choose to be public).\
- **Influence on Future Direction**: Your feedback will shape the roadmap for the R Validation Hub tools.\
- **Accelerated Internal Readiness**: Through guided testing and collaboration, your organization will leave the pilot with:
  - A practical R package validation framework.
  - Internal awareness and documentation.
  - A scalable foundation for open-source governance

## Tools {#tools}

The R Validation Hub Repository group maintains these open tools for all companies. The tools are designed to work together as a cohesive pipeline. As shown in the diagram below, val.meter and val.repo generate the foundational metrics, which feed into reporting (val.report), filtering (val.criterion), and user-friendly review (val.dashboard).

- [{val.meter}](https://github.com/pharmaR/val.meter) – Easily measure characteristics of packages, built to support the process of *validation* required in regulated industries, but generally useful to anyone who wants to survey packages. Successor of [riskmetrics](https://github.com/pharmaR/riskmetric): it provides objectives metrics and lets the user decide which risk are acceptable for your organization\
- [val.repo](https://github.com/pharmaR/val.repo) – is a curated repository of R packages that is similarly to CRAN but with additional metadata: It hosts validation reports on its associated website, published via GitHub Pages.\
- [{val.report}](https://github.com/pharmaR/val.report) – R package for generating reports: provides a template used on val.repo.\
- [{val.criterion}](https://github.com/pharmaR/val.criterion) – R package for distributing sensible default filters, specifying bespoke filters and visualizing filters as decision trees.\
- val.dashboard – Shiny app for reviewing metrics in repository, visually applying filtering criteria, risk review and discussion. Founded on the experience of [riskassessment](https://github.com/pharmaR/riskassessment)\
- {val.setup} – Repository bringing together the R Validation Hub's tools under a single Github Actions workflow to produce the outputs necessary to qualify R packages for a GxP system.

## Getting Started {#getting-started}

The R Validation Hub toolchain supports multiple implementation workflows depending on an organization’s governance model and maturity level.

Organizations may begin with lightweight workflows that empower analysts to make informed package decisions and gradually evolve toward centralized governance and automated validation pipelines.

Before implementing these workflows, teams are encouraged to review the **R Validation Hub** [white paper](https://pharmar.org/white-paper/)., which describes the conceptual framework for assessing R package risk and validation considerations in regulated environments. The workflows described below operationalize the principles outlined in that document.

Additionally, we encourage teams to explore the public validated repository at val.repo: <https://pharmar.github.io/val.repo/>

## Choose a starting workflow

Use the workflow descriptions below to identify the best starting point for your organization.

| Workflow | Best for | Main tools | What you produce | Choose this when... |
|---------------|---------------|---------------|---------------|---------------|
| **A. Empower analysts to make validation decisions** | Individual analysts, statisticians, developers | `val.repo`, `{val.meter}` | Package assessments informed by validation metrics | You want users to make better package choices without central enforcement |
| **B. Curate packages using a validation policy** | Project leads, validation teams, platform teams | `{val.meter}`, `{val.criterion}` | A curated list of packages that meet organizational criteria | You want a shared approval process and a reusable package list |
| **C. Impose a validation policy for an enterprise system** | IT teams, platform engineers, analytics infrastructure teams | `{val.criterion}`, repository configuration | System-level package filtering and controlled installation behavior | You need centralized governance across a managed environment |
| **D. Generate an internal validated repository or image** | Platform teams, QA teams, data science infrastructure teams | `{val.meter}`, `{val.criterion}`, `{val.report}`, `{val.setup}` | An internal validated repository and/or image, with reports and repeatable automation | You want a fully governed, organization-specific workflow with CI/CD support |

## Workflow A: Empower analysts to make validation decisions

### **Who this is for**

Analysts, statisticians, Shiny developers, and data scientists who need to evaluate packages before using them in analyses, applications, or regulated workflows.

### **When to use it**

Use this workflow when individual users need a practical way to review package characteristics, compare packages against internal expectations, and document their package choices.

### **What you need**

- Access to the public validated repository
- Internal guidance on what kinds of package characteristics matter in your organization
- A basic understanding of how package metrics will inform package-use decisions

### **What you do**

1.  Explore package reports and metrics in the public validated repository maintained by the R Validation Hub.\
2.  Review whether the available metrics align with your organization’s current package review needs.\
3.  Retrieve repository metadata for the packages under consideration.\
4.  Use the available metrics to support package selection, comparison, and review.

Example:

``` r
options(repos = c(
  Validated = "https://raw.githubusercontent.com/pharmaR/val.repo/refs/heads/main/",
  CRAN = "https://cran.r-project.org"
))

ap <- available.packages()
View(ap)
```

The repository metadata provides information such as documentation, testing status, and other validation-related metrics.

### **What you get**

Analysts can make more informed package decisions while maintaining alignment with organizational policies and validation frameworks.

### **Read next**

- Use [Workflow B](#6.3-workflow-b:-curate-packages-using-a-validation-policy) when your organization is ready to define shared criteria rather than rely on individual review alone.\
- See [the metrics of the val.repo repository](https://raw.githubusercontent.com/pharmaR/val.repo/refs/heads/main/src/contrib/PACKAGES)

## Workflow B: Curate packages using a validation policy {#6.3-workflow-b:-curate-packages-using-a-validation-policy}

### **Who this is for**

Project leads, analytics platform teams, and validation teams that want to define shared package acceptance criteria.

### **When to use it**

Use this workflow when your organization wants to move from ad hoc package review to a repeatable policy-based curation process.

### **What you need**

- Package metrics, generated or retrieved from a repository\
- Agreed validation criteria or filtering rules\
- A process for reviewing and maintaining the resulting curated package list

### **What you do**

1.  Generate package metrics using `{val.meter}`, or consume metrics already available from a validated repository.\
2.  Define validation criteria using `{val.criterion}`.\
3.  Apply those criteria to identify packages that meet organizational requirements.\
4.  Store and maintain the resulting curated package list for internal or project-specific use.

Example:

``` r
options(repos = c(
  Validated = "https://raw.githubusercontent.com/pharmaR/val.repo/refs/heads/main/",
  CRAN = "https://cran.r-project.org"
))

ap <- available.packages()
subset(ap, has_examples == 1 && has_vignettes == 1)
```

This example illustrates the general pattern of filtering packages based on validation-relevant characteristics. In practice, organizations will usually define a broader and more explicit set of criteria.

### **What you get**

A controlled list of packages aligned with internal validation policies, which teams can reuse across projects and review over time.

### **Read next**

- Use [Workflow C](#6.4-workflow-c:-impose-a-validation-policy-for-an-enterprise-system) when package policy needs to be enforced centrally rather than applied manually.\
- Use [Workflow D](#6.5-workflow-d:-generate-an-internal-validated-repository-or-image) when the curated package list needs to become part of an internal repository or automated delivery process.\
- Placeholder: add link to `{val.criterion}` examples or criteria reference

## Workflow C: Impose a validation policy for an enterprise system {#workflow-c:-impose-a-validation-policy-for-an-enterprise-system}

### **Who this is for**

Platform engineers, IT teams, and analytics infrastructure teams managing shared R environments.

### **When to use it**

Use this workflow when your organization wants to enforce package policy across a managed enterprise system so that users can only install packages that meet defined criteria.

### **What you need**

- A validated or curated package source
- System-level access to configure repository behavior and filtering
- Agreed package installation criteria

### **What you do**

1.  Install `{val.criterion}` and configure the validation filters your organization wants to enforce.\
2.  Add a validated repository to the repositories used by the managed R environment.\
3.  Configure system-wide filtering policies so that only packages meeting the allowed criteria are available for installation.

For example, `R.home()/etc/repositories` may include:

```         
Validated   "Validated R-Hub"   https://raw.githubusercontent.com/pharmaR/val.repo/refs/heads/main/ FALSE   FALSE   FALSE
```

A system-wide filter can then be configured in `R.home()/etc/Rprofile.site`:

``` r
options(available_packages_filters = {<your filters>})
```

### **What you get**

All users in the enterprise environment install packages that comply with organizational validation policies. This supports centralized governance while preserving a consistent user experience.

### **Read next**

- Use [Workflow D](#6.5-workflow-d:-generate-an-internal-validated-repository-or-image) when you also need organization-specific reports, internal packages, automated updates, or internal hosting.\
- **\[Placeholder: add a short explanation of common filter patterns or link to filter documentation\]**\
- **\[Placeholder: add supported deployment patterns, such as managed workstation, server, or containerized runtime\]**

## Workflow D: Generate an internal validated repository or image {#6.5-workflow-d:-generate-an-internal-validated-repository-or-image}

### **Who this is for**

Platform teams, QA teams, and data science infrastructure teams that need a governed, repeatable internal package distribution process.

### **When to use it**

Use this workflow when your organization wants to apply its own validation criteria, include internal packages, produce validation reports, and distribute packages through an internal repository or qualified image.

### **What you need**

- A defined package scope or seed list\
- Organizational validation criteria\
- A process for generating metrics and reports\
- An internal hosting or delivery target, such as a repository endpoint, container image, or both\
- A CI/CD environment for repeatable execution (optional)

### **What you do**

1.  Identify the set of packages used or approved within the organization.\
2.  Customize validation metrics.\
3.  Generate validation metrics using `{val.meter}`.\
4.  Apply organizational criteria using `{val.criterion}`.\
5.  Generate reports using `{val.report}`.\
6.  Build and publish the outputs required for internal use, such as:
    - an internal validated repository,\
    - validation reports,\
    - a dashboard for review and discussion, and/or\
    - a container or image containing approved packages.\
7.  Automate the workflow through CI/CD where appropriate.

Tool support in this area is evolving:

- `{val.setup}` is intended to bring the R Validation Hub tools together under a single GitHub Actions workflow to produce the outputs needed to qualify packages for a GxP system.\
- `val.dashboard` is intended to support visual review of metrics, filtering criteria, risk review, and discussion.

**\[Placeholder: clearly label which parts of this workflow are available now versus planned\]**

### **What you get**

An internal, organization-specific package distribution workflow aligned with governance policies, supported by repeatable metrics, reports, and deployment artifacts.

### **Read next**

- Continue to **Section 7** for practical walkthroughs, including an end-to-end example of building an internal repository or image through CI.\
- **\[Placeholder: add links to `{val.meter}`, `{val.report}`, and `{val.setup}` vignettes\]**

# Key Use Cases {#key-use-cases}

A repository using the tools for generating a closed repository for Arcus: [val.pipeline](https://github.com/pharmaR/val.pipeline)\
Add a new package to a closed image:\
Validate an internal validated package: it won’t have (external) download metrics but it might still be validated.

# Roadmap & What’s Coming {#roadmap-&-what’s-coming}

Phase 1: Kick off Early Adoption community\
Reflections and iteration based on Phase 1\
Phase 2: Health Authority Submission Pilot 4 or 5\
Reflections and iteration based on Phase 2\
Phase 3: Large audience kick off\
Reflections and iteration based on Phase 3

# Support & Community {#9.-support-&-community}

R Validation Hub [website](https://pharmar.org/contribute/)\
R Validation Slack (link)\
R Consortium [website](https://r-consortium.org/)\
R Consortium [Code of conduct](https://r-consortium.org/codeofconduct.html)

# Feedback Loop {#10.-feedback-loop}

If it is a technical doubt, bug or question open issues on the repositories.

# Next Steps for You, early adopter {#11.-next-steps-for-you,-early-adopter}

Other steps
