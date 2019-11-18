x <- c(9:20, 1:5, 3:7, 0:8)

y <- c(1:3, 1:5, 3:7)

duplicated(y)

duplicated(x)


y[duplicated(y)]

x[duplicated(x)]



y%in%y[duplicated(y)]

y[y%in%y[duplicated(y)]]


x%in%x[duplicated(x)]

x[x%in%x[duplicated(x)]]
