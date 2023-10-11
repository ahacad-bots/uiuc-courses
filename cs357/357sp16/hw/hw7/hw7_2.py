import numpy as np
from io import BytesIO
import matplotlib.pyplot as plt
import numpy as np

# Plot the image
plt.figure()
plt.imshow(image, cmap='gray')
plt.show()

# Compute the singular value decomposition
U, S, V = np.linalg.svd(image, full_matrices=False)

# Plot the singular values
plt.figure()
plt.plot(S[:50])
plt.xlabel('i')
plt.ylabel('S[i]')
plt.title('Singular Values')
plt.show()

# Find the number of singular values required to get a fraction
# f of the information

# Compute the sum with all the singular values
E = np.sum(S)

# Initialize the number of singular values to 1
k = 1

# In a while loop, increase the number of singular values until
# enough information is obtained
while np.sum(S[:k]) <= f * E:
    k += 1

# Ak will contain the compressed image
Ak = 0
for i in range(k):
    # Equation in the assignment
    Ak += S[i] * np.outer(U[:,i], V[i,:])

# Show the compressed image
plt.figure()
plt.imshow(Ak, cmap='gray')
plt.title("f = " + str(f) + ", k = " + str(k))
plt.show()