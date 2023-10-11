import numpy as np
import scipy.linalg as spla


#  An example: Let
#P = [0 1 0
#     1 0 0
#     0 0 1]

# Then the pivot ordering vector would be
#pivots = [1
#          0
#          2]


# Find the PLU factorization
P, L, U = spla.lu(A)
P = P.T

# Size of the matrix
n = np.shape(A)[0]

pivots = []

# Traverse the matrix
for i in range(n):
    for j in range(n):
        # Check if an entry in P is one
        # If it is, store the index and terminate the inner loop
        if P[i, j] == 1:
            pivots.append(j)
            continue

# Convert the list to a numpy array (because they require you to do that)
pivots = np.array(pivots)