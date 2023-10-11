import numpy as np
import numpy.linalg as la

mat = np.array([[0.000, 1/2.0, 1/2.0, 1/3.0, 0.000],
                [1/4.0, 0.000, 0.000, 1/3.0, 0.000],
                [1/4.0, 1/2.0, 0.000, 1/3.0, 0.000],
                [1/4.0, 0.000, 0.000, 0.000, 1.000],
                [1/4.0, 0.000, 1/2.0, 0.000, 0.000]])

# Compute the eigenvalues (w) and the eigenvectors (v)
w, v = la.eig(mat)

# v is a matrix whose columns are different eigenvectors
# For this matrix, the eigenvector associated to the eigenvalue
# 1 is in the first column. This is the steady state vector:
ssvector = np.real(v[:,0])

# Normalize the vector so its components add up to 1
# To do this, we just compute the sum and then divide the components
# by this sum
vectorSum = np.sum(ssvector)
# Now prob is a steady state vector of probabilities
prob = ssvector/vectorSum