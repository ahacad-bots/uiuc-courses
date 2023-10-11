import numpy as np
from io import BytesIO
import scipy.misc
from numpy.random import randint
import matplotlib.pyplot as plt

# Some important values
# Number of elements = pixels in waldo_image
L = np.size(waldo_image)

# Number of rows (X) and columns (Y) in the whole image (group_image)
X, Y = np.shape(group_image)

# Number of rows (M) and columns (N) of waldo_image
M, N = np.shape(waldo_image)

# Create the selection matrix
selection = group_image[:M, :N]

# Compute the norm of the difference between the selection and waldo_image
smallerDiff = np.linalg.norm(np.reshape(waldo_image, [L,1]) - np.reshape(selection, [L,1]))

top_left = (0,0)

# Move the starting point of the selection matrix
for i in range(X - M + 1):
    for j in range(Y - N + 1):
        # Update the selection matrix
        selection = group_image[i:i+M, j:j+N]
        # Compute the norm of the difference using this new selection
        diff = np.linalg.norm(np.reshape(waldo_image, [L,1]) - np.reshape(selection, [L,1]))
        # If it is smaller than the smallest difference computed so far, update it
        if diff < smallerDiff:
            # Update the corner with the lowest difference
            top_left = (i, j)
            # Update the smallest difference computed so far
            smallerDiff = diff

# Darken pixels outside Waldo's face
for i in range(X):
    for j in range(Y):
        # Only darken pixels outside Waldo's face region
        if i < top_left[0] or i > (top_left[0] + M) or j < top_left[1] or j > (top_left[1] + N):
            group_image[i,j] *= 0.3

# Show the result
plt.imshow(group_image, cmap="gray")