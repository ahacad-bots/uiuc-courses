import numpy as np

def quadratic(a,b,c):
    sqrt_part = np.lib.scimath.sqrt(b**2 - 4*a*c)
    root1 = (-b + sqrt_part) / (2 * a)
    root2 = (-b - sqrt_part) / (2 * a)
    return root1, root2

def eigvals(matrix_2x2):
    vals = np.zeros(2, dtype=matrix_2x2.dtype)
    a,b,c,d = matrix_2x2.flatten()
    vals[:] = quadratic(1.0, -(a+d), (a*d-b*c))
    return vals

def eigvecs(matrix_2x2, vals):
    a,b,c,d = matrix_2x2.flatten()
    vecs = np.zeros_like(matrix_2x2)
    if (b == 0.0) and (c == 0.0):
    vecs[0,0], vecs[1,1] = 1.0, 1.0
    elif c != 0.0:
    vecs[0,:] = vals - d
    vecs[1,:] = c
    elif b != 0:
    vecs[0,:] = b
    vecs[1,:] = vals - a
    return vecs

def eig_2x2(matrix_2x2):
    vals = eigvals(matrix_2x2)
    vecs = eigvecs(matrix_2x2, vals)
    return vals, vecs

a = np.array([[-800.21,-600.00],[-600.00,-1000.48]], dtype=np.float128)
ex = np.exp(a)
eigvals, eigvecs = eig_2x2(ex)

# And to test...
check1 = ex.dot(eigvecs[:,0])
check2 = eigvals[0] * eigvecs[:,0]
print('Checking accuracy..')
print(check1, check2)
print(check1 - check2).dot(check1 - check2),