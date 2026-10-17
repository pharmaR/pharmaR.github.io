---
title: "Frequently Asked Questions (FAQ) - R Validation Hub"
---

## General Questions

### What are these new val.* packages?

The **val.\* packages** are next-generation tools developed by the R Validation Hub to support R package validation in regulated environments. They replace and enhance earlier tools like `riskmetric` and `riskassessment`. 

The key val.* packages include:

- **{val.meter}** – Measures package characteristics and generates validation metrics
- **{val.criterion}** – Defines and applies validation filtering criteria
- **{val.report}** – Generates structured validation reports
- **val.repo** – A curated repository of validated R packages with metadata
- **{val.setup}** – Orchestrates the complete validation pipeline via GitHub Actions
- **val.dashboard** – Interactive Shiny app for reviewing metrics and validation status

These tools work together as a cohesive pipeline to support organizations in validating and managing R packages for GxP systems.

---

### What will happen with riskmetric and riskassessment packages?

The `riskmetric` and `riskassessment` packages remain important but have evolved:

- **riskmetric** continues to be maintained and provides foundational risk assessment capabilities
- **riskassessment** is a Shiny-based risk assessment demo application that showcases validation workflows
- **val.meter** builds on the concepts from riskmetric, offering improved package heuristics and metrics specifically designed for regulated industries
- The R Validation Hub is transitioning toward the val.* ecosystem while maintaining backward compatibility

Organizations currently using riskmetric can migrate gradually to the val.* tools as they mature. Both toolsets can coexist during transition periods.

---

### What are the advantages of these new tools?

The val.* tools offer several advantages:

1. **Purpose-Built for Regulation** – Designed specifically for pharmaceutical, biotech, finance, and other regulated industries
2. **Consistent Metrics** – Standardized package evaluation across organizations
3. **Flexible Filtering** – Define custom validation criteria tailored to your organization's needs
4. **Automated Workflows** – CI/CD integration for repeatable, auditable validation processes
5. **Transparent Reporting** – Generate structured validation reports supporting regulatory submissions
6. **Community Standards** – Leverage cross-industry best practices and consensus
7. **Multiple Implementation Paths** – Start simple (individual analyst decisions) and scale to enterprise governance

---

## Implementation & Adoption

### How can we track the progress of the project?

You can track R Validation Hub progress through multiple channels:

