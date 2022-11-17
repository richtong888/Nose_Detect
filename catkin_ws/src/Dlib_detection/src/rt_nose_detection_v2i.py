#!/usr/bin/env python3

from pickle import TRUE
import cv2
import time
import dlib
import numpy as np

import pandas as pd
import scipy.special as special
from sklearn import preprocessing
import matplotlib.pyplot as plt
from sklearn.datasets import make_moons
import matplotlib.pyplot as plt

def gamma_correction(f, gamma = 1):

    # check overposed or underposed
    if np.average(f)>180: # overposed
        gamma = 0.8
    elif np.average(f)<70: # underposed
        gamma = 1.5
    else:
        print("Image gamma value = 1\n")
    
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

# from Dlib_detection import nose_xyz_data
def normalize_per(image):
    pr = np.percentile(image, (10 ,25, 50, 100), interpolation='midpoint')
    print(pr,len(pr))
    print('thred is ',pr[0])

    return int(pr[0])

def normalize_std(image):

    image_size = image.shape[0] * image.shape[1]
    print('image_size',image_size)
    print('std for img ',np.std(image))
    print('avg for img',np.average(image))
    thrd = np.average(image) - 1.644* np.std(image) #roughly 90 %
    print('thred is ',thrd)
    return int(thrd)

