import numpy as np
import numpy.linalg as la
import matplotlib.pyplot as plt

ax = plt.gca()
ax.spines['bottom'].set_position('zero')
ax.spines['left'].set_position('zero')
ax.spines['right'].set_position('zero')
ax.spines['top'].set_position('zero')
plt.xlim((-4,4))
plt.ylim((-4,4))

norm_before = la.norm(vec)
vec2 = Q.dot(vec.T)
norm_after = la.norm(vec2)

print(norm_before)
print(norm_after)

plt.arrow(0,0,vec[0],vec[1])
plt.arrow(0,0,vec2[0],vec2[1])
plt.show()