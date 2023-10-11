from math import sqrt
import numpy as np
import numpy.linalg as la
import scipy.linalg as spla


A = np.array([[1.0, 3.0, 5.0], [5.0, 2.0, 0.0], [2.0, 1.0, 1.0]])
b0 = np.array([1/sqrt(3), 1/sqrt(3), 1/sqrt(3)])

# Find the LU factorization
P, L, U = spla.lu(A)

# Iteration loop
for i in range(50):
    # Solve the system
    b = spla.solve_triangular(L, np.dot(P.T, b0), lower=True)
    b0 = spla.solve_triangular(U, b)
    # Normalize
    b0 = b0/la.norm(b0)

solution = b0

# Compute eigenvalues and eigenvectors
eigvals, eigvecs = la.eig(A)

# Find the index of the smalles eigenvalue
i = np.argmin(np.abs(eigvals))
# Store the smallest eigenvalue
eigenvalue = eigvals[i]
# Store the associated eigenvector
eigenvector = eigvecs[:, i]