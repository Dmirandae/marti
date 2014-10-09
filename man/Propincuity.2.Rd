\name{Propincuity.2}
\alias{Propincuity.2}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
Propincuity.2(dist.Matrix)
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
    minimos <- apply(dist.Matrix, 1, min)
    parejas.minimos <- matrix(NA, nrow = length(minimos), ncol = 2)
    for (i in 1:length(minimos)) {
        parejas.minimos[i, 1] <- i
        parejas.minimos[i, 2] <- (which(dist.Matrix[, i] == minimos[i]))
    }
    eliminar <- NULL
    for (i in 1:(length(parejas.minimos[, 1]) - 1)) {
        for (j in (i + 1):length(parejas.minimos[, 1])) {
            if (all(parejas.minimos[i, ] \%in\% parejas.minimos[j, 
                ])) {
                print(paste("a eliminar en ", i, "---", j))
                parejas.minimos[j, ] <- c(-rnorm(1), -rnorm(1))
                eliminar <- c(eliminar, j)
            }
        }
    }
    minimos <- minimos[-eliminar, ]
    return(minimos)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
