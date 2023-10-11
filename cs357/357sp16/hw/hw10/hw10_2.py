import matplotlib.pyplot as plt
import numpy as np
import numpy.linalg as npla

# Plot the input image
plt.figure()
plt.imshow(image, cmap='gray')

# Get the size of the image
n = np.shape(image)[0]

# Build the Discrete Fourier Transform matrix (the T matrix)
# Initialize with ones
DFT = np.ones([n, n])

# Define the vector with n elements from 0 to 2pi
x = np.linspace(0, 2*np.pi, n, endpoint=False)
# Counter variable for the multiplier
a = 1
# Start building the transformation matrix by pairs of columns, containing
# sin and cos respectively
for i in range(1, n, 2):
    # Fill the column with sin
    DFT[:,i] = np.sin(a * x)
    # Fill the next column with cos
    DFT[:,i+1] = np.cos(a * x)
    # Increment the multiplier counter
    a +=1

# Compute the inverse of the DFT matrix
DFTinv = npla.inv(DFT)

# Obtain the frequency domain representation
# Operate first with the rows
image_freq = np.dot(DFTinv, image.T)
# Operate then with the columns
image_freq = np.dot(DFTinv, image_freq.T)

# Apply low pass filter, starting with zeros
image_low_pass = np.zeros([n, n])
# Replace only the region of interest, below low_length
image_low_pass[:low_length,:low_length] += image_freq[:low_length,:low_length]
# Obtain the representation back in the original domain with DFT
# Operate first with the rows
image_low_pass = np.dot(DFT, image_low_pass.T)
image_low_pass = np.dot(DFT, image_low_pass.T)

# Apply high pass filter, starting with original frequency representation
image_high_pass = image_freq.copy()
# Replace the low frequencies with zeros
image_high_pass[:n-high_length,:n-high_length] *= 0
# Recover the original representation
image_high_pass = np.dot(DFT, image_high_pass.T)
image_high_pass = np.dot(DFT, image_high_pass.T)