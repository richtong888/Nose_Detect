#!/usr/bin/env python3

from pickle import TRUE
import cv2
import time
import dlib
import numpy as np

# from Dlib_detection import nose_xyz_data
light_threshold = 30

def find_nose(img,x1,y1,x2,y2):
    
    # data cropping
    open_contour = True
    crop_img = img[y1+x1-x2:y1-x1+x2, 2*x1-x2:2*x2-x1]

    gray = cv2.cvtColor(crop_img ,cv2.COLOR_BGR2GRAY) 
    ret,binary = cv2.threshold(gray , light_threshold ,255 ,cv2.THRESH_BINARY_INV)
    contour , hierarcy = cv2.findContours(binary, cv2.RETR_TREE , cv2.CHAIN_APPROX_SIMPLE)
    cx = { }
    cy = { }
    if (open_contour):
        for i in range(len(contour)):
            cnt = contour[i]
            m = cv2.moments(cnt)
            cv2.drawContours(crop_img , contour , -1 , (0,0,200),5)
            
            try:
                cx[i] = int(m['m10'] / m['m00'])
                cy[i] = int(m['m01'] / m['m00'])

                cv2.circle(crop_img, (cx[i], cy[i]), 2, (255, 0, 0), -1)
            except:
                print("Binary image is blur")




    # cv2.imshow("img" , img)
    # cv2.imshow("binary" , binary)
    cv2.imshow("crop img" , crop_img) 
    print('len counter is ',len(contour))
    # print(m)
    # print(len(cx))

    return img
    # print('Center of two nostrils are(', cx[0]+x, ' , ', cy[0]+y,'),(' , cx[1]+x, ' , ' , cy[1]+y, ')')
    # cv2.waitKey(0)


def load_n2e_para():

    # n2e_parameter loading in
    save_path = '../weight/predicted_n2e_para_0925.txt'

    with open(save_path, 'r') as f:
        data = f.read()
        print(data)
    #     print('------------------')

        newtext = data.split("\n")
        print(newtext)
        
        avgPA = float(newtext[1])
        avgPB = float(newtext[3])
        avganglePA = float(newtext[5])

        f.close()
    return avgPA, avgPB, avganglePA


def eulard(A,B):
    return np.sqrt(sum(np.power((A-B),2)))


# def drawfaceline(nose,ear,avgPA,avgPB):
# def drawfaceline(avgPA,avgPB,avganglePA,n2e_n,n2e_e):
    
#     nose = n2e_n
#     ear = n2e_e

#     path = '../face_side_val/face_side.jpg'    
#     img = cv2.imread(path)
# #     img = cv2.resize(img, (640,480), interpolation=cv2.INTER_AREA)
#     img = cv2.resize(img, (400,400), interpolation=cv2.INTER_AREA)

#     cv2.line(img, tuple(nose), tuple(ear), (0, 0, 255), 3)
    
#     X = eulard(nose,ear)
#     near = (ear-nose)*avgPA
    
#     if near[0] <= 0:
#         avganglePA = -avganglePA
#     p = (near[0]*np.cos(avganglePA) - near[1]*np.sin(avganglePA) , near[0]*np.sin(avganglePA) + near[1]*np.cos(avganglePA))
#     p = p + nose
#     p = p.astype(int)
#     print(p) # the position is global position
#     cv2.line(img, tuple(nose), tuple(p), (0, 255, 0), 2)    
    
#     cv2.imshow('windows',img)
    
#     cv2.waitKey(0)
#     cv2.destroyAllWindows()




def video_init(is_2_write=False,save_path=None):
    writer = None
    cap = cv2.VideoCapture(4)
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
    show_nose_segment = False
    
    
    #----video streaming init
    cap, height, width, writer = video_init(is_2_write=False)

    #----n2e parameter load in
    avgPA, avgPB, avganglePA = load_n2e_para()

    #----Dlib init
    # detector = dlib.get_frontal_face_detector()
    detector_path = "../weight/predictor_face_side_816_0515.svm"
    detector = dlib.simple_object_detector(detector_path)
    detector_cnn = dlib.cnn_face_detection_model_v1('mmod_human_face_detector.dat')
    predictor = dlib.shape_predictor("../weight/predictor_face_side_816_0515.dat") # be careful of the pwd of dat files
    # predictor = dlib.shape_predictor("weight/shape_predictor_68_face_landmarks.dat")

    color = (0,255,0)

    #----video nonstop capture
    while (cap.isOpened()):

        #----get image
        ret, img = cap.read()

        if ret is True:
            #----img preprocess
            # img_rgb = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)

            #----face detection
            if use_CUDA is True:
                faces = detector_cnn(img, 0)#if the digit is 1, the img will be resized double. The detection speed will decline
            else:
                faces = detector(img, 0)

            #----face analysis
            if (len(faces) > 0):
                for k, d in enumerate(faces):

                    #--binary face (only show)

                    gray2 = cv2.cvtColor(img ,cv2.COLOR_BGR2GRAY)
                    ret2,binary2 = cv2.threshold(gray2 , light_threshold ,255 ,cv2.THRESH_BINARY_INV)  

                    cv2.imshow('gray2',binary2)  


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
                        for i in range(6):
                            #cv2.circle(影像, 圓心座標, 半徑, 顏色, 線條寬度)
                            cv2.circle(img, (shape.part(i).x, shape.part(i).y), 2, (0, 255, 0), -1, 8)
                            #cv2.putText(影像, 文字, 座標, 字型, 大小, 顏色, 線條寬度, 線條種類)
                            cv2.putText(img, str(i), (shape.part(i).x, shape.part(i).y), cv2.FONT_HERSHEY_SIMPLEX, 0.5,
                                        (255, 2555, 255))

                        n2e_n = shape.part(3) 
                        n2e_n = np.array([shape.part(3).x,shape.part(3).y]) 
                        n2e_e = np.array([shape.part(5).x,shape.part(5).y]) 

                        # ---- drawfaceline(avgPA,avgPB,avganglePA,n2e_n,n2e_e)
                        cv2.line(img, tuple(n2e_n), tuple(n2e_e), (0, 0, 255), 3)
                        X = eulard(n2e_n,n2e_e)
                        near = (n2e_e-n2e_n)*avgPA
                        
                        if near[0] <= 0:
                            avganglePA = -avganglePA
                        p = (near[0]*np.cos(avganglePA) - near[1]*np.sin(avganglePA) , near[0]*np.sin(avganglePA) + near[1]*np.cos(avganglePA))
                        p = p + n2e_n
                        p = p.astype(int)
                        print(p) # the position is global position
                        if(p[1] > n2e_e[1]):
                            cv2.line(img, tuple(n2e_n), tuple(p), (0, 255, 0), 2)   

                    # # show binary segement nose
                    #         if show_nose_segment is True:
                    #             img = find_nose(img,shape.part(4).x,shape.part(4).y,shape.part(5).x,shape.part(5).y)



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

            #----'q' key pressed?
            key = cv2.waitKey(1) & 0xFF
            if key == ord('q'):
                break
            elif key == ord('f'):
                show_facial_points = True
            elif key == ord('g'):
                show_facial_points = False
            
            # elif key == 13: #Press Enter to save image
            # output_image = 'nose_xyz_out.png'
            # cv2.imwrite(output_image,images)
            # img = cv2.imread(output_image)
            # Dlib_detection(img)

        else:
            print("get image failed")
            break

    #----release



    cap.release()
    cv2.destroyAllWindows()


if __name__ == "__main__":
    
    Dlib_face_detection(use_CUDA=False)


