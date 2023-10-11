import numpy as np
import numpy.linalg as la
import matplotlib.pyplot as pt
import scipy.linalg

def lu_inv(A):
    # This function obtains the inverse of a matrix using the LU
    # decomposition
    
    # Size of the matrix
    n = np.shape(A)[0]
    
    # Obtain the PLU decomposition
    P, L, U = scipy.linalg.lu(A)
    
    # Identity matrix used to find the inverse
    b = np.eye(n)
    
    # Solve the linear system Lc = b (L is lower triangular)
    c = scipy.linalg.solve_triangular(L, np.dot(P.T, b), lower=True)
    
    # Solve the linear system Ux = c (U is upper triangular)
    x = scipy.linalg.solve_triangular(U, c)
    
    return x

# Compute the inverse of A
Ainv = lu_inv(A)

# List to store monthly distributions
dists = []

# Current month distribution
d_c = d_9

# Use Ainv to compute the previous months
for i in range(9):
    # Compute the previous month and update it as the current month
    d_c = np.dot(Ainv, d_c)
    # Store
    dists = [d_c] + dists

# When the for loop is finished, dists is a list of distributions, from
# month 8 to month 0. Store months 6, 3 and 0
d_6 = dists[6]
d_3 = dists[3]
d_0 = dists[0]

# Find the index of the maximum value at month 0
origin_index = np.argmax(d_0)


# Plot the graphs
pt.figure()
pt.title("Next state after month 6")
plot_graph(A, A.dot(d_6))

pt.figure()
pt.title("Next state after month 3")
plot_graph(A, A.dot(d_3))

pt.figure()
pt.title("Next state after month 0")
plot_graph(A, A.dot(d_0))