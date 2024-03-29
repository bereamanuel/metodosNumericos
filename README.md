# Métodos Numéricos

Métodos numéricos en MATLAB | Python | R

## Interpolación
  - Newton ( Matlab | Python | R )
  - Lagrange ( Matlab | Python | R )
  - Hermite ( Matlab | Python | R )
  - Splines ( Matlab | Python | R )

## Diferenciación
  - Diferenciación de alta precisión: Taylor derivada orden 1, 2 y 3 ( Matlab | Python | R )
  - Extrapolación de Richardson ( Matlab | Python | R )

## Integración Simple y múltiple
  
  - Simple:
    - Nodos equiespaciados, fórmulas de Newton-Cotes:
      - Métodos cerrados:
        - Método de los trapecios simple ( Matlab | Python | R )
        - Método de los trapecios compuesto ( Matlab | Python | R )
        - Método de Simpson simple ( Matlab | Python | R )
        - Método de Simpson compuesto ( Matlab | Python | R )

      - Métodos abiertos:
        - Punto medio simple ( Matlab | Python | R )
        - Punto medio compuesto ( Matlab | Python | R )

    - Nodos no equiespaciados, cuadraturas de Gauss:
        - Gauss-Legendre ( Python | R )
        - Gauss-Hermite ( Python | R )
        - Gauss-Chebyshev ( Python | R )
        - Gauss-Laguerre ( Python | R )
  
  - Multiple:

    - Nodos equiespaciados:
      - Método de los trapecios ( Python | R )
      - Método de Simpson ( Python | R )
      
    - Nodos no equiespaciados:
        - Gauss-Legendre ( Python | R )
        - Gauss-Hermite ( Python | R )
        - Gauss-Chebyshev ( Python | R )
        - Gauss-Laguerre ( Python | R )

## Métodos númericos para EDOs: 

### Problema del valor inicial (PVI)

  Vamos a tratar de resolver problemas de valor inicial de ecuaciones diferenciaes de primer orden, sistemas de ecuaciones diferenciales de primer orden y ecuaciones diferenciales de orden superior.
  
  - Métodos de un paso:
    - Euler Explicito  ( Matlab | Python | R )
    - Euler Implicito ( Matlab | Python | R )
    - Heun  ( Matlab | Python | R )
    - Runge-Kutta ( Matlab | Python | R )
    - Euler Sistemas ( Matlab | Python | R )

  - Métodos multipaso:
    - Adams-Bashforth (Método explícito) ( Matlab | Python | R )
    - Adams-Moulton (Método Implícito) ( Matlab | Python | R )
    - Predictor-corrector ( Matlab | Python | R )

  - Problemas Stiff:
    En matlab utilizaremos la función ode15s
    En python podemos utilizar la librería scipy, con el comando scipy.integrate.ode(f).set_integrator('vode', method='bdf', order=15)
    En R podemos utilizar Librería pracma, con la función ode45

### Problemas de contorno (PVC)

  - Método de disparo lineal con condiciones Dirichlet.
  - Método de disparo no lineal con condiciones Dirichlet:
    - MD con secante.
    - MD con Newton.
    
  - Método de disparo no lineal con condiciones Naturales, son variaciones de MD con secante y Newton que no son genéricos, ya que dependen del problema propuesto.
  En el código de MD con secante y MD con Newton, queda comentado que podríamos cambiar.
    

## Sistemas de ecuaciones lineales

  - Métodos directos:
    Para utilizar los método directos y resolver problemas del estilo $Ax = b$, necesitamos que $A$ sea invertible. Además, la dimensión de la matriz no debe ser grande.
    
    Como en general queremos calcular matrices con dimensión grande. Vamos a desarrollar métodos iterativos.

  - Métodos iteretivos
    - Método Jacobi ( Matlab | Python | R)
    - Método Gauss-Seidel ( Matlab | Python | R)
    - Método JSOR ( Matlab | Python | R)
    - Método SOR ( Matlab | Python | R)

  - Crout tridiagonales ( Matlab | Python | R )

## Ecuaciones no lineales
  
  Vamos a utilizar métodos iterativos, crearemos un script para Newton y otro comentado donde hay que cambiar, para en función del método a utilizar poder modificarlo rápidamente
  
  - Newton (Matlab | Python | R)
  - Jarrat (Matlab)

  
## Sistemas de ecuaciones no lineales
  Vamos a utilizar métodos iterativos, crearemos un script para Newton y otro comentado donde hay que cambiar, para en función del método a utilizar poder modificarlo rápidamente
  
  - Newton (Matlab)
  - Jarrat (Matlab)


## Polinomios
Funciones que nos ayudan a conseguir las raíces y los coeficientes necesarios para hacer cuadraturas de Gauss.
  - Legendre ( Python | R )
  - Chebyshev ( Python | R )
  - Laguerre ( Python | R )
  - Hermite ( Python | R )