1. **GitHub Repositories** – Monitor development and issues:
   - [val.meter](https://github.com/pharmaR/val.meter)
   - [val.criterion](https://github.com/pharmaR/val.criterion)
   - [val.report](https://github.com/pharmaR/val.report)
   - [val.repo](https://github.com/pharmaR/val.repo)
   - [val.setup](https://github.com/pharmaR/val.setup)

2. **R Validation Hub Website** – [pharmar.org](https://pharmar.org)
   - Roadmap information
   - Documentation and guides
   - Community resources

3. **R Consortium Slack** – Join the R Validation Hub channel for real-time discussions and updates
   - Channel: [#r-validation-hub](https://rconsortium.slack.com/archives/C07VAVDBR3M)

4. **Community Meetings** – Attend R Validation Hub repository group meetings
   - Regular sync calls with maintainers and early adopters
   - Knowledge sharing sessions

5. **Case Studies** – Review real-world implementations at [case_studies](https://github.com/pharmaR/case_studies)

---

### How can we help the project?

Early adopters and community members can contribute in several ways:

1. **Pilot & Provide Feedback**
   - Test the tools in your environment
   - Report bugs and usability issues
   - Share feedback on metrics and filtering criteria

2. **Share Your Experience**
   - Document your validation workflow
   - Contribute case studies or implementation templates
   - Present at R community events

3. **Participate in Meetings**
   - Attend R Validation Hub repository working group meetings
   - Engage in Slack discussions
   - Contribute to strategic planning

4. **Contribute Code**
   - Submit pull requests for improvements
   - Develop complementary tools or integrations
   - Improve documentation

5. **Advocate & Educate**
   - Present at conferences (R/Pharma, useR!, etc.)
   - Write blog posts or articles
   - Lead internal training sessions

6. **Support New Adopters**
   - Share best practices
   - Mentor other organizations
   - Document lessons learned

See the [Early Adoption Guide](https://pharmar.org/adoption-guide/) for detailed expectations and support available to contributors.

---

### How can we use the tools?

The R Validation Hub provides **four implementation workflows** based on your organization's needs:

#### **Workflow A: Empower Analysts**
- **Best for**: Individual analysts, statisticians, developers
- **Tools**: val.repo, {val.meter}
- **Output**: Informed package assessments
- **When**: You want analysts to make better package decisions using validation metrics

#### **Workflow B: Curate Packages**
- **Best for**: Project leads, validation teams, platform teams
- **Tools**: {val.meter}, {val.criterion}
- **Output**: Curated package list meeting organizational criteria
- **When**: Moving from ad-hoc review to repeatable policy-based curation

#### **Workflow C: Enterprise Policy**
- **Best for**: Platform engineers, IT teams, infrastructure teams
- **Tools**: {val.criterion}, repository configuration
- **Output**: System-level package filtering
- **When**: Enforcing package policy across managed environments

#### **Workflow D: Internal Repository**
- **Best for**: Platform teams, QA teams, data science infrastructure
- **Tools**: {val.meter}, {val.criterion}, {val.report}, {val.setup}
- **Output**: Internal validated repository, reports, container images
- **When**: Full governance with automated validation pipelines

---

## Key Concepts & Terminology

### What is a "validated package"?

A **validated package** is an R package that has:
- Been formally assessed using defined validation metrics
- Passed organizational validation criteria or filtering rules
- Been documented as approved for use in regulated workflows
- Undergone documented risk evaluation

Validation does **not** mean perfection—it means transparent, documented assessment of risk and suitability for intended use.

---

### What is a "validation policy"?

A **validation policy** is a set of rules or criteria your organization defines to determine whether an R package is acceptable for production or regulated use. Examples include:

- Package has active maintenance (commits within last 6 months)
- Comprehensive test coverage (>80% code coverage)
- Clear documentation (vignettes and examples present)
- Reasonable reverse dependency impact
- Alignment with regulatory expectations

Organizations can define custom policies using `{val.criterion}` or start with community-recommended filters.

---

### What is a "qualified environment"?

A **qualified environment** is a computing environment (container, workstation, server) that:
- Contains a predefined set of validated packages
- Includes validated R and system dependencies
- Has been configured according to organizational validation processes
- Is reproducible and documentable for regulatory purposes

Examples: Docker container, managed RStudio Workbench instance, or Posit Package Manager with filtered repositories.

---

### What is a "closed repository"?

A **closed repository** is a restricted package repository where:
- Only packages meeting validation criteria are available
- Users can only install approved packages
- All installs are auditable and traceable
- Dependencies are automatically resolved from approved sources

This contrasts with open repositories (like CRAN) where any package is installable.

---

## Practical Implementation

### What do we need to get started?

**Minimum requirements** depend on your chosen workflow:

**For Workflow A (Analyst Empowerment):**
- Access to the public val.repo
- Basic understanding of R packages
- Internal guidance on package selection criteria

**For Workflow B (Package Curation):**
- Package metrics (from val.meter or existing repository)
- Agreed validation criteria
- Process for reviewing and maintaining package lists

**For Workflow C (Enterprise Policy):**
- Validated package source
- System-level access to R configuration
- Agreed installation criteria

**For Workflow D (Internal Repository):**
- Package scope/seed list
- Defined organizational validation criteria
- CI/CD environment (optional but recommended)
- Internal hosting capability (repository, container registry)

---

### How do we define our validation criteria?

Use **{val.criterion}** to define filtering criteria:

```r
# Example: Filter for actively maintained packages with good documentation
my_filters <- val.criterion::risk_filter(
  maintenance_activity > 0.5,
  has_vignettes == TRUE,
  has_examples == TRUE,
  reverse_dependencies < 100
)
```

**Steps to define criteria:**
1. Review R Validation Hub white paper and community recommendations
2. Assess your organization's risk tolerance and use case
3. Define specific metrics and thresholds
4. Document your criteria and rationale
5. Pilot with a test package set
6. Iterate based on experience

---

### How do we generate validation reports?

Use **{val.report}** to generate structured validation reports:

```r
# Generate report for a specific package
package_report <- val.report::generate_report(
  package = "ggplot2",
  metrics = my_metrics,
  criteria = my_criteria
)
```

Reports include:
- Package metadata and characteristics
- Validation metrics assessment
- Criteria compliance summary
- Risk assessment
- Evidence and documentation
- Validation decision and justification

---

### Can we build an internal validated repository?

Yes! Use **Workflow D** with {val.setup}:

1. **Define your package scope** – Identify packages for assessment
2. **Generate metrics** – Use {val.meter} to compute package characteristics
3. **Apply criteria** – Use {val.criterion} to filter packages
4. **Generate reports** – Use {val.report} to document decisions
5. **Build outputs** – Create repository, images, dashboards
6. **Automate with CI/CD** – Use {val.setup} with GitHub Actions for repeatable execution

The result is an internal, organization-specific package distribution system aligned with regulatory requirements.

---

## Technical & Regulatory

### How does this align with regulatory expectations?

R Validation Hub tools support regulatory compliance by:

1. **Documented Assessment** – Structured, auditable validation process
2. **Transparent Metrics** – Clear, reproducible evaluation criteria
3. **Traceability** – Complete record of package versions and assessments
4. **Repeatability** – Automated workflows ensure consistency
5. **Evidence Generation** – Reports suitable for regulatory submissions
6. **Change Management** – Track updates and version changes over time

The tools support but do not replace regulatory guidance from health authorities. Always consult relevant guidelines (FDA, EMA, etc.).

---

### What about dependencies and downstream packages?

The R Validation Hub tools address dependencies through:

1. **Dependency Assessment** – {val.meter} evaluates package dependency risk
2. **Reverse Dependency Tracking** – Understand impact when validating packages
3. **Multi-Repository Setup** – Specify multiple repos so missing dependencies fall back to CRAN:

```r
options(repos = c(
  Validated = "https://raw.githubusercontent.com/pharmaR/val.repo/refs/heads/main/",
  CRAN = "https://cran.r-project.org"
))
```

4. **Explicit Manifests** – Document complete dependency trees in validation reports
5. **Version Locking** – Container images and package managers support fixed versions

---

### How does validation differ from verification?

In R Validation Hub context:

- **Validation** – Assessing whether R packages are suitable for use (risk-based evaluation)
- **Verification** – Testing that specific analyses/code produce expected results
- **Infrastructure Validation** – Ensuring R runtime, OS, and dependencies are properly configured

All three are important for regulated environments. The R Validation Hub focuses on package validation; verification and infrastructure validation follow standard software engineering practices.

---

## Getting Started

### Where do we start if we're new?

**Recommended starting point:**

1. **Review Foundational Material**
   - Read the [R Validation Hub white paper](https://pharmar.org/white-paper/)
   - Explore the [Early Adoption Guide](https://pharmar.org/adoption-guide/)

2. **Explore Public Resources**
   - Browse the public [val.repo](https://pharmar.github.io/val.repo/) validated repository
   - Review example validation reports

3. **Choose a Starting Workflow**
   - Start with **Workflow A** if you want individuals to make better package decisions
   - Start with **Workflow B** if you want to define shared package acceptance criteria
   - Start with **Workflow C** if you manage enterprise environments
   - Start with **Workflow D** if you need full governance automation

4. **Join the Community**
   - Connect via [Slack](https://rconsortium.slack.com/archives/C07VAVDBR3M)
   - Attend R Validation Hub working group meetings
   - Participate in early adopter program

5. **Pilot & Iterate**
   - Start with a small set of packages
   - Document learnings and challenges
   - Share feedback with the community

---

### What resources and documentation are available?

**Official Resources:**

- [R Validation Hub Website](https://pharmar.org/)
- [Early Adoption Guide](https://pharmar.org/adoption-guide/)
- [White Paper](https://pharmar.org/white-paper/)
- [Public Validated Repository](https://pharmar.github.io/val.repo/)
- [Case Studies](https://github.com/pharmaR/case_studies)

**GitHub Repositories:**
- [val.meter](https://github.com/pharmaR/val.meter) – Package metrics
- [val.criterion](https://github.com/pharmaR/val.criterion) – Filtering and criteria
- [val.report](https://github.com/pharmaR/val.report) – Report generation
- [val.repo](https://github.com/pharmaR/val.repo) – Validated repository
- [val.setup](https://github.com/pharmaR/val.setup) – Pipeline orchestration
- [val.pipeline](https://github.com/pharmaR/val.pipeline) – Example implementation (Arcus)

**Community Channels:**
- [Slack: R Validation Hub](https://rconsortium.slack.com/archives/C07VAVDBR3M)
- [R Consortium](https://r-consortium.org/)

---

### Who should we contact for support?

**For Different Needs:**

| Question Type | Best Contact |
|---|---|
| Technical issues or bugs | Open an issue on relevant GitHub repository (val.meter, val.criterion, etc.) |
| General questions or guidance | R Validation Hub Slack channel |
| Early adopter support | Direct communication with R Validation Hub maintainers (via adoption program) |
| Implementation strategies | Community meetings or case studies |
| Regulatory guidance | Consult health authority guidance; R Validation Hub provides tools, not regulatory advice |

**R Consortium Code of Conduct:**
All interactions should follow the [R Consortium Code of Conduct](https://r-consortium.org/codeofconduct.html).

---

## Roadmap & Future

### What's coming next?

**R Validation Hub Roadmap:**

**Phase 1: Early Adoption Community** (Current)
- Kick off early adopter program
- Gather feedback and refine tools
- Document initial learnings

**Phase 2: Health Authority Submission Pilot**
- Work with 4-5 organizations
- Test workflows with actual regulatory submissions
- Gather regulatory feedback
- Iterate based on findings

**Phase 3: General Availability**
- Broader release of tools and guidance
- Community-scale adoption
- Mature ecosystem

**Ongoing:**
- Tool improvements based on feedback
- Documentation enhancements
- Community case study collection
- Integration with related tools

---

### How do we stay informed about updates?

**Stay Informed:**

1. **GitHub Watch** – Star and watch relevant repositories for release notifications
2. **Slack** – Join the [R Validation Hub Slack channel](https://rconsortium.slack.com/archives/C07VAVDBR3M)
3. **Website** – Check [pharmar.org](https://pharmar.org/) for announcements
4. **Meetings** – Attend R Validation Hub working group meetings (schedule on website)
5. **Social Media** – Follow R Consortium on LinkedIn and Twitter

---

## Troubleshooting

### Common Implementation Challenges

**Challenge: "We're not sure which workflow is right for us"**

*Solution:* Review the workflow comparison table in the Early Adoption Guide. Most organizations start with Workflow A or B, then scale to C or D as needs evolve. Contact the community via Slack for guidance.

---

**Challenge: "Our team doesn't have R package expertise"**

*Solution:* The R Validation Hub tools are designed for teams without deep R expertise. Focus on:
- Understanding package metrics (documentation, tests, maintenance)
- Defining organizational criteria (not technical R details)
- Using automated tools for assessment
- Partnering with experienced R developers as needed

---

**Challenge: "Defining validation criteria feels overwhelming"**

*Solution:*
- Start with community recommendations (white paper, case studies)
- Pilot with a small package set
- Document rationale for choices
- Iterate and refine based on experience
- Use {val.criterion} defaults as starting point

---

**Challenge: "How do we handle internal packages?"**

*Solution:*
- Internal packages can be validated using the same tools
- {val.meter} computes metrics on internal packages
- Generate reports without requiring external download metrics
- Include internal packages in CI/CD validation pipelines

---

**Challenge: "We have regulatory requirements not addressed by these tools"**

*Solution:*
- R Validation Hub tools are foundational; build compliance on top
- Use generated reports and metrics as evidence
- Implement additional validation steps as needed (e.g., security scans, performance testing)
- Consult health authority guidance for specific requirements
- Share your extensions with the community

---

## More Information

**Questions not answered here?**

- Check the [Early Adoption Guide](https://pharmar.org/adoption-guide/)
- Review [R Validation Hub repositories](https://github.com/pharmaR)
- Ask in the [R Validation Hub Slack channel](https://rconsortium.slack.com/archives/C07VAVDBR3M)
- Attend R Validation Hub working group meetings
- Submit issues to relevant GitHub repositories

**Last Updated:** October 2026

---

*The R Validation Hub is an R Consortium-funded ISC Working Group dedicated to enabling the use of R in regulated environments through transparent, risk-based package validation.*
