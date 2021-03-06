% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tropr.R
\name{trope_content}
\alias{trope_content}
\title{Get TV Tropes content}
\usage{
trope_content(.url)
}
\arguments{
\item{.url}{TV Tropes page url}
}
\value{
\code{tropr.content} if it exists, it returns \code{tropr.content}
  which contains TV Tropes page content, otherwise it will show error.
}
\description{
You can use \code{trope_content} with TV Tropes URL to get its content,
and \code{as.data.frame()} converts the content to \code{data.frame}
}
\examples{
library(tropr)

.url <- "http://tvtropes.org/pmwiki/pmwiki.php/Main/SenseiChan"
\dontrun{
content <- trope_content(.url)
}
}
