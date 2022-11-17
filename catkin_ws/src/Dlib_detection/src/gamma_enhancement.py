import numpy as np
import cv2

def gamma_correction(f, gamma = 1):

    # check overposed or underposed
    if np.average(f)>180: # overposed
        gamma = 0.8
    elif np.average(f)<70: # underposed
        gamma = 1.5
    
    g = f.copy()
    nr,nc = f.shape[:2]
    c = 255.0 / (255.0 ** gamma)
    table = np.zeros(256)
    for i in range(256):
        table[i] = round(i ** gamma * c, 0)
    if f.ndim != 3: # RGB
        for x in range(nr):
            for y in range(nc):
                g[x, y] = table[x, y]
    else:
        for x in range(nr):
            for y in range(nc):
                for k in range(3):
                    g[x, y, k] = table[f[x, y, k]]
    return g

if __name__ == "__main__":

    gamma = 1.5
    input_img = 'img/normal_face/img00008.jpg'

    img1 = cv2.imread(input_img)
    cv2.imshow("before",img1)

    img2 = gamma_correction(img1,gamma)
    cv2.imshow("After", img2)
    cv2.imwrite("gamma_img_10.jpg",img1)
    cv2.imwrite('gamma_img_15.jpg',img2)

    print(np.average(img2))
    cv2.waitKey()
    cv2.destroyAllWindows()
