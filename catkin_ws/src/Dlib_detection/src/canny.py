import cv2

img = cv2.imread('nose_origin_2.jpg')

# img = cv2.resize(img,(720,1080), interpolation=cv2.INTER_AREA)

blurred = cv2.GaussianBlur(img, (5,5),0)
gray = cv2.cvtColor(blurred, cv2.COLOR_BGR2GRAY)
gray_2 = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

xgrad = cv2.Sobel(gray,cv2.CV_16SC1,1,0)
ygrad = cv2.Sobel(gray,cv2.CV_16SC1,0,1)

# edge_outputx = cv2.Canny(xgrad,ygrad,50,150)
edge_outputy = cv2.Canny(gray,0,50)
edge_outputy_2 = cv2.Canny(gray_2,40,100)
# dst = cv2.bitwise_and(img,img,mask = edge_outputx)






cv2.imshow('img', img)
cv2.imshow('blurred', blurred)
# cv2.imshow('edge_outputx', edge_outputx)
cv2.imshow('edge_outputy', edge_outputy)
cv2.imshow('edge_outputy_2', edge_outputy_2)

# cv2.imshow('gray',gray)
# cv2.imshow('gray_2',gray_2)

# cv2.imshow('dst',dst)

# cv2.imwrite('edge_gray_0_50.jpg',edge_outputy)
# cv2.imwrite('edge_img_40_100.jpg',edge_outputy_2)



cv2.waitKey()
cv2.destroyAllWindows()