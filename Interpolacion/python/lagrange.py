def lagrange(xi,fi):
    import numpy as np
    import sympy as sym
    xi = xi
    fi = fi
    n = len(xi)
    x = sym.Symbol('x')
    col = 0
    p=0
    while col < n:
        vi = xi.copy()
        vi.pop(col)
        L = (np.prod([x - np.array(vi)]) / np.prod([xi[col] - np.array(vi)]))
        p = p+fi[col]*L
        col +=1
    return  p


xi = [x for x in range(1971,2021,10)]
fi =[33.956 ,37.743 ,39.434 ,40.847, 46.816 ]
p = lagrange(xi,fi)

print(p)