import numpy as np
import scipy.linalg as spla

def qr_by_gram_schmidt(As):
    # Create lists Qs and Rs
    Qs = []
    Rs = []
    
    # Execute the procedure for every matrix in As and store the results
    # in Qs and Rs
    for A in As:
        # Get the size of A
        # n: number of rows
        n = np.shape(A)[0]
        # m: number of columns
        m = np.shape(A)[1]
        
        # Preallocate matrices
        Q = np.zeros([n, m])
        R = np.zeros([m, m])
        
        # Iterate over the columns of A
        for j in range(m):
            # Store the j-th column of A in a vector v
            v = A[:, j]
            
            # Operate with j columns
            for i in range(j):
                # Compute the first part of the projection
                R[i, j] = np.dot(Q[:,i].T, A[:,j])
                # Finish computing the projection by multiplying by
                # Q[:,i] and subtract the projection
                v = v - R[i,j] * Q[:,i]
            
            # Compute the norm
            R[j,j] = np.linalg.norm(v)
            # Normalize
            Q[:,j] = v/R[j,j];
        
        # Append the results
        Qs.append(Q)
        Rs.append(R)
    
    return Qs, Rs

Qs, Rs = qr_by_gram_schmidt(As)