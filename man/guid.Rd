% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/normalize.R
\name{normalize_tenant}
\alias{normalize_tenant}
\alias{normalize_guid}
\alias{is_guid}
\title{Normalize GUID and tenant values}
\usage{
normalize_tenant(tenant)

normalize_guid(x)

is_guid(x)
}
\arguments{
\item{tenant}{For \code{normalize_tenant}, a string containing an Azure Active Directory tenant. This can be a name ("myaadtenant"), a fully qualified domain name ("myaadtenant.onmicrosoft.com" or "mycompanyname.com"), or a valid GUID.}

\item{x}{For \code{is_guid}, a character string; for \code{normalize_guid}, a string containing a \emph{validly formatted} GUID.}
}
\value{
For \code{is_guid}, whether the argument is a validly formatted GUID.

For \code{normalize_guid}, the GUID in canonical format. If the argument is not recognised as a GUID, it throws an error.

For \code{normalize_tenant}, the normalized ID or name of the tenant.
}
\description{
These functions are used by \code{get_azure_token} to recognise and properly format tenant and app IDs.
}
\details{
A tenant can be identified either by a GUID, or its name, or a fully-qualified domain name (FQDN). The rules for normalizing a tenant are:
\enumerate{
\item If \code{tenant} is recognised as a valid GUID, return its canonically formatted value
\item Otherwise, if it is a FQDN, return it
\item Otherwise, if it is not the string "common", append ".onmicrosoft.com" to it
\item Otherwise, return the value of \code{tenant}
}

See the link below for GUID formats recognised by these functions.
}
\examples{

is_guid("72f988bf-86f1-41af-91ab-2d7cd011db47")    # TRUE
is_guid("{72f988bf-86f1-41af-91ab-2d7cd011db47}")  # TRUE
is_guid("72f988bf-86f1-41af-91ab-2d7cd011db47}")   # FALSE (unmatched brace)
is_guid("microsoft")                               # FALSE

# all of these return the same value
normalize_guid("72f988bf-86f1-41af-91ab-2d7cd011db47")
normalize_guid("{72f988bf-86f1-41af-91ab-2d7cd011db47}")
normalize_guid("(72f988bf-86f1-41af-91ab-2d7cd011db47)")
normalize_guid("72f988bf86f141af91ab2d7cd011db47")

normalize_tenant("microsoft")     # returns 'microsoft.onmicrosoft.com'
normalize_tenant("microsoft.com") # returns 'microsoft.com'
normalize_tenant("72f988bf-86f1-41af-91ab-2d7cd011db47") # returns the GUID

}
\seealso{
\link{get_azure_token}

\href{https://docs.microsoft.com/en-us/dotnet/api/system.guid.parse}{Parsing rules for GUIDs in .NET}. \code{is_guid} and \code{normalize_guid} recognise the "N", "D", "B" and "P" formats.
}
