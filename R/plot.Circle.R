plot.Circle <- function(x, y, r) {
  angles <- seq(0,2*pi,length.out=360)
  lines(r*cos(angles)+x,r*sin(angles)+y)
}
