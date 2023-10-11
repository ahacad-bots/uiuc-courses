import numpy as np
import numpy.linalg as la
import matplotlib.pyplot as plt

# Build matrix A
A = np.array([[1, 2005],
              [1, 2006],
              [1, 2008],
              [1, 2009],
              [1, 2010],
              [1, 2011],
              [1, 2012]])

# Build matrix y
y = np.array([9, 49, 67, 76, 86, 87, 86])

c = la.solve(np.dot(A.T, A), np.dot(A.T, y))

plt.figure()
plt.plot(A[:,1], y, 'go')
plt.plot(A[:,1], np.dot(A, c))
plt.show()

c0 = c[0]
c1 = c[1]