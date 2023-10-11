# Import the modules
from scipy import sparse
import numpy as np
from scipy.sparse import linalg


# Create a new sparse matrix from flow_matrix, using the CSR method
b = sparse.csr_matrix(flow_matrix)
# Store the data in V
V = b.data
# Store the index pointer in IA
IA = b.indptr
# Store the indices in JA
JA = b.indices


# Number of columns in intersection_flows
N = np.shape(intersection_inflows)[1]
# Initialize biggest norm
biggestNorm = 0

# Iterate over the entries in intersection_flows
for i in range(N):
    # Solve the system with the sparse matrix
    x = linalg.spsolve(b, intersection_inflows[:,i])
    # Determine if the solution has the biggest norm
    if np.linalg.norm(x) > biggestNorm:
        # Store x
        max_traffic_flow = x
        # Update biggestNorm
        biggestNorm = np.linalg.norm(x)