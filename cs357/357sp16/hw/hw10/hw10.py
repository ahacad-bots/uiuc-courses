import numpy as np
import matplotlib.pyplot as plt

# Get the length of the data
n = len(data)
# Initialize the Vandermonde matrix
A = np.zeros([n, n])

# Extract x and y values in numpy arrays
x = []
y = []
for point in data:
    x.append(point[0])
    y.append(point[1])

# Convert into numpy arrays
x = np.array(x)
y = np.array(y)

# Build the Vandermonde matrix
for i in range(n):
    # The i-th column is x to the i-th power
    A[:,i] = x**i

# Solve to find the coefficients of the polynomial interpolant
coefficients = np.linalg.solve(A, y)

# Generate data
xtest = np.linspace(0, max(x), 30)
ytest = np.polyval(coefficients[::-1], xtest)

# Plot the data points together with the polynomial interpolant
plt.figure()
plt.plot(x, y, 'go')
plt.plot(xtest, ytest)