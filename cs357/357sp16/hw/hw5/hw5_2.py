import numpy as np

n = np.shape(A)[0]
# Allocate memory for the array of elimination matrices
E = np.zeros([n-1, n, n])
# Create a copy of A that, after applying all the eliminations,
# will end up being U
U = A.copy()

# Create the elimination matrices, store them in E and successively
# apply them to obtain U
for i in range(n-1):
    # Left hand side M ith-matrix
    Mi = np.eye(n)
    # Right hand side E i-th matrix
    Ei = np.eye(n)
    # Iterate over the columns to eliminate
    for j in range(i, n-1):
        # Calculate the multiplier
        multiplier = U[j+1, i]/U[i, i]
        # Store it with negative sign in Mi and positive in Ei
        Mi[j+1, i] = -multiplier
        Ei[j+1, i] = multiplier
    # Update U to reflect the elimination
    U = np.dot(Mi, U)
    # Store the elimination matrix
    E[i, :, :] = Ei

# Initialize L
L = np.eye(n)
# Compute L as the dot product of the elimination matrices
for i in range(n-1):
    L = np.dot(L, E[i, :, :])