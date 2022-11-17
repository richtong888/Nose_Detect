import numpy as np
import cv2
import scipy.special as special
import matplotlib.pyplot as plt


def histogram(f):
    if f.ndim != 3:
        hist = cv2.calcHist([f], [0], None, [256], [0,256])
        plt.plot(hist)
    else:
        color = ('b', 'g', 'r', 'b')
        for i, col in enumerate(color):
            hist = cv2.calcHist([f], [i], None, [256], [0,256])
            plt.plot(hist, color = col)
            plt.xlim([0,256])
            plt.xlabel("Intensity")
            plt.ylabel("#Intensities")
            plt.show()



if __name__ == "__main__":

    img1 = cv2.imread("D:\Desktop\IThome\lena_gray.jpg", -1)

    # For Color
    R, G, B = cv2.split(img1)

    output1_R = cv2.equalizeHist(R)
    output1_G = cv2.equalizeHist(G)
    output1_B = cv2.equalizeHist(B)

    img2 = cv2.merge((output1_R, output1_G, output1_B))
    # For Gray
    img2 = cv2.equalizeHist(img1)
    cv2.imshow("Orignial", img1)
    cv2.imshow("After", img2)
    cv2.waitKey()
