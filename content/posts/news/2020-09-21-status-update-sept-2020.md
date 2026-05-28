## Background

[rOpenSci](https://ropensci.org) is an organization devoted to
“transforming science through data, software and reproducibility.” One
of rOpenSci’s focal activities is peer review of R packages,
historically focusing on packages that cover the [data management
lifecycle](https://devguide.ropensci.org/policies.html#aims-and-scope).
This has historically excluded software implementing statistical
methods, for which standards and review require addressing a different
set of challenges. This year, we have begun tackling these so as to
expand our peer review system to explicitly encompass statistical
software, under
[project](https://ropensci.org/blog/2019/07/15/expanding-software-review/)
funded by the Alfred P. Sloan Foundation.

Two goals for the project are to develop sets of standards for
statistical R packages against which they can be reviewed, and to
develop a suite of tools to support for this assessment. Many of these
tools are intended to function automatically, and to provide overviews
of software structure and function, as well as to automatically diagnose
and provide information on errors, warnings, and other diagnostic
messages issued during execution of statistical software functions.

These tools relate closely R Validation Hub projects, including the
[`riskmetric`
package](https://www.pharmar.org/blog/2020/06/09/2020-06-02-riskmetric-intro-jun-2020/)
and the [Risk Assessment
Application](https://www.pharmar.org/blog/2020/08/05/2020-08-05-risk-assessment-application/).
Both R Validation Hub and rOpenSci aim to automate, as much as possible,
the production of a reports that can be used to evaluate software. We
have distinct aims and scope, however, resulting in a complementary set
of tools, which this blog post aims to highlight.

## Package Reporting

Our automated tools aim to provide peer-reviewers with information that
helps them understand the structure and functionality of R packages they
are evaluating, so they can better undertake parts of reviews which can
not be automatically evaluated. The first of these tools is
[`packgraph`](https://github.com/ropenscilabs/packgraph), which provides
a templated report on function call graphs in an R package.

[`packgraph`](https://github.com/ropenscilabs/packgraph) provides an
overview of package structure and inter-relationships between package
functions, along with an optional interactive visualization of the
network of function calls within a package. Function call networks are
commonly divided among distinct clusters of locally inter-connected
functions, with the resultant visualization using a different colour to
visually distinguish each cluster. Applying the primary function
`pg_graph()` function to the [`riskmetric`
package](https://github.com/pharmar/riskmetric) graphical
representation:

![](/blog/2020-09-21-status-update-sept-2020_files/packgraph.png)

<!-- ```{r packgraph-viz, echo = FALSE, out.width = "100%"} -->
<!-- knitr::include_graphics ("/blog/2020-09-21-status-update-sept-2020_files/packgraph.png") -->
<!-- ``` -->

Each node of the network is a function, with sizes scaled by how many
times that function is called. Each line reflects a call from one
function to another, with a thickness scaled by numbers of calls between
those two functions. The function at the centre of the purple star shape
is the core `pkg_metric` function, with the long tail representing
functions for processing errors and warnings. That graph provides an
immediate visual representation of overall package structure, revealing
in the case of the [`riskmetric`](https://github.com/pharmar/riskmetric)
package a large number of effectively independent functions which are
not directly called by other functions. Most of these isolated functions
represent the various assessment metrics and associated caching
procedures, which in turn reflect the modular design of the package, in
which assessments, and the connections between these peripheral isolated
functions, are controlled by the user rather than being hard-coded
within the package.

Most packages have more defined clusters of interconnections which this
interactive graphical output can help to explore and understand. The
`pg_report()` function also generates a tabular summary of this function
call network. By default, the `pg_report()` function only summarizes
inter-relationships between exported functions of package, although
setting `exported_only = FALSE` will yield a summary of
inter-relationships between all functions of a package. Here is the
summary of exported functions of the
[`riskmetric`](https://github.com/pharmar/riskmetric) package.

    library(packgraph)
    pkg_source <- "/<local>/<path>/<to>/riskmetric"
    g <- pg_graph(pkg_source, plot = FALSE)
    pg_report(g)

    ══ riskmetric ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════

    The package has 32 exported functions, and 215 non-exported funtions. The exported functions are structured into the following
    15 primary clusters containing 11, 57, 2, 15, 5, 2, 7, 7, 2, 3, 3, 3, 2, 3 and 5 functions


    | cluster|  n|name                     |exported | num_params| num_doc_words| num_doc_lines| num_example_lines| centrality|
    |-------:|--:|:------------------------|:--------|----------:|-------------:|-------------:|-----------------:|----------:|
    |       1|  1|allow_mutation           |FALSE    |          3|           140|            13|                 0|          2|
    |       1|  2|[[.pkg_ref               |FALSE    |          3|            NA|             0|                NA|         NA|
    |       1|  3|[[<-.pkg_ref             |FALSE    |          3|            NA|            10|                NA|         NA|
    |       1|  4|available_pkg_ref_fields |FALSE    |          1|           140|             1|                 0|         NA|
    |       1|  5|bare_env                 |FALSE    |          3|           132|             9|                 0|         NA|
    |       1|  6|dec_mutations_count      |FALSE    |          1|            41|             0|                 0|         NA|
    |       1|  7|inc_mutations_count      |FALSE    |          1|            41|             0|                 0|         NA|
    |       1|  8|names.pkg_ref            |FALSE    |          2|            NA|             0|                NA|         NA|
    |       1|  9|pkg_ref_cache            |FALSE    |          4|            NA|            14|                NA|         NA|
    |       1| 10|pkg_ref_mutability_error |FALSE    |          1|           118|             7|                 0|         NA|
    |       1| 11|print.pkg_ref            |FALSE    |          2|            NA|             5|                NA|         NA|


    | cluster|  n|name                                   |exported | num_params| num_doc_words| num_doc_lines| num_example_lines| centrality|
    |-------:|--:|:--------------------------------------|:--------|----------:|-------------:|-------------:|-----------------:|----------:|
    |       2|  1|pkg_metric_eval                        |FALSE    |          4|           139|             3|                 0|         94|
    |       2|  2|as_pkg_metric_error                    |FALSE    |          1|            60|             8|                 0|         28|
    |       2|  3|as_pkg_metric_na                       |FALSE    |          2|            68|             7|                 0|          7|
    |       2|  4|assessment_error_empty                 |TRUE     |          2|            48|             1|                 0|          3|
    |       2|  5|as_pkg_metric_todo                     |FALSE    |          2|            72|             7|                 0|          2|
    |       2|  6|get_package_dependencies               |FALSE    |          2|            85|             1|                 0|          2|
    |       2|  7|parse_dcf_dependencies                 |FALSE    |          1|            29|             1|                 0|          2|
    |       2|  8|as_pkg_metric                          |TRUE     |          2|            40|             7|                 0|         NA|
    |       2|  9|as_pkg_metric.default                  |FALSE    |          2|            NA|             8|                NA|         NA|
    |       2| 10|as_pkg_metric.expr_output              |FALSE    |          2|            NA|             2|                NA|         NA|
    |       2| 11|as_pkg_metric_condition                |FALSE    |          3|            62|             0|                 0|         NA|
    |       2| 12|assess_covr_coverage.default           |FALSE    |          2|            NA|             7|                NA|         NA|
    |       2| 13|assess_covr_coverage.pkg_source        |FALSE    |          2|            NA|             0|                NA|         NA|
    |       2| 14|assess_dependencies.default            |FALSE    |          2|            NA|             5|                NA|         NA|
    |       2| 15|assess_dependencies.pkg_bioc_remote    |FALSE    |          2|            NA|             5|                NA|         NA|
    |       2| 16|assess_dependencies.pkg_cran_remote    |FALSE    |          2|            NA|             1|                NA|         NA|
    |       2| 17|assess_dependencies.pkg_install        |FALSE    |          2|            NA|             7|                NA|         NA|
    |       2| 18|assess_dependencies.pkg_source         |FALSE    |          2|            NA|             0|                NA|         NA|
    |       2| 19|assess_downloads_1yr.pkg_ref           |FALSE    |          2|            NA|            18|                NA|         NA|
    |       2| 20|assess_export_help.pkg_install         |FALSE    |          2|            NA|             0|                NA|         NA|
    |       2| 21|assess_export_help.pkg_remote          |FALSE    |          2|            NA|             8|                NA|         NA|
    |       2| 22|assess_export_help.pkg_source          |FALSE    |          2|            NA|             1|                NA|         NA|
    |       2| 23|assess_exported_namespace.default      |FALSE    |          2|            NA|             1|                NA|         NA|
    |       2| 24|assess_exported_namespace.pkg_install  |FALSE    |          2|            NA|             0|                NA|         NA|
    |       2| 25|assess_exported_namespace.pkg_source   |FALSE    |          2|            NA|             6|                NA|         NA|
    |       2| 26|assess_has_bug_reports_url.default     |FALSE    |          2|            NA|            10|                NA|         NA|
    |       2| 27|assess_has_examples.pkg_ref            |FALSE    |          2|            NA|             8|                NA|         NA|
    |       2| 28|assess_has_maintainer                  |TRUE     |          2|            45|             1|                 3|         NA|
    |       2| 29|assess_has_news.pkg_ref                |FALSE    |          2|            NA|             0|                NA|         NA|
    |       2| 30|assess_has_source_control              |TRUE     |          2|            53|             2|                 3|         NA|
    |       2| 31|assess_has_vignettes.pkg_ref           |FALSE    |          2|            NA|             0|                NA|         NA|
    |       2| 32|assess_has_website                     |TRUE     |          2|            46|             1|                 3|         NA|
    |       2| 33|assess_last_30_bugs_status             |TRUE     |          2|            50|             9|                 3|         NA|
    |       2| 34|assess_license                         |TRUE     |          2|            42|            17|                 3|         NA|
    |       2| 35|assess_news_current.pkg_ref            |FALSE    |          2|            NA|            79|                NA|         NA|
    |       2| 36|assess_news_current.pkg_remote         |FALSE    |          2|            NA|             7|                NA|         NA|
    |       2| 37|assess_r_cmd_check.default             |FALSE    |          2|            NA|             0|                NA|         NA|
    |       2| 38|assess_r_cmd_check.pkg_bioc_remote     |FALSE    |          2|            NA|             2|                NA|         NA|
    |       2| 39|assess_r_cmd_check.pkg_cran_remote     |FALSE    |          2|            NA|             2|                NA|         NA|
    |       2| 40|assess_r_cmd_check.pkg_source          |FALSE    |          2|            NA|             7|                NA|         NA|
    |       2| 41|assess_remote_checks.default           |FALSE    |          2|            NA|             7|                NA|         NA|
    |       2| 42|assess_remote_checks.pkg_bioc_remote   |FALSE    |          2|            NA|            11|                NA|         NA|
    |       2| 43|assess_remote_checks.pkg_cran_remote   |FALSE    |          2|            NA|             0|                NA|         NA|
    |       2| 44|assess_reverse_dependencies.default    |FALSE    |          2|            NA|            11|                NA|         NA|
    |       2| 45|assess_size_codebase.default           |FALSE    |          2|            NA|             1|                NA|         NA|
    |       2| 46|assess_size_codebase.pkg_install       |FALSE    |          2|            NA|             2|                NA|         NA|
    |       2| 47|assess_size_codebase.pkg_source        |FALSE    |          2|            NA|             2|                NA|         NA|
    |       2| 48|assessment_error_as_warning            |TRUE     |          3|            62|            26|                 0|         NA|
    |       2| 49|assessment_error_throw                 |TRUE     |          3|            56|             1|                 0|         NA|
    |       2| 50|bug_reports_status                     |FALSE    |          2|            NA|             1|                NA|         NA|
    |       2| 51|capture_expr_output                    |FALSE    |          4|            84|             7|                 0|         NA|
    |       2| 52|format_assessment_message              |FALSE    |          3|           198|            10|                 0|         NA|
    |       2| 53|is_error                               |FALSE    |          1|            NA|             7|                NA|         NA|
    |       2| 54|pkg_metric                             |TRUE     |          3|            87|             3|                 0|         NA|
    |       2| 55|pkg_ref_cache.covr_coverage.pkg_source |FALSE    |          2|            41|             1|                 0|         NA|
    |       2| 56|remove_base_packages                   |FALSE    |          1|            55|             0|                 0|         NA|
    |       2| 57|search_version_string                  |FALSE    |          1|            NA|             0|                NA|         NA|


    | cluster|  n|name       |exported | num_params| num_doc_words| num_doc_lines| num_example_lines| centrality|
    |-------:|--:|:----------|:--------|----------:|-------------:|-------------:|-----------------:|----------:|
    |       3|  1|as_pkg_ref |TRUE     |          2|            NA|             5|                NA|         NA|
    |       3|  2|pkg_ref    |TRUE     |          2|           501|             0|                12|         NA|


    | cluster|  n|name                 |exported | num_params| num_doc_words| num_doc_lines| num_example_lines| centrality|
    |-------:|--:|:--------------------|:--------|----------:|-------------:|-------------:|-----------------:|----------:|
    |       4|  1|new_pkg_ref          |FALSE    |          4|            NA|             3|                NA|  9.0000000|
    |       4|  2|verify_pkg_source    |FALSE    |          3|            62|             0|                 0|  7.5000000|
    |       4|  3|pkg_install          |FALSE    |          2|            NA|             7|                NA|  7.3333333|
    |       4|  4|is_available_bioc    |FALSE    |          2|            NA|            12|                NA|  2.5000000|
    |       4|  5|is_available_cran    |FALSE    |          3|            NA|             3|                NA|  2.5000000|
    |       4|  6|determine_pkg_source |FALSE    |          3|            46|             6|                 0|  1.8333333|
    |       4|  7|pkg_bioc             |FALSE    |          1|            NA|             7|                NA|  0.3333333|
    |       4|  8|pkg_cran             |FALSE    |          2|            NA|             7|                NA|  0.3333333|
    |       4|  9|pkg_missing          |FALSE    |          1|            NA|            12|                NA|  0.3333333|
    |       4| 10|pkg_source           |FALSE    |          1|            NA|             4|                NA|  0.3333333|
    |       4| 11|as_pkg_ref.character |FALSE    |          5|            NA|             1|                NA|         NA|
    |       4| 12|get_pkg_ref_classes  |FALSE    |          2|            75|             1|                 0|         NA|
    |       4| 13|is_url_subpath_of    |FALSE    |          2|            50|             1|                 0|         NA|
    |       4| 14|pkg_cohort           |FALSE    |          0|            NA|             1|                NA|         NA|
    |       4| 15|pkg_library          |FALSE    |          1|            NA|             3|                NA|         NA|


    | cluster|  n|name                               |exported | num_params| num_doc_words| num_doc_lines| num_example_lines| centrality|
    |-------:|--:|:----------------------------------|:--------|----------:|-------------:|-------------:|-----------------:|----------:|
    |       5|  1|examples_from_dir                  |FALSE    |          2|            96|             7|                 0|          1|
    |       5|  2|examples_from_pkg                  |FALSE    |          1|            94|             6|                 0|          1|
    |       5|  3|filter_rd_db                       |FALSE    |          1|            81|            31|                 0|         NA|
    |       5|  4|pkg_ref_cache.examples.pkg_install |FALSE    |          3|            NA|             7|                NA|         NA|
    |       5|  5|pkg_ref_cache.examples.pkg_source  |FALSE    |          3|            NA|             7|                NA|         NA|


    | cluster|  n|name              |exported | num_params| num_doc_words| num_doc_lines| num_example_lines| centrality|
    |-------:|--:|:-----------------|:--------|----------:|-------------:|-------------:|-----------------:|----------:|
    |       6|  1|format.pkg_metric |FALSE    |          2|            NA|             7|                NA|         NA|
    |       6|  2|with_unclassed_to |FALSE    |          4|            65|             7|                 0|         NA|


    | cluster|  n|name                         |exported | num_params| num_doc_words| num_doc_lines| num_example_lines| centrality|
    |-------:|--:|:----------------------------|:--------|----------:|-------------:|-------------:|-----------------:|----------:|
    |       7|  1|metric_score                 |TRUE     |          2|            60|             1|                 0|          1|
    |       7|  2|firstS3method                |FALSE    |          3|           107|             1|                 0|         NA|
    |       7|  3|get_assessment_columns       |FALSE    |          1|            72|             5|                 0|         NA|
    |       7|  4|metric_score_condition       |FALSE    |          2|            NA|             8|                NA|         NA|
    |       7|  5|pkg_score.list_of_pkg_metric |FALSE    |          3|            NA|             5|                NA|         NA|
    |       7|  6|pkg_score.tbl_df             |FALSE    |          3|            NA|             7|                NA|         NA|
    |       7|  7|summarize_scores             |TRUE     |          2|           214|             1|                10|         NA|


    | cluster|  n|name                          |exported | num_params| num_doc_words| num_doc_lines| num_example_lines| centrality|
    |-------:|--:|:-----------------------------|:--------|----------:|-------------:|-------------:|-----------------:|----------:|
    |       8|  1|all_assessments               |TRUE     |          0|            57|             5|                 0|         NA|
    |       8|  2|pkg_assess                    |TRUE     |          4|           162|             1|                 0|         NA|
    |       8|  3|pkg_assess.list_of_pkg_ref    |FALSE    |          4|            NA|             1|                NA|         NA|
    |       8|  4|pkg_assess.pkg_ref            |FALSE    |          4|            NA|             1|                NA|         NA|
    |       8|  5|pkg_assess.tbl_df             |FALSE    |          4|            NA|            18|                NA|         NA|
    |       8|  6|roxygen_assess_family_catalog |FALSE    |          0|            66|             0|                 3|         NA|
    |       8|  7|use_assessments_column_names  |FALSE    |          1|            70|             7|                 0|         NA|


    | cluster|  n|name                              |exported | num_params| num_doc_words| num_doc_lines| num_example_lines| centrality|
    |-------:|--:|:---------------------------------|:--------|----------:|-------------:|-------------:|-----------------:|----------:|
    |       9|  1|pkg_ref_cache.bug_reports.default |FALSE    |          2|            NA|             0|                NA|         NA|
    |       9|  2|scrape_bug_reports                |FALSE    |          2|            NA|             2|                NA|         NA|


    | cluster|  n|name                           |exported | num_params| num_doc_words| num_doc_lines| num_example_lines| centrality|
    |-------:|--:|:------------------------------|:--------|----------:|-------------:|-------------:|-----------------:|----------:|
    |      10|  1|news_from_dir                  |FALSE    |          1|            62|             3|                 0|         NA|
    |      10|  2|pkg_ref_cache.news.pkg_install |FALSE    |          3|            NA|             3|                NA|         NA|
    |      10|  3|pkg_ref_cache.news.pkg_source  |FALSE    |          3|            NA|             0|                NA|         NA|


    | cluster|  n|name                              |exported | num_params| num_doc_words| num_doc_lines| num_example_lines| centrality|
    |-------:|--:|:---------------------------------|:--------|----------:|-------------:|-------------:|-----------------:|----------:|
    |      11|  1|pkg_ref_cache.news.pkg_remote     |FALSE    |          3|            51|             6|                 0|         NA|
    |      11|  2|pkg_ref_cache.web_html.pkg_remote |FALSE    |          3|            NA|             2|                NA|         NA|
    |      11|  3|suppressMatchingConditions        |FALSE    |          4|            65|             0|                 0|         NA|


    | cluster|  n|name                                |exported | num_params| num_doc_words| num_doc_lines| num_example_lines| centrality|
    |-------:|--:|:-----------------------------------|:--------|----------:|-------------:|-------------:|-----------------:|----------:|
    |      12|  1|pkg_ref_cache.vignettes.pkg_install |FALSE    |          3|            NA|             3|                NA|         NA|
    |      12|  2|pkg_ref_cache.vignettes.pkg_source  |FALSE    |          3|            NA|             7|                NA|         NA|
    |      12|  3|vignettes_from_dir                  |FALSE    |          1|            67|             7|                 0|         NA|


    | cluster|  n|name                               |exported | num_params| num_doc_words| num_doc_lines| num_example_lines| centrality|
    |-------:|--:|:----------------------------------|:--------|----------:|-------------:|-------------:|-----------------:|----------:|
    |      13|  1|pkg_ref_cache.vignettes.pkg_remote |FALSE    |          3|            NA|             7|                NA|         NA|
    |      13|  2|vignettes_from_html                |FALSE    |          1|            67|             0|                 0|         NA|


    | cluster|  n|name                      |exported | num_params| num_doc_words| num_doc_lines| num_example_lines| centrality|
    |-------:|--:|:-------------------------|:--------|----------:|-------------:|-------------:|-----------------:|----------:|
    |      14|  1|bug_report_metadata       |FALSE    |          2|            34|            20|                 0|         NA|
    |      14|  2|scrape_bug_reports.github |FALSE    |          2|            NA|             1|                NA|         NA|
    |      14|  3|scrape_bug_reports.gitlab |FALSE    |          2|            NA|            15|                NA|         NA|


    | cluster|  n|name                        |exported | num_params| num_doc_words| num_doc_lines| num_example_lines| centrality|
    |-------:|--:|:---------------------------|:--------|----------:|-------------:|-------------:|-----------------:|----------:|
    |      15|  1|standardize_weights         |FALSE    |          2|            NA|             7|                NA|          2|
    |      15|  2|add_default_weights         |FALSE    |          1|            NA|             8|                NA|         NA|
    |      15|  3|check_weights               |FALSE    |          1|            NA|             1|                NA|         NA|
    |      15|  4|summarize_scores.data.frame |FALSE    |          2|            NA|             7|                NA|         NA|
    |      15|  5|summarize_scores.list       |FALSE    |          2|            NA|             1|                NA|         NA|

    There are also 120 isolated functions:


    |   n|name                                                | loc|
    |---:|:---------------------------------------------------|---:|
    |   1|$.pkg_ref                                           |   3|
    |   2|$<-.pkg_ref                                         |   3|
    |   3|%&#124;&#124;%                                      |   1|
    |   4|.DollarNames.pkg_ref                                |   3|
    |   5|.onLoad                                             |  20|
    |   6|[.pkg_ref                                           |   3|
    |   7|[<-.pkg_ref                                         |   5|
    |   8|as_pkg_ref.default                                  |   6|
    |   9|as_tibble.list_of_pkg_ref                           |   9|
    |  10|as_tibble.pkg_ref                                   |   5|
    |  11|assess_covr_coverage                                |   3|
    |  12|assess_dependencies                                 |   3|
    |  13|assess_downloads_1yr                                |   3|
    |  14|assess_export_help                                  |   3|
    |  15|assess_exported_namespace                           |   3|
    |  16|assess_has_bug_reports_url                          |   3|
    |  17|assess_has_examples                                 |   3|
    |  18|assess_has_news                                     |   3|
    |  19|assess_has_vignettes                                |   3|
    |  20|assess_news_current                                 |   3|
    |  21|assess_r_cmd_check                                  |   3|
    |  22|assess_remote_checks                                |   3|
    |  23|assess_reverse_dependencies                         |   3|
    |  24|assess_size_codebase                                |   3|
    |  25|bug_reports_status.github_bug_report                |   3|
    |  26|bug_reports_status.gitlab_bug_report                |   3|
    |  27|format.pkg_metric_error                             |   4|
    |  28|format.pkg_missing                                  |   4|
    |  29|format.pkg_ref                                      |   4|
    |  30|get_assessments                                     |   5|
    |  31|metric_score.default                                |  16|
    |  32|metric_score.pkg_metric_dependencies                |   3|
    |  33|metric_score.pkg_metric_export_help                 |   3|
    |  34|metric_score.pkg_metric_exported_namespace          |   3|
    |  35|metric_score.pkg_metric_has_bug_reports_url         |   3|
    |  36|metric_score.pkg_metric_has_examples                |   7|
    |  37|metric_score.pkg_metric_has_maintainer              |   3|
    |  38|metric_score.pkg_metric_has_news                    |   3|
    |  39|metric_score.pkg_metric_has_source_control          |   3|
    |  40|metric_score.pkg_metric_has_vignettes               |   3|
    |  41|metric_score.pkg_metric_has_website                 |   3|
    |  42|metric_score.pkg_metric_last_30_bugs_status         |   3|
    |  43|metric_score.pkg_metric_news_current                |   3|
    |  44|metric_score.pkg_metric_r_cmd_check                 |   3|
    |  45|metric_score.pkg_metric_remote_checks               |   3|
    |  46|metric_score.pkg_metric_reverse_dependencies        |   3|
    |  47|metric_score_condition.pkg_metric_error             |   3|
    |  48|metric_score_condition.pkg_metric_na                |   3|
    |  49|metric_score_condition.pkg_metric_todo              |   3|
    |  50|pillar_shaft.list_of_pkg_metric                     |  15|
    |  51|pillar_shaft.list_of_pkg_ref                        |   4|
    |  52|pillar_shaft.pkg_metric_error                       |   6|
    |  53|pkg_ref_cache.archive_release_dates                 |   3|
    |  54|pkg_ref_cache.archive_release_dates.pkg_cran_remote |  14|
    |  55|pkg_ref_cache.bug_reports                           |   3|
    |  56|pkg_ref_cache.bug_reports_host                      |   3|
    |  57|pkg_ref_cache.bug_reports_host.default              |   4|
    |  58|pkg_ref_cache.bug_reports_url                       |   3|
    |  59|pkg_ref_cache.bug_reports_url.pkg_bioc_remote       |   6|
    |  60|pkg_ref_cache.bug_reports_url.pkg_cran_remote       |   6|
    |  61|pkg_ref_cache.bug_reports_url.pkg_install           |   3|
    |  62|pkg_ref_cache.bug_reports_url.pkg_source            |   6|
    |  63|pkg_ref_cache.covr_coverage                         |   3|
    |  64|pkg_ref_cache.description                           |   3|
    |  65|pkg_ref_cache.description.pkg_install               |   3|
    |  66|pkg_ref_cache.description.pkg_source                |   3|
    |  67|pkg_ref_cache.downloads                             |   3|
    |  68|pkg_ref_cache.examples                              |   3|
    |  69|pkg_ref_cache.expression_coverage                   |   3|
    |  70|pkg_ref_cache.expression_coverage.pkg_source        |   3|
    |  71|pkg_ref_cache.help                                  |   3|
    |  72|pkg_ref_cache.help.pkg_install                      |   3|
    |  73|pkg_ref_cache.help.pkg_source                       |   3|
    |  74|pkg_ref_cache.help_aliases                          |   3|
    |  75|pkg_ref_cache.help_aliases.pkg_install              |   3|
    |  76|pkg_ref_cache.help_aliases.pkg_source               |  15|
    |  77|pkg_ref_cache.license                               |   3|
    |  78|pkg_ref_cache.license.default                       |   4|
    |  79|pkg_ref_cache.license.pkg_bioc_remote               |   5|
    |  80|pkg_ref_cache.license.pkg_cran_remote               |   5|
    |  81|pkg_ref_cache.maintainer                            |   3|
    |  82|pkg_ref_cache.maintainer.pkg_install                |  18|
    |  83|pkg_ref_cache.maintainer.pkg_remote                 |   5|
    |  84|pkg_ref_cache.news                                  |   3|
    |  85|pkg_ref_cache.news_urls                             |   3|
    |  86|pkg_ref_cache.news_urls.pkg_bioc_remote             |  11|
    |  87|pkg_ref_cache.news_urls.pkg_cran_remote             |   9|
    |  88|pkg_ref_cache.r_cmd_check                           |   3|
    |  89|pkg_ref_cache.r_cmd_check.default                   |   3|
    |  90|pkg_ref_cache.r_cmd_check.pkg_source                |   4|
    |  91|pkg_ref_cache.release_date                          |   3|
    |  92|pkg_ref_cache.release_date.pkg_install              |   5|
    |  93|pkg_ref_cache.release_date.pkg_remote               |   5|
    |  94|pkg_ref_cache.remote_checks                         |   3|
    |  95|pkg_ref_cache.remote_checks.default                 |   3|
    |  96|pkg_ref_cache.remote_checks.pkg_bioc_remote         |  19|
    |  97|pkg_ref_cache.remote_checks.pkg_cran_remote         |  11|
    |  98|pkg_ref_cache.repo_base_url                         |   3|
    |  99|pkg_ref_cache.repo_base_url.pkg_remote              |   3|
    | 100|pkg_ref_cache.source_control_url                    |   6|
    | 101|pkg_ref_cache.tarball_url                           |   3|
    | 102|pkg_ref_cache.tarball_url.pkg_remote                |   3|
    | 103|pkg_ref_cache.vignettes                             |   3|
    | 104|pkg_ref_cache.web_html                              |   3|
    | 105|pkg_ref_cache.web_url                               |   3|
    | 106|pkg_ref_cache.web_url.pkg_bioc_remote               |   3|
    | 107|pkg_ref_cache.web_url.pkg_cran_remote               |   3|
    | 108|pkg_ref_cache.website_urls                          |   3|
    | 109|pkg_ref_cache.website_urls.default                  |   4|
    | 110|pkg_ref_cache.website_urls.pkg_remote               |   6|
    | 111|pkg_score                                           |   3|
    | 112|print.with_eval_recording                           |  55|
    | 113|require_cache_behaviors                             |  15|
    | 114|roxygen_assess_family                               |  18|
    | 115|roxygen_cache_behaviors                             |  11|
    | 116|roxygen_score_family                                |  26|
    | 117|scrape_bug_reports.default                          |   8|
    | 118|vec_cast.character.list_of_pkg_ref                  |   3|
    | 119|vec_cast.double.list_of_pkg_metric                  |   7|
    | 120|with.pkg_ref                                        |   5|

    ── Summary of 32 exported functions ─────────────────────────────────────────────────────────────────────────────────────────────


    |value  | num_params| num_lines| doclines| cmtlines|
    |:------|----------:|---------:|--------:|--------:|
    |mean   |        2.1|       4.4|        5|      1.5|
    |median |        2.0|       3.0|        1|      1.0|

    ── Summary of 215 non-exported functions ────────────────────────────────────────────────────────────────────────────────────────


    |value  | num_params| num_lines| doclines| cmtlines|
    |:------|----------:|---------:|--------:|--------:|
    |mean   |        2.3|       8.3|      5.2|      0.7|
    |median |        2.0|       5.0|      3.0|      0.0|

The primary cluster shown in purple in the preceding image has only two
exported functions, yet is still identified as the primary cluster in
this output because it connects the largest number of internal and
exported functions within the package.

Even when called in default mode to report only on exported functions,
the `pg_report()` function concludes with a statistical summary of
documentation of non-exported functions. All functions should of course
be documented, and these final numbers reveal that every non-exported
function of the [`riskmetric`](https://github.com/pharmar/riskmetric)
package has a median of 2 lines of documentation, with an equivalent
median value of no comment lines, which also reflects good and clean
coding practice. The output of the [`packgraph`
package](https://github.com/ropenscilabs/packgraph) is intended to be
provided at the outset of our review process as an aid to reviewers.

`packgraph` and its main dependency, [`pkgapi`
package](https://github.com/r-lib/pkgapi), can be installed form GitHub
with

    remotes::intall_github("r-lib/pkgapi")`
    remotes::install_github("ropenscilabs/packgraph")

## Package Testing

Package reporting is primarily intended as an aid to reviewers of
packages to be submitted to our peer review system. We are also
developing tools to aid package developers, foremost among which is a
package for automatic testing of statistical software called
[`autotest`](https://github.com/ropenscilabs/autotest). The package
implements a form of “mutation testing” (sometimes called [“mutation
fuzzing”](https://www.fuzzingbook.org/html/MutationFuzzer.html)). This
mutates the objects which are passed to the functions of the package,
automatically testing their response to a variety of potential inputs.
This frees authors from needing to develop tests for myriad possible
edge cases.

[`autotest`](https://github.com/ropenscilabs/autotest) extracts all
example code for a package, parses those examples to examine all objects
being thrown at the package’s functions, and then mutates those objects
to assess what happens. The package will ultimately have a workflow
entirely compatible with
[`riskmetric`](https://github.com/pharmar/riskmetric), and so will act
as a plug-in extension to that package, with automatic tests themselves
being user-controlled and modular.

Current tests include mutations of value, size, class, and other
structural properties of inputs. Mutations may be expected to be
acceptable – such as a documented example which includes some function
`myfn (x = TRUE)`, which would be expected to also work with `x = FALSE`
– or they may be expected to generate warnings or errors, such as in
response to passing a value of `x = "a"` to that example. Robust
software should accept all appropriate mutations of inputs, while
rejecting all inappropriate mutations.
[`autotest`](https://github.com/ropenscilabs/autotest) only produces
output where expectations are not met.

The package is intended as developer tool, because all packages to be
submitted to our peer review system will be expected to yield clean
results when submitted to
[`autotest`](https://github.com/ropenscilabs/autotest). The package will
be able to be applied by anyone developing packages from the moment they
implement their first exported function. The hope is then that ongoing
usage of the package throughout the development of any statistical (or
other) software will enhance its robustness, and reduce any chance of
unexpected behaviour in response to inputs which developers may not
otherwise have anticipated.

Finally, the [`autotest`](https://github.com/ropenscilabs/autotest)
package will also form part of our reporting system, with its output
forming part of reports provided to reviewers. Most importantly, we
intend to implement mechanisms to enable users to control which tests
are run on any particular package, and to oblige those intending to
submit to our system to provide descriptive justifications of why
particular tests may have been switched off. These textual explanations
will then also form part of our reviewer reports, enabling reviewers to
understand not only which kinds of tests package developers deem
inappropriate for their software, but more importantly why.

### Autotesting the riskmetric package

What happens when [`autotest`](https://github.com/ropenscilabs/autotest)
is applied to the [`riskmetric`](https://github.com/pharmar/riskmetric)
package? The main function that does the work is
[`autotest_package()`](https://ropenscilabs.github.io/autotest/reference/autotest_package.html),
as demonstrated with the following code:

    library(autotest)
    system.time(x <- autotest_package("/<local>/<path>/<to>/riskmetric"))

    ★ Extracting example code from 102 .Rd files
      |                                                                              |                                                                      |   0%  |                                                                              |=                                                                     |   1%  |                                                                              |=                                                                     |   2%  |                                                                              |==                                                                    |   3%  |                                                                              |===                                                                   |   4%  |                                                                              |===                                                                   |   5%  |                                                                              |====                                                                  |   6%  |                                                                              |=====                                                                 |   7%  |                                                                              |=====                                                                 |   8%  |                                                                              |======                                                                |   9%  |                                                                              |=======                                                               |  10%  |                                                                              |========                                                              |  11%  |                                                                              |========                                                              |  12%  |                                                                              |=========                                                             |  13%  |                                                                              |==========                                                            |  14%  |                                                                              |==========                                                            |  15%  |                                                                              |===========                                                           |  16%  |                                                                              |============                                                          |  17%  |                                                                              |============                                                          |  18%  |                                                                              |=============                                                         |  19%  |                                                                              |==============                                                        |  20%  |                                                                              |==============                                                        |  21%  |                                                                              |===============                                                       |  22%  |                                                                              |================                                                      |  23%  |                                                                              |================                                                      |  24%  |                                                                              |=================                                                     |  25%  |                                                                              |==================                                                    |  25%  |                                                                              |===================                                                   |  26%  |                                                                              |===================                                                   |  27%  |                                                                              |====================                                                  |  28%  |                                                                              |=====================                                                 |  29%  |                                                                              |=====================                                                 |  30%  |                                                                              |======================                                                |  31%  |                                                                              |=======================                                               |  32%  |                                                                              |=======================                                               |  33%  |                                                                              |========================                                              |  34%  |                                                                              |=========================                                             |  35%  |                                                                              |=========================                                             |  36%  |                                                                              |==========================                                            |  37%  |                                                                              |===========================                                           |  38%  |                                                                              |===========================                                           |  39%  |                                                                              |============================                                          |  40%  |                                                                              |=============================                                         |  41%  |                                                                              |==============================                                        |  42%  |                                                                              |==============================                                        |  43%  |                                                                              |===============================                                       |  44%  |                                                                              |================================                                      |  45%  |                                                                              |================================                                      |  46%  |                                                                              |=================================                                     |  47%  |                                                                              |==================================                                    |  48%  |                                                                              |==================================                                    |  49%  |                                                                              |===================================                                   |  50%  |                                                                              |====================================                                  |  51%  |                                                                              |====================================                                  |  52%  |                                                                              |=====================================                                 |  53%  |                                                                              |======================================                                |  54%  |                                                                              |======================================                                |  55%  |                                                                              |=======================================                               |  56%  |                                                                              |========================================                              |  57%  |                                                                              |========================================                              |  58%  |                                                                              |=========================================                             |  59%  |                                                                              |==========================================                            |  60%  |                                                                              |===========================================                           |  61%  |                                                                              |===========================================                           |  62%  |                                                                              |============================================                          |  63%  |                                                                              |=============================================                         |  64%  |                                                                              |=============================================                         |  65%  |                                                                              |==============================================                        |  66%  |                                                                              |===============================================                       |  67%  |                                                                              |===============================================                       |  68%  |                                                                              |================================================                      |  69%  |                                                                              |=================================================                     |  70%  |                                                                              |=================================================                     |  71%  |                                                                              |==================================================                    |  72%  |                                                                              |===================================================                   |  73%  |                                                                              |===================================================                   |  74%  |                                                                              |====================================================                  |  75%  |                                                                              |=====================================================                 |  75%  |                                                                              |======================================================                |  76%  |                                                                              |======================================================                |  77%  |                                                                              |=======================================================               |  78%  |                                                                              |========================================================              |  79%  |                                                                              |========================================================              |  80%  |                                                                              |=========================================================             |  81%  |                                                                              |==========================================================            |  82%  |                                                                              |==========================================================            |  83%  |                                                                              |===========================================================           |  84%  |                                                                              |============================================================          |  85%  |                                                                              |============================================================          |  86%  |                                                                              |=============================================================         |  87%  |                                                                              |==============================================================        |  88%  |                                                                              |==============================================================        |  89%  |                                                                              |===============================================================       |  90%  |                                                                              |================================================================      |  91%  |                                                                              |=================================================================     |  92%  |                                                                              |=================================================================     |  93%  |                                                                              |==================================================================    |  94%  |                                                                              |===================================================================   |  95%  |                                                                              |===================================================================   |  96%  |                                                                              |====================================================================  |  97%  |                                                                              |===================================================================== |  98%  |                                                                              |===================================================================== |  99%  |                                                                              |======================================================================| 100%
    ✔ Extracted example code

    ── autotesting riskmetric ──

       user  system elapsed 
      0.299   0.051   0.464 

And you can see that the function takes a few seconds to run. The
function returns a [`tibble`](https://tibble.tidyverse.org) object, each
row of which represents a test expectation which was not fulfilled. The
package also implements a `summary` method for these objects an edited
part of which looks like this:

    summary(x)
    Length  Class   Mode 
         0   NULL   NULL 

The result contained no errors or diagnostic messages, and 13 warnings
for functions which have no documented examples. These are considered as
warnings, because the
[`autotest`](https://github.com/ropenscilabs/autotest) package primarily
works by scraping example code for each function, so functions with no
examples can not be tested. A clean
[`autotest`](https://github.com/ropenscilabs/autotest) result could thus
be achieved for the
[`riskmetric`](https://github.com/pharmar/riskmetric) package by
providing example code for each of those listed functions (and ensuring
that the resultant
[`autotest`](https://github.com/ropenscilabs/autotest)-ing of those
examples generated no additional output).

## Package Standards and Peer Review

In addition to the automated tools described in the preceding two
sections, a large part of the project is devoted to devising standards
for statistical software. One challenge we have found in developing
standards is how varied and method-specific best practices for
statistical software can be. As such, we are using a two-tiered
approach: a “general” set of standards applicable to all packages, and
specific standards for sub-categories of statistical software. A package
may fall within multiple sub-categories and more than one set of these
specific standards can apply to them.

We are beginning with 11 statistical sub-categories, based a practical
taxonomy of R packages submitted to statistical journals and
conferences. Full details of the categories and standards can be seen on
the primary [“living
book”](https://ropenscilabs.github.io/statistical-software-review-book/index.html)
of the project, which describes the current categories of:

1.  Bayesian and Monte Carlo Routines
2.  Dimensionality Reduction, Clustering, and Unsupervised Learning
3.  Machine Learning
4.  Regression and Supervised Learning
5.  Probability Distributions
6.  Wrapper Packages
7.  Networks
8.  Exploratory Data Analysis (EDA) and Summary Statistics
9.  Workflow Support
10. Spatial Analyses
11. Time Series Analyses

The tools described above aim to make the task of reviewing packages as
easy as possible. The category-specific standards aim to ensure that
software accepted as part of our system is of the highest possible
quality. One of the primary tasks of reviewers will be to assess
software against these standards.

Currently, we have initial standrads for [five of these
categories](https://ropenscilabs.github.io/statistical-software-review-book/standards.html),
and have released an initial call for “pilot submissions” within those
categories to to help us test and improve the standards and the process
of peer review. We invite any developers reading this blog who might be
interested in submitting a statistical software package for peer review
to contact us (Mark Padgham <mark@ropensci.org> and/or Noam Ross
<ross@ecohealthalliance.org>) about a “pilot submission”. Your
contribution would help improve the quality of our system, while our
assessments and reviews would help improve the quality of your software.
We look forward to any contributions to help improve our system for peer
review of statistical software, and ultimately for helping to improve
the quality of statistical software in R.
