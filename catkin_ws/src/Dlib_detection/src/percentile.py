import numpy as np
import cv2

# img1 = cv2.resize(img1,[])

nums = [[2,4,5,6],[1,1,2,2]]
pr = np.percentile(nums, (25, 50, 100), interpolation='midpoint')
print(pr,len(pr))

