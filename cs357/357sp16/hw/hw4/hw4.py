import numpy as np
import matplotlib.pyplot as plt

def pnorm(x, p):
    # Variable to store the sum
    norm = 0
    # Obtain the size of the vector
    n = x.size
    # Iterate over the number of elements in the vector
    # and obtain the sum of the powers of the components
    for i in range(n):
        norm = norm + np.abs(x[i])**p
    # Once the sum has been computed, we obtain the power 1/p
    norm = norm**(1/p)
    return norm

def generatevecs(n, p, r):
    # Create list of n equidistant angles in the range [0, 2*pi]
    angles = np.linspace(0, 2*np.pi, num = n)
    # Obtain the coordinates using radius = 1
    x = np.cos(angles)
    y = np.sin(angles)
    for i in range(n):
        # Compute the p-norm
        norm = pnorm(np.array([x[i], y[i]]), p)
        # Scale to the specified radius
        x[i] = r * x[i]/norm
        y[i] = r * y[i]/norm
    # Return a tuple with the coordinates
    return (x, y)

# Compute the norm of the sum of the vectors
sum_norm = np.array([pnorm(x+y,1),pnorm(x+y,2),pnorm(x+y,5),pnorm(x+y,0.5)])

# Compute the sum of the norms of the vectors
norm_sum = np.array([pnorm(x,1)+pnorm(y,1),pnorm(x,2)+pnorm(y,2),pnorm(x,5)+pnorm(y,5),pnorm(x,0.5)+pnorm(y,0.5)])

plt.figure()
plt.hold(True)
# 2D ball with respect to the 1-norm with radius ||x||_1
a, b = generatevecs(500, 1, pnorm(x, 1))
plt.plot(a, b)
# 2D ball with respect to the 1-norm with radius ||y||_1
a, b = generatevecs(500, 1, pnorm(y, 1))
plt.plot(a, b)
# 2D ball with respect to the 1-norm with radius ||x+y||_1
a, b = generatevecs(500, 1, sum_norm[0])
plt.plot(a, b)
# 2D ball with respect to the 1-norm with radius ||x||_1 + ||y||_1
a, b = generatevecs(500, 1, norm_sum[0])
plt.plot(a, b)
plt.gca().set_aspect("equal")
plt.title('Balls with respect to the 1-norm')
plt.legend([r"$||x||_1$", r"$||y||_1$", r"$||x+y||_1$", r"$||x||_1+||y||_1$"])

plt.figure()
plt.hold(True)
# 2D ball with respect to the 2-norm with radius ||x||_2
a, b = generatevecs(500, 2, pnorm(x, 2))
plt.plot(a, b)
# 2D ball with respect to the 2-norm with radius ||y||_2
a, b = generatevecs(500, 2, pnorm(y, 2))
plt.plot(a, b)
# 2D ball with respect to the 2-norm with radius ||x+y||_2
a, b = generatevecs(500, 2, sum_norm[1])
plt.plot(a, b)
# 2D ball with respect to the 2-norm with radius ||x||_2 + ||y||_2
a, b = generatevecs(500, 2, norm_sum[1])
plt.plot(a, b)
plt.gca().set_aspect("equal")
plt.title('Balls with respect to the 2-norm')
plt.legend([r"$||x||_2$", r"$||y||_2$", r"$||x+y||_2$", r"$||x||_2+||y||_2$"])

plt.figure()
plt.hold(True)
# 2D ball with respect to the 5-norm with radius ||x||_5
a, b = generatevecs(500, 5, pnorm(x, 5))
plt.plot(a, b)
# 2D ball with respect to the 5-norm with radius ||y||_5
a, b = generatevecs(500, 5, pnorm(y, 5))
plt.plot(a, b)
# 2D ball with respect to the 5-norm with radius ||x+y||_5
a, b = generatevecs(500, 5, sum_norm[2])
plt.plot(a, b)
# 2D ball with respect to the 5-norm with radius ||x||_5 + ||y||_5
a, b = generatevecs(500, 5, norm_sum[2])
plt.plot(a, b)
plt.gca().set_aspect("equal")
plt.title('Balls with respect to the 5-norm')
plt.legend([r"$||x||_5$", r"$||y||_5$", r"$||x+y||_5$", r"$||x||_5+||y||_5$"])

plt.figure()
plt.hold(True)
# 2D ball with respect to the 0.5-norm with radius ||x||_0.5
a, b = generatevecs(500, 0.5, pnorm(x, 0.5))
plt.plot(a, b)
# 2D ball with respect to the 0.5-norm with radius ||y||_0.5
a, b = generatevecs(500, 0.5, pnorm(y, 0.5))
plt.plot(a, b)
# 2D ball with respect to the 0.5-norm with radius ||x+y||_0.5
a, b = generatevecs(500, 0.5, sum_norm[3])
plt.plot(a, b)
# 2D ball with respect to the 0.5-norm with radius ||x||_0.5 + ||y||_0.5
a, b = generatevecs(500, 0.5, norm_sum[3])
plt.plot(a, b)
plt.gca().set_aspect("equal")
plt.title('Balls with respect to the 5-norm')
plt.legend([r"$||x||_{0.5}$", r"$||y||_{0.5}$", r"$||x+y||_{0.5}$", r"$||x||_{0.5}+||y||_{0.5}$"])
print('yes')