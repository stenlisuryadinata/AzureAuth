% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{decode_jwt}
\alias{decode_jwt}
\title{Decode info in a token (which is a JWT object)}
\usage{
decode_jwt(token)
}
\arguments{
\item{token}{A string representing the encoded token.}
}
\value{
A list containing up to 3 components: \code{header}, \code{payload} and \code{signature}.
}
\description{
Decode info in a token (which is a JWT object)
}
\details{
An OAuth token is a \emph{JSON Web Token}, which is a set of base64URL-encoded JSON objects containing the token credentials along with an optional (opaque) verification signature. \code{decode_jwt} decodes the credentials into an R object so they can be viewed.

Note that \code{decode_jwt} does not touch the token signature or attempt to verify the credentials. You should not rely on the decoded information without verifying it independently. Passing the token itself to Azure is safe, as Azure will carry out its own verification procedure.
}
\seealso{
\href{https://jwt.io}{jwt.io}, the main JWT informational site

\href{https://en.wikipedia.org/wiki/JSON_Web_Token}{JWT Wikipedia entry}
}
