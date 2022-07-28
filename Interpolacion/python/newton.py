def newton(xi,fi):
    import numpy as np
    import pandas as pd
    import sympy as sym

    xi = np.array(xi)
    fi = np.array(fi)
    n = len(xi)
    x = sym.Symbol('x')

    col = 1
    vx = 1 
    p = fi[0]

    dd = pd.DataFrame(np.zeros((n,n)))
    dd.iloc[:,0] = fi

    for i in range(1,n):
        for j in range(i,n):
            dd.iloc[j,i] = (dd.iloc[j,i-1] - dd.iloc[j-1,i-1] )/(xi[j] - xi[j-i])
    
    while col <=n-1:
        vx = vx*(x-xi[col-1])
        p = p + dd.iloc[col,col]*vx
        col += 1

    return np.diag(dd), p


xi = [x for x in range(1971,2021,10)]
fi =[33.956 ,37.743 ,39.434 ,40.847, 46.816 ]

coef , p = newton(xi,fi)

print(coef)
print(p)