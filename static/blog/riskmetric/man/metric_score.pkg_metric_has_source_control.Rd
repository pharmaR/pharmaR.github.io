% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/assess_has_source_control.R
\name{metric_score.pkg_metric_has_source_control}
\alias{metric_score.pkg_metric_has_source_control}
\title{Score a package for inclusion of an associated source control url}
\usage{
\method{metric_score}{pkg_metric_has_source_control}(x, ...)
}
\arguments{
\item{x}{a \code{pkg_metric_has_source_control} packge metric object}

\item{...}{additional arguments unused}
}
\value{
\code{1} if any source control url is provided, otherwise \code{0}
}
\description{
Coerce a list of source control urls into a numeric value indicating whether
the number of listed urls is greater than 0.
}
\examples{
metric_score(assess_has_source_control(pkg_ref("riskmetric")))
}
\seealso{
Other \code{metric_score.*} functions: 
\code{\link{metric_score.pkg_metric_covr_coverage}()},
\code{\link{metric_score.pkg_metric_downloads_1yr}()},
\code{\link{metric_score.pkg_metric_export_help}()},
\code{\link{metric_score.pkg_metric_has_bug_reports_url}()},
\code{\link{metric_score.pkg_metric_has_maintainer}()},
\code{\link{metric_score.pkg_metric_has_news}()},
\code{\link{metric_score.pkg_metric_has_vignettes}()},
\code{\link{metric_score.pkg_metric_has_website}()},
\code{\link{metric_score.pkg_metric_last_30_bugs_status}()},
\code{\link{metric_score.pkg_metric_license}()},
\code{\link{metric_score.pkg_metric_news_current}()}
}
\concept{\code{metric_score.*} functions}
