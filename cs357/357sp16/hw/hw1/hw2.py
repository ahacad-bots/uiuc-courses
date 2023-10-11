#Uncomment the 2 lines of code below to read in the image if you are on your local machine
#You do not need/want these lines when submitting your homework on Relate
#For each trial, you will need to generate a row and col location of the point
#Use the following lines to generate a row and col -- note they must be in this order
import numpy as np

num_rows, num_cols = img.shape
numTrials = 1000

count = 0.0

for i in range(numTrials):
    col = np.random.random_integers(0, num_cols-1)
    row = np.random.random_integers(0, num_rows-1)
    if img[row, col] == 0:
        count = count + 1.0

# Black positions to total of examined positions ratio
r = count/numTrials

# Total area in square miles
T = 304 * 450

# Calculate black area
area = T*r

whiteArea = np.sum(img)
blackArea = img.size - whiteArea
rr = blackArea/(blackArea + whiteArea)
actualArea = T * rr

rel_error = abs((area - actualArea)/actualArea)