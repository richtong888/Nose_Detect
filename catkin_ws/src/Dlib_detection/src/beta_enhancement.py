import numpy as np
import cv2
import scipy.special as special
import matplotlib.pyplot as plt


    
def beta_correction(f, a , b ):
    g = f.copy()
    nr, nc = f.shape[:2]
    x = np.linspace(0, 1, 256)
    table = np.round(special.betainc(a, b, x) * 255, 0)
    if f.ndim != 3:
        for x in range(nr):
            for y in range(nc):
                g[x, y] = table[f[x, y]]

    else:
        for x in range(nr):
            for y in range(nc):
                for k in range(3):
                    g[x, y, k] = table[f[x,y,k]]
    
    return g


if __name__ == "__main__":

    a = 2
    b = 2

    img1 = cv2.imread('img/normal_face/img00008.jpg')

    cv2.imshow("before",img1)
    img2 = beta_correction(img1, a, b )
    cv2.imshow("After", img2)
    cv2.imwrite('beta_img_10.jpg',img1)
    cv2.imwrite('beta_img_20.jpg',img2)
    cv2.waitKey()