library("polynom")

lagrange  <- function(xi,fi){
    n  <-  length(xi)
    col  <-  1
    p  <-  0

    while (col<=n){
        vi  <-  xi
        vi  <-  vi[-col]
        L  <- 1
        for (i in seq(1,length(xi))) {
            l  <- as.polynomial(c(-xi[i], 1))
            L  <- l * L
        }
        L   <-  (L/prod(xi[col] - vi))
        p   <- p+L*fi[col]
        col <-  col+1
    }
  list(p= L)
}
xi <-  seq(1971,2011,10)
fi  <-  c(33.956,37.743,39.434,40.847,46.816 )

p  <- lagrange(xi,fi)
summary(p)
p