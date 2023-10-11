import numpy as np
import numpy.linalg as la
from math import sqrt

A = np.array([[1.0, 3.0, 5.0], [5.0, 2.0, 0.0], [2.0, 1.0, 1.0]])
b = np.array([1/sqrt(3), 1/sqrt(3), 1/sqrt(3)])

# Iteration loop
for i in range(50):
    # Compute the product A*b
    b = np.dot(A, b)
    # Normalize
    b = b/la.norm(b)

solution = b

# Compute eigenvalues and eigenvectors
eigvals, eigvecs = la.eig(A)

# Find the index of the smalles eigenvalue
i = np.argmax(eigvals)
# Store the smallest eigenvalue
eigenvalue = eigvals[i]
# Store the associated eigenvector
eigenvector = eigvecs[:, i]