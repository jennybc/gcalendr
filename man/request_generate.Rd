% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generate_request.R
\name{request_generate}
\alias{request_generate}
\title{Build a request for the Google Calendar API}
\usage{
request_generate(endpoint = character(), params = list(),
  token = calendar_token())
}
\arguments{
\item{endpoint}{Character. Nickname for one of the selected Calendar v3 API
endpoints built into \code{gcalendr}. Learn more in \code{\link[=calendar_endpoints]{calendar_endpoints()}}.}

\item{params}{Named list. Parameters destined for endpoint URL substitution,
the query, or the body.}

\item{token}{Calendar token. Set to \code{NULL} to suppress the inclusion of a token.
Note that, if auth has been de-activated via \code{\link[=calendar_auth_config]{calendar_auth_config()}},
\code{calendar_token()} will actually return \code{NULL}.}
}
\value{
\code{list()}\cr Components are \code{method}, \code{path}, \code{query}, \code{body},
\code{token}, and \code{url}, suitable as input for \code{\link[=request_make]{request_make()}}.
}
\description{
Build a request, using knowledge of the \href{https://developers.google.com/calendar/v3/reference/}{Calendar v3 API} from its
\href{https://www.googleapis.com/discovery/v1/apis/calendar/v3/rest}{Discovery Document}.
Most users should, instead, use higher-level wrappers that facilitate
common tasks, such as reading calendar lists or calendar entries. The
functions here are intended for internal use and for programming around the
Calendar API.

\code{request_generate()} lets you provide the bare minimum of input.
It takes a nickname for an endpoint and:
\itemize{
\item Uses the API spec to look up the \code{path}, \code{method}, and base URL.
\item Checks \code{params} for validity and completeness with respect to the
endpoint. Separates parameters into those destined for the body, the query,
and URL endpoint substitution (which is also enacted).
\item Adds an API key to the query if and only if \code{token = NULL}.
}
}
\examples{
\dontrun{
req <- request_generate(
  "drive.files.get",
  list(fileId = "abc"),
  token = calendar_token()
)
req
}
}
\seealso{
\code{\link[gargle:request_develop]{gargle::request_develop()}}, \code{\link[gargle:request_build]{gargle::request_build()}}

Other low-level API functions: \code{\link{calendar_token}}
}
\concept{low-level API functions}
