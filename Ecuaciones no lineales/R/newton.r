newton <- function(f,x0,tol,maxiter,df){

    # Esta función es un genérico para poder resolver ecuaciones no lineales.
    # Se debe modificar las partes comentadas para utilizar un método u otro. 
    # INPUT:
    #     - f: Función a resolver.
    #     - df: Derivada de la función a resolver. (Siempre que se conozca.)
    #     - x0: Estimación inicial.
    #     - tol: Tolerancia del método.
    #     - maxiter: Máximo de iteraciones.
    # OUTPUT:
    #     - x: Solución
    #     - i: Número de iteraciones.
    #     - ACOC: Coef. ACOC

  
  #Empezamos el contador
  i <- 1
  #Evaluamos la funcion para obtener los primeros valores.
  #Si df o esta definido, hará la identidad.
  fx0 <- f(x0)
  dx0 <- df(x0)
  
  #Creamos el criterio de parada
  incre1 <- tol + 1
  incre2 <- tol + 1
  #Para calcular el ACOC
  p <- c()
  while (i < maxiter && (incre1 > tol || incre2 > tol) ) { #Critero de parada + iteraciones
    #1: Aplicar metodo iterativo
    g <- fx0
  dg <- dx0
  x1 <- x0 - g/dg
  #2: Actualizamos criterio de parada
  incre1 <- abs(x1-x0)
  incre2 <- abs(fx0)
  p <- c(p,incre1)
  #3: Actualizamos estimacion inicial
  x0 <- x1
  #4: Actualizamos los valores
  fx0 <- f(x0)
  dx0 <- df(x0)
  #5: +1 en iteracion
  i <- i + 1}
  #Calculamos el ACOC
  n <- length(p)
  acoc <-  log(norm(as.matrix(p[4:n] - p[3:(n-1)]), type = "O") / norm(as.matrix(p[3:(n-1)] - p[2:(n-2)]) , type = "O") ) / log(norm(as.matrix(p[3:(n-1)] - p[2:(n-2)]), type = "O") / norm(as.matrix(p[2:(n-2)]-p[1:(n-3)]), type = "O") )
  
  return(c("x" = x0 , "i" = i, "ACOC" = acoc))
  
}

f <- function(x) { sin(x**2) - x**2 + 1 }
df <-  function(x) {2*x*( cos(x**2) - 1) }

x0 <- 1

tol <- 10**(-10)
maxiter <- 100 
newton(f,x0,tol,maxiter,df)