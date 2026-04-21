<!--## Introduction -->

Many contributed R packages lack documentation expected in software
qualification, which is required within pharma and other regulated
industries. For pharma, there are various regulations, which require
documentation that demonstrates software is used appropriately and works
as expected. Thus, industry needs to establish appropriate requirements
for R packages using selected metadata and useful risk metrics.

In context of the R Validation Hub, the R package
[`riskmetric`](https://github.com/pharmaR/riskmetric) has been
developed, which seeks to take the first steps in identifying metrics
and best practices to quantify the quality of R packages. It provides a
framework for retrieving package metadata, assessing package metrics,
and summarizing the risk that the package might not provide accurate
results. A corresponding Shiny app, that can be used to generate package
reports using riskmetric, is under development.

In this blog post, we want to illustrate the capabilities and usage of
`riskmetric` and demonstrate how it could fit into an organizations
validation process or its qualified environments.

<!-- ### Installation -->

The `riskmetric` package is not yet on CRAN. Until it is, it can be
installed using `devtools` directly from GitHub:

    devtools::install_github("pharmaR/riskmetric", force = TRUE)

Then, the package can be loaded:

To illustrate how `riskmetric` works, a few packages with a wide range
of popularity have been selected.

-   `riskmetric` (Metrics to evaluate the risk of R packages): Not on
    CRAN yet
-   `utils` (R utility functions): R core package
-   `ggplot2` (Create Elegant Data Visualisations Using the Grammar of
    Graphics): very popular package
-   `Hmisc` (Harrell Miscellaneous functions): something more old school
-   `survminer` (Drawing Survival Curves using `ggplot2`): less popular,
    but established package
-   `coxrobust` (Robust Estimation in Cox Model): oldest R package on
    CRAN

<!--
*Add updated flow chart*
<img src="/img/overview/riskmetric-core-workflow.svg" alt="source: Riskmetric Core Workflow">
-->

When referencing a package, riskmetric first looks for installed
packages but can also assess packages that have not been installed:

    pkg_names <- c(
      "riskmetric",
      "utils",
      "ggplot2",
      "Hmisc",
      "survminer",
      "coxrobust"
    )

    pkgs <- pkg_ref(pkg_names)
    pkgs[[5]]

    ## <pkg_cran_remote, pkg_remote, pkg_ref> survminer v0.5.2
    ## $repo
    ##   [1] "https://cloud.r-project.org/src/contrib"
    ## $source
    ##   [1] "pkg_cran_remote"
    ## $version
    ##   [1] "0.5.2"
    ## $name
    ##   [1] "survminer"
    ## $archive_release_dates...
    ## $bug_reports...
    ## $bug_reports_host...
    ## $bug_reports_url...
    ## $downloads...
    ## $license...
    ## $maintainer...
    ## $news...
    ## $news_urls...
    ## $r_cmd_check...
    ## $release_date...
    ## $remote_checks...
    ## $repo_base_url...
    ## $source_control_url...
    ## $tarball_url...
    ## $vignettes...
    ## $web_html...
    ## $web_url...
    ## $website_urls...

Note that many fields have a trailing `...`; riskmetric will evaluate
and cache the results of the queries later on. When we call the
`pkg_assess()` function on each reference, the metrics will be stored
and become available. In other words, the necessary package metadata is
assessed and an atomic value is added for each assessment and package.

Then, the information is scored in order to estimate associated risk.
This final score converts the assessment value into a single numeric
score between 0 (poor) and 1 (great). Finally each package’s risk is
summarized as a weigthed sum of assessment scores.

For more information, check out the [`riskmetric`
vignette](https://pharmar.github.io/riskmetric/articles/riskmetric.html).

    res <- pkgs %>%
      pkg_assess() %>%
      pkg_score() %>%
      mutate(risk = summarize_scores(.))

The function `summarize_scores()` serves as an example for how a risk
score might be derived. Each organization should decide independently
how to weight different assessments.

<table>
<colgroup>
<col style="width: 10%" />
<col style="width: 10%" />
<col style="width: 11%" />
<col style="width: 17%" />
<col style="width: 9%" />
<col style="width: 13%" />
<col style="width: 12%" />
<col style="width: 14%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: center;">package</th>
<th style="text-align: center;">version</th>
<th style="text-align: center;">r_cmd_check</th>
<th style="text-align: center;">exported_namespace</th>
<th style="text-align: center;">has_news</th>
<th style="text-align: center;">remote_checks</th>
<th style="text-align: center;">news_current</th>
<th style="text-align: center;">has_maintainer</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: center;">riskmetric</td>
<td style="text-align: center;">0.2.7</td>
<td style="text-align: center;">NA</td>
<td style="text-align: center;">0.443</td>
<td style="text-align: center;">1</td>
<td style="text-align: center;">NA</td>
<td style="text-align: center;">0</td>
<td style="text-align: center;">1</td>
</tr>
<tr class="even">
<td style="text-align: center;">utils</td>
<td style="text-align: center;">4.5.0</td>
<td style="text-align: center;">NA</td>
<td style="text-align: center;">0.07081</td>
<td style="text-align: center;">0</td>
<td style="text-align: center;">NA</td>
<td style="text-align: center;">0</td>
<td style="text-align: center;">1</td>
</tr>
<tr class="odd">
<td style="text-align: center;">ggplot2</td>
<td style="text-align: center;">3.5.2.9001</td>
<td style="text-align: center;">NA</td>
<td style="text-align: center;">0.006497</td>
<td style="text-align: center;">1</td>
<td style="text-align: center;">NA</td>
<td style="text-align: center;">0</td>
<td style="text-align: center;">1</td>
</tr>
<tr class="even">
<td style="text-align: center;">Hmisc</td>
<td style="text-align: center;">5.2.3</td>
<td style="text-align: center;">NA</td>
<td style="text-align: center;">0.01639</td>
<td style="text-align: center;">1</td>
<td style="text-align: center;">NA</td>
<td style="text-align: center;">1</td>
<td style="text-align: center;">1</td>
</tr>
<tr class="odd">
<td style="text-align: center;">survminer</td>
<td style="text-align: center;">0.5.2</td>
<td style="text-align: center;">NA</td>
<td style="text-align: center;">NA</td>
<td style="text-align: center;">1</td>
<td style="text-align: center;">0.9464</td>
<td style="text-align: center;">1</td>
<td style="text-align: center;">1</td>
</tr>
<tr class="even">
<td style="text-align: center;">coxrobust</td>
<td style="text-align: center;">1.0.2</td>
<td style="text-align: center;">NA</td>
<td style="text-align: center;">NA</td>
<td style="text-align: center;">1</td>
<td style="text-align: center;">1</td>
<td style="text-align: center;">1</td>
<td style="text-align: center;">1</td>
</tr>
</tbody>
</table>

<!--TODO> describe each of the metrics and their relevance for package quality -->

There are many good programming and package development practices that
establish a package is well made and maintained:

-   `has_vignettes` - Number of published vignettes
-   `has_news` - Number of releases with a NEWS update
-   `has_bug_reports_url` - Presence of a URL for users to report issues
    and bugs found in the package.

Community usage is determined based on the number of downloads. This is
a useful proxy for community support and adhoc testing done by other
developers.

-   `downloads_1yr` – Number of downloads from CRAN, Bioconductor, and
    GitHub in the past year.

Furthermore, the test coverage of a package can provide well established
insights on the package accuracy

-   `covr_coverage` – Package unit test coverage percentage

Several other metrics are under active development that can interrogate
package stability and complexity, e.g.

-   Maturity – Package version and overall maturity
-   Cyclomatic Complexity – Complexity of the code base itself

<!-- ## Create a Package Risk Assessment Report -->

In addition to assessing the set of packages used to develop a project,
`riskmetric` can also be used to assess a package before you introduce
it into your development environment. Here is an example reviewing the
number of downloads for the `survminer` package:

    pkg_ref("survminer") %>%
      assess_downloads_1yr() %>%
      metric_score()

    ## [1] 0.7992852

Finally, this information can be used by a system administrator when
evaluating the suitability of a package, or when writing a validation
report:

> **survminer (v0.5.2)**
>
> Package survminer (v0.5.2) has 597329 downloads in the past year,
> which converts to a `riskmetric` score of 79.93%.

If you are interested in helping with development or the direction of
the package, we are active on GitHub and welcome any contributions. More
details can be found in the “Get Involved” section of the readme file
for [`riskmetric` GitHub page](https://github.com/pharmaR/riskmetric).
