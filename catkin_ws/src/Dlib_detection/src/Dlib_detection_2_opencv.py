import numpy as np
import cv2

# Load the image and resize it to reduce detection time and improve detection accuracy
image = cv2.imread("0610818-1.jpg")
image = cv2.resize(image, (600, int(image.shape[0]*600/image.shape[1])))

image_copy = image.copy()

# Initialize the Histogram of Oriented Gradients descriptor
hog = cv2.HOGDescriptor()

# Set SVM detector and load the built-in pedestrian detector
hog.setSVMDetector(cv2.HOGDescriptor_getDefaultPeopleDetector())

# Set the parameter of descriptor and return the detection results
(rects, weights) = hog.detectMultiScale(image, winStride=(4,4), padding=(8,8),
                                        scale=1.05)

# Loop over every bounding box and draw a rectangle around all pedestrians
for (x, y, w, h) in rects:
    cv2.rectangle(image_copy, (x,y), (x+w,y+h), (0,0,255), 2)

# Apply non-maximum suppression to the bounding boxes using a fairly large overlapThresh
# to try to maintain overlapping boxes that are still people
rects = np.array([[x,y,x+w,y+h] for (x,y,w,h) in rects])
print(rects)
# pick = non_maximum_suppression_fast(rects, overlapThresh=0.5)

# draw the final bounding boxes
for (x1, y1, x2, y2) in rects:
    cv2.rectangle(image, (x1,y1), (x2,y2), (0,255,0), 2)
    print('the coordinates are ' + x1 + y1 + x2 + y2)


# Show the final result
print('hihi')
cv2.imshow("Before NMS", image_copy)
cv2.imshow("After NMS", image)
cv2.waitKey(0)
cv2.destroyAllWindows()

# Save the result
cv2.imwrite("Before NMS.jpg", image_copy)
cv2.imwrite("After NMS.jpg", image)