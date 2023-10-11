import numpy as np
from random import shuffle

# Allocate memory for the A matrix of measurements and the b vector
n = len(components)
# Allocate memory for the A matrix of measurements
A = np.zeros([n, n])
b = np.zeros(n)

# Create dictionary to map component to row in the matrix
comp2row = {}
# Index counter
i = 0
# Read the list of components and populate the dictionary
for component in components:
    comp2row[component] = i
    # Increment the index
    i += 1

# Reuse the i variable to index each matrix row
i = 0
# Populate the matrix A with the measurements
for test in test_data:
    # Iterate over the measurements using the 'test' key
    for measurement in test_data[test]:
        # Retrieve the description to see if it is a component measurement
        # or a PowerConsumed measurement
        description = measurement[0]
        # If the description is is PowerConsumed, the values go in the b vector
        if description == 'PowerConsumed':
            b[i] = measurement[1]
        else:
            # If the description is not 'PowerConsumed', use the comp2row
            # dictionary to determine the index of the component
            A[i, comp2row[description]] = measurement[1]
    i += 1

# Solve the system
x = np.linalg.solve(A, b)