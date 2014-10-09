\name{Propincuity.1}
\alias{Propincuity.1}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
Propincuity.1(dist.Matrix)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dist.Matrix}{
%%     ~~Describe \code{dist.Matrix} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (dist.Matrix) 
{
    dist.Matrix <- as.matrix(distance)
    large.value <- max(dist.Matrix) + 1
    diag(dist.Matrix) <- large.value
    size <- length(colnames(dist.Matrix))
    minimum <- NULL
    for (i in 1:size) {
        minimum[i] <- min(dist.Matrix[i, ])
        dist.Matrix[dist.Matrix == minimum[i]] <- large.value
    }
    return(minimum)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