def find_nose(image,x1,y1,x2,y2,name):
     
    img = cv2.GaussianBlur(image, (5,5),0)
    
    open_contour = True
    crop_img = img[y1+x1-x2:y1-x1+x2, 2*x1-x2:2*x2-x1]  # y dy + x dx



    gray = cv2.cvtColor(crop_img, cv2.COLOR_BGR2GRAY)
    print('img avg lightness',gray)

    thred = normalize_std(gray)
    # thred = normalize_per(gray)

    ret, binary = cv2.threshold(gray, thred, 255, cv2.THRESH_BINARY_INV)
    contour, hierarcy = cv2.findContours(binary, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
    cx = {}
    cy = {}

    if (open_contour):
        for i in range(len(contour)):
            cnt = contour[i]
            m = cv2.moments(cnt)
            cv2.drawContours(crop_img, contour, -1, (0, 0, 200), 3)

            try:
                cx[i] = int(m['m10'] / m['m00'])
                cy[i] = int(m['m01'] / m['m00'])

                cv2.circle(crop_img, (cx[i], cy[i]), 3, (255, 0, 0), -1)

            except:
                print("Binary image is blur")

    cv2.imshow("crop img" , crop_img) 
    out_img_dir = 'crop_' + name
    out_img_dir_b = 'bin_' + name
    cv2.imwrite(out_img_dir,crop_img)
    cv2.imwrite(out_img_dir_b,binary)
    # cv2.imshow("edge_outputy",edge_outputy)
    print('len counter is ',len(contour))
    # cv2.imwrite('gray_zscore.jpg',gray)
    print('cx',cx,'cy',cy)

    return image

# def find_nose_HSV(img,x1,y1,x2,y2):

#     hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
#     # lower_green = np.array([35, 43, 46])
#     # upper_green = np.array([77, 255, 255])
#     lower_green = np.array([0, 0, 0]) #black
#     upper_green = np.array([180,255, 46]) #black
#     mask = cv2.inRange(hsv, lower_green, upper_green)
#     res = cv2.bitwise_and(img, img, mask=mask)
#     cv2.imshow('Input', img)
#     cv2.imshow('Result', res)



def video_init(is_2_write=False,save_path=None):
    writer = None
    cap = cv2.VideoCapture(0)
    height = cap.get(cv2.CAP_PROP_FRAME_HEIGHT)#default 480
    width = cap.get(cv2.CAP_PROP_FRAME_WIDTH)#default 640

    if is_2_write is True:
        fourcc = cv2.VideoWriter_fourcc(*'divx')
        if save_path is None:
            save_path = 'demo.avi'
        writer = cv2.VideoWriter(save_path, fourcc, 30, (int(width), int(height)))

    return cap,height,width,writer

def Dlib_face_detection(use_CUDA=False):
    #----var
    # Initial ros node


    frame_count = 0
    FPS = "Initialing"
    no_face_str = "No features"
    show_facial_points = True
    show_nose_segment = True
    close_point = False
    ret = True
    
    
    
    #----video streaming init
    # cap, height, width, writer = video_init(is_2_write=False)

    #----Dlib init
    detector = dlib.get_frontal_face_detector()
    detector_cnn = dlib.cnn_face_detection_model_v1('mmod_human_face_detector.dat')
    predictor = dlib.shape_predictor('predictor_nose_2.dat') # be careful of the pwd of dat files
    # predictor = dlib.shape_predictor("weight/shape_predictor_68_face_landmarks.dat")

    color = (0,255,0)

    #----video nonstop capture
    for i in range(0,20):

        #----get image
        # ret, img = cap.read()
        # img_dir = 'img/img00008.jpg'
        s = '%05d' % i
        img_name = 'img'+str(s)+'.jpg'
        # img_name = 'img00000.jpg'
        img_dir = 'img/overposed_face/' + img_name

        img = cv2.imread(img_dir)

        if ret is True:
            #----img preprocess
            # img_rgb = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)

            #----face detection
            if use_CUDA is True:
                faces = detector_cnn(img, 0)#if the digit is 1, the img will be resized double. The detection speed will decline
            else:
                faces, scores, idx = detector.run(img, 0)

            #----face analysis
            if (len(faces) > 0):
                for k, d in enumerate(faces):

                    # cv2.imwrite('nose_origin_2.jpg',img)
                    #--Gaussion blur & canny

                    # img = cv2.GaussianBlur(img, (5,5),0)

                    # gamma_correction
                    img = gamma_correction(img)

                    #--binary face (only show)

                    gray2 = cv2.cvtColor(img ,cv2.COLOR_BGR2GRAY)
                    # print(gray2.shape) # ndarray (720,1280)
                    ret2,binary2 = cv2.threshold(gray2 , 30 ,255 ,cv2.THRESH_BINARY_INV)  

                    cv2.imshow('gray2',gray2)  
                    out_img_dir_gray = 'gray_' + img_name
                    cv2.imwrite(out_img_dir_gray,gray2)


                    if use_CUDA is True:
                        d = d.rect
                    #----draw rectangles on faces
                    cv2.rectangle(img, (d.left(), d.top()), (d.right(), d.bottom()), color,2)
                    if use_CUDA is False:
                        cv2.rectangle(img, (d.left(), d.top()), (d.right(), d.bottom()), color,2)
                        # cv2.putText(img, str('%6s %.2f %4s %1d'%('scores:',scores[k],'idx:',idx[k])), (d.left(), d.top()), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 255), 2)


                    #----draw 68 points of face characteristics
                    if show_facial_points is True:
                        shape = predictor(img, d)
                        for i in range(7): # 7 point in labels
                            #cv2.circle(影像, 圓心座標, 半徑, 顏色, 線條寬度)
                            # if close_point is False:
                            #     cv2.circle(img, (shape.part(i).x, shape.part(i).y), 2, (0, 255, 0), -1, 8) # turn on can see 7 points
                                #cv2.putText(影像, 文字, 座標, 字型, 大小, 顏色, 線條寬度, 線條種類)
                                # cv2.putText(img, str(i), (shape.part(i).x, shape.part(i).y), cv2.FONT_HERSHEY_SIMPLEX, 0.5,
                                #             (255, 2555, 255)) #turn on to see id

                    # show binary segement nose
                            if show_nose_segment is True:
                                img = find_nose(img,  shape.part(4).x,  shape.part(4).y,  shape.part(5).x,  shape.part(5).y,img_name)
                                # find_nose_HSV(img,  shape.part(4).x,  shape.part(4).y,  shape.part(5).x,  shape.part(5).y)



            #----no faces detected
            else:
                cv2.putText(img, no_face_str, (10, 100), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 200), 1)

            #----FPS count and claculation
            if frame_count == 0:
                t_start = time.time()
            frame_count += 1
            if frame_count >= 10:
                FPS = "FPS=%1f" % (10 / (time.time() - t_start))
                frame_count = 0

            

            # cv2.putText(影像, 文字, 座標, 字型, 大小, 顏色, 線條寬度, 線條種類)
            # cv2.putText(img, FPS, (10, 50), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 0), 3)

            # Show landmark 
            # for i in range(7):
            #     shape = predictor(img, d)    
            #     cv2.circle(img, (shape.part(i).x, shape.part(i).y), 2, (0, 255, 0), -1, 8)
            #     cv2.putText(img, str(i), (shape.part(i).x, shape.part(i).y), cv2.FONT_HERSHEY_SIMPLEX, 0.5,(255, 2555, 255))

            #----image display
            cv2.imshow("face_detection", img)
            out_img_dir = 'out_' + img_name
            cv2.imwrite(out_img_dir,img)
            # cv2.imwrite('rt_nose_2.jpg',img)

            

            #----'q' key pressed?
            key = cv2.waitKey(1) & 0xFF
            if key == ord('q'):
                break
            elif key == ord('f'):
                show_facial_points = True
            elif key == ord('g'):
                show_facial_points = False
            elif key == ord('h'):
                close_point = True            
            elif key == ord('i'):
                close_point = False           
            # elif key == 13: #Press Enter to save image
            # output_image = 'nose_xyz_out.png'
            # cv2.imwrite(output_image,images)
            # img = cv2.imread(output_image)
            # Dlib_detection(img)

        else:
            print("get image failed")
            break

    #----release


    # cap.release()
    cv2.destroyAllWindows()


if __name__ == "__main__":

    Dlib_face_detection(use_CUDA=False)
    # normalize()


