import numpy as np
import numpy.linalg as la
import matplotlib.pyplot as plt
from numpy.linalg import inv

# Create matrices to form grid
X, Y = np.meshgrid(x, y)

#gaussian = np.zeros((x.shape[0],y.shape[0]))
gaussian = np.zeros(X.shape)
##gaussian = np.zeros(Y.shape)

#E = np.zeros(mu.shape)
#print(X)
for i in range(X.shape[0]):
    for j in range(X.shape[1]):
        E = np.array([x[i],y[j]])
        gaussian[i,j] = np.exp(-1/2.0 * np.dot(np.transpose(E-mu), np.dot(inv(covariance_mat), E-mu)))

plt.imshow(gaussian)