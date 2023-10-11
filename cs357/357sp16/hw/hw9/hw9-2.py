import numpy as np
import numpy.linalg as la
import matplotlib.pyplot as plt

# Build matrix A
A = np.array([2005, 2006, 2008, 2009, 2010, 2011, 2012])

# Build matrix y
y = np.array([9, 49, 67, 76, 86, 87, 86])

c = np.polyfit(A,y,2)
x = np.linspace(min(A), max(A), 100)

plt.figure()
plt.plot(A, y, 'go')
plt.plot(x, np.polyval(c, x))
plt.show()

c0 = c[2]
c1 = c[1]
c2 = c[0]