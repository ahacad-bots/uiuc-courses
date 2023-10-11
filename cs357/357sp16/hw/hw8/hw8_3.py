import numpy as np
import scipy.linalg as spla
import matplotlib.pyplot as plt

x = np.array([10, 15, 20])
y = np.array([11.6, 11.85, 12.25])
# Get the size of the system, 2 columns for a linear system of the
# form c0 + c1 x
n = x.size
m = 2

# Build A matrix, preallocate with ones
A = np.ones([n, m])
# Replace the second colummn (index 1) with the values of x
for i, data in enumerate(x):
    A[i, 1] = data

# Find the QR factorization of A
Q, R = spla.qr(A, mode='economic')

# The least squares problem A'Ac = A'y is solved with the QR factorization as
# Rc = Q'y. Therefore, c = R^(-1) Q' y. Given that R is an upper triangular
# matrix, we can perform back substitution to apply the inverse at the right
# hand side:
c = spla.solve_triangular(R, np.dot(Q.T, y))

# Find some values for the fitted line
xfit = np.array([[1, min(x)], [1, max(x)]])
yfit = np.dot(xfit, c)



# Plot
plt.figure()
# Data points
plt.plot(x, y, 'go', label='Data')
# Fitted line
plt.plot(xfit[:,1], yfit, 'b', label='Linear Fit')
plt.legend(loc='lower right')
plt.xlim([8, 22])
plt.xlabel('x')
plt.ylabel('y')
plt.title('Linear Fit using the QR Factorization:')
plt.show()