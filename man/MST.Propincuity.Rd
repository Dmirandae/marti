\name{MST.Propincuity}
\alias{MST.Propincuity}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
MST.Propincuity(distance.Matrix)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{distance.Matrix}{
%%     ~~Describe \code{distance.Matrix} here~~
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
function (distance.Matrix) 
{
    if (class(distance.Matrix) == "dist") 
        distance.Matrix <- as.matrix(distance.Matrix)
    n <- dim(distance.Matrix)[1]
    tree <- listado <- NULL
    large.value <- max(distance.Matrix) + 1
    diag(distance.Matrix) <- large.value
    index.i <- 1
    for (i in 1:(n - 1)) {
        tree <- c(tree, index.i)
        min.Distance <- apply(as.matrix(distance.Matrix[, tree]), 
            2, min)
        a <- sortIndex(distance.Matrix[, tree])[1, ]
        b <- sortIndex(min.Distance)[1]
        index.j <- tree[b]
        index.i <- a[b]
        listado[i] <- distance.Matrix[index.i, index.j]
        for (j in tree) {
            distance.Matrix[index.i, j] <- large.value
            distance.Matrix[j, index.i] <- large.value
        }
    }
    return(listado)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
