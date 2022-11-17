# -*- coding: UTF-8 -*-
#!/usr/bin/env python2



from __future__ import print_function
from pickle import TRUE
from cv_bridge import CvBridge, CvBridgeError
from sensor_msgs.msg import Image
import sys
import roslib
import cv2
import time
import dlib

import rospy
from std_msgs.msg import String
from Dlib_detection.msg import nose_xyz_data




# def find_nose(img, x1, y1, x2, y2):

#     # data cropping
#     open_contour = True
#     crop_img = img[y1+x1-x2:y1-x1+x2, 2*x1-x2:2*x2-x1]  # y dy + x dx

#     gray = cv2.cvtColor(crop_img, cv2.COLOR_BGR2GRAY)
#     ret, binary = cv2.threshold(gray, 30, 255, cv2.THRESH_BINARY_INV)
#     contour, hierarcy = cv2.findContours(
#         binary, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
#     cx = {}
#     cy = {}

#     if (open_contour):
#         for i in range(len(contour)):
#             cnt = contour[i]
#             m = cv2.moments(cnt)
#             cv2.drawContours(crop_img, contour, -1, (0, 0, 200), 5)

#             try:
#                 cx[i] = int(m['m10'] / m['m00'])
#                 cy[i] = int(m['m01'] / m['m00'])

#                 cv2.circle(crop_img, (cx[i], cy[i]), 2, (255, 0, 0), -1)

#             except:
#                 print("Binary image is blur")

#     left_top_x = 2*x1-x2
#     left_top_y = y1+x1-x2
#     # cv2.imshow("img" , img)
#     # cv2.imshow("binary" , binary)
#     cv2.imshow("crop img", crop_img)
#     print('len counter is ', len(contour))
#     # print(m)
#     # print(len(cx))

#     return img, cx, cy, left_top_x, left_top_y
#     # print('Center of two nostrils are(', cx[0]+x, ' , ', cy[0]+y,'),(' , cx[1]+x, ' , ' , cy[1]+y, ')')
#     # cv2.waitKey(0)


# def video_init(is_2_write=False, save_path=None):
#     writer = None
#     cap = cv2.VideoCapture(4)
#     height = cap.get(cv2.CAP_PROP_FRAME_HEIGHT)  # default 480
#     width = cap.get(cv2.CAP_PROP_FRAME_WIDTH)  # default 640

#     if is_2_write is True:
#         fourcc = cv2.VideoWriter_fourcc(*'divx')
#         if save_path is None:
#             save_path = 'demo.avi'
#         writer = cv2.VideoWriter(
#             save_path, fourcc, 30, (int(width), int(height)))

#     return cap, height, width, writer


# def Dlib_face_detection(use_CUDA=False):
#     # ----var

#     # Initial ros node

#     pub = rospy.Publisher('nose_detect/nose_pose',
#                           nose_xyz_data, queue_size=10)
#     rospy.init_node('nose_xyz_talker', anonymous=True)
#     rate = rospy.Rate(30)  # 10hz

#     while not rospy.is_shutdown():

#         frame_count = 0
#         FPS = "Initialing"
#         no_face_str = "No features"
#         show_facial_points = True
#         show_nose_segment = True

#         cx = {}
#         cy = {}
#         left_top_x = 0
#         left_top_y = 0

#         # ----video streaming init
#         cap, height, width, writer = video_init(is_2_write=False)

#         # ----Dlib init
#         detector = dlib.get_frontal_face_detector()
#         detector_cnn = dlib.cnn_face_detection_model_v1(
#             'mmod_human_face_detector.dat')
#         # be careful of the pwd of dat files
#         predictor = dlib.shape_predictor('predictor_nose_2.dat')
#         # predictor = dlib.shape_predictor("weight/shape_predictor_68_face_landmarks.dat")

#         color = (0, 255, 0)

#         # ----video nonstop capture
#         while (cap.isOpened()):

#             # ----get imagedib python 版本

#                         gray2 = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
#                         ret2, binary2 = cv2.threshold(
#                             gray2, 30, 255, cv2.THRESH_BINARY_INV)

#                         cv2.imshow('gray2', binary2)

#                         if use_CUDA is True:
#                             d = d.rect
#                         # ----draw rectangles on faces
#                         cv2.rectangle(img, (d.left(), d.top()),
#                                       (d.right(), d.bottom()), color, 2)
#                         if use_CUDA is False:
#                             cv2.rectangle(img, (d.left(), d.top()),
#                                           (d.right(), d.bottom()), color, 2)
#                             # cv2.putText(img, str('%6s %.2f %4s %1d'%('scores:',scores[k],'idx:',idx[k])), (d.left(), d.top()), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 255), 2)

#                         # ----draw 68 points of face characteristics
#                         if show_facial_points is True:
#                             shape = predictor(img, d)
#                             for i in range(7):from __future__ import print_function

#                 # Show landmark
#                 # for i in range(7):
#                 #     shape = predictor(img, d)
#                 #     cv2.circle(img, (shape.part(i).x, shape.part(i).y), 2, (0, 255, 0), -1, 8)
#                 #     cv2.putText(img, str(i), (shape.part(i).x, shape.part(i).y), cv2.FONT_HERSHEY_SIMPLEX, 0.5,(255, 2555, 255))

#                 # ----image display
#                 cv2.imshow("face_detection", img)

#                 # rostopic publish
#                 nose_xyz = nose_xyz_data()
#                 try:
#                     nose_xyz.lnx = cx[0]+left_top_x
#                     nose_xyz.lny = cy[0]+left_top_y
#                     # nose_xyz.rnx = cx[1]
#                     # nose_xyz.rny = cy[1]
#                 except:
#                     nose_xyz.lnx = 10
#                     nose_xyz.lny = 20
#                     # nose_xyz.rnx = 30
#                     # nose_xyz.rny =  40
#                 pub.publish(nose_xyz)
#                 rate.sleep()

#                 # hello_str = "hello world %s" % rospy.get_time()
#                 # rospy.loginfo(hello_str)
#                 # pub.publish(hello_str)
#                 # rate.sleep()

#                 # ----'q' key pressed?
#                 key = cv2.waitKey(1) & 0xFF
#                 if key == ord('q'):
#                     break
#                 elif key == ord('f'):
#                     show_facial_points = True
#                 elif key == ord('g'):
#                     show_facial_points = False

#                 # elif key == 13: #Press Enter to save image
#                 # output_image = 'nose_xyz_out.png'
#                 # cv2.imwrite(output_image,images)
#                 # img = cv2.imread(output_image)
#                 # Dlib_detection(img)

#             else:
#                 print("get image failed")
#                 break

#         # ----release

#         cap.release()
#         cv2.destroyAllWindows()

#         break

# def nose_xyz_talker():
#     # Initial ros node

#     pub = rospy.Publisher('nose_detect/nose_pose', String, queue_size=10)
#     rospy.init_node('nose_xyz_talker', anonymous=True)
#     rate = rospy.Rate(30) # 10hz

#     while not rospy.is_shutdown()  :
#         Dlib_face_detection(use_CUDA=False)
#         break
#         hello_str = "hello world %s" % rospy.get_time()
#         rospy.loginfo(hello_str)
#         pub.publish(hello_str)
#         rate.sleep()


# if __name__ == "__main__":
#     try:
#         # nose_xyz_talker()




class image_converter:

    def __init__(self):
        self.image_pub = rospy.Publisher("/nose/color/image_raw", Image)
        self.image_predicted_pub = rospy.Publisher("/nose/color/image_predicted", Image)
        # self.image_gray_pub = rospy.Publisher("/nose/color/image_gray", Image)
        # self.image_crop_pub = rospy.Publisher("/nose/color/image_crop", Image)
        self.pub = rospy.Publisher('nose_detect/nose_pose', nose_xyz_data, queue_size=10)

       
        self.bridge = CvBridge()
        self.image_sub = rospy.Subscriber( "/camera/color/image_raw", Image, self.callback)
        # self.rate = rospy.Rate(30)  # 10hz

    def find_nose(self,img, x1, y1, x2, y2):

         # data cropping
        open_contour = True
        crop_img = img[y1+x1-x2:y1-x1+x2, 2*x1-x2:2*x2-x1]  # y dy + x dx

        gray = cv2.cvtColor(crop_img, cv2.COLOR_BGR2GRAY)
        ret, binary = cv2.threshold(gray, 50, 255, cv2.THRESH_BINARY_INV)
        contour, hierarcy = cv2.findContours(
            binary, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
        cx = {}
        cy = {}

        if (open_contour):
            for i in range(len(contour)):
                cnt = contour[i]
                m = cv2.moments(cnt)
                cv2.drawContours(crop_img, contour, -1, (0, 0, 200), 5)

                try:
                    cx[i] = int(m['m10'] / m['m00'])
                    cy[i] = int(m['m01'] / m['m00'])

                    cv2.circle(crop_img, (cx[i], cy[i]), 2, (255, 0, 0), -1)

                except:
                    print("Binary image is blur")

        left_top_x = 2*x1-x2
        left_top_y = y1+x1-x2
        # cv2.imshow("img" , img)
        # cv2.imshow("binary" , binary)
        cv2.imshow("crop img", crop_img)
      
        print('len counter is ', len(contour))
        # print(m)
        # print(len(cx))

        return img, cx, cy, left_top_x, left_top_y
        # print('Center of two nostrils are(', cx[0]+x, ' , ', cy[0]+y,'),(' , cx[1]+x, ' , ' , cy[1]+y, ')')
        # cv2.waitKey(0)



    def callback(self, data):
        try:
            img = self.bridge.imgmsg_to_cv2(data, "bgr8")
        except CvBridgeError as e:
            print(e)

        # Parameters
        frame_count = 0
        FPS = "Initialing"
        no_face_str = "No features"
        show_facial_points = True
        show_nose_segment = True

        cx = {}
        cy = {}
        left_top_x = 0
        left_top_y = 0

        color = (0, 255, 0)
        use_CUDA = False

        # Model load in 
        detector = dlib.get_frontal_face_detector()
        detector_cnn = dlib.cnn_face_detection_model_v1('mmod_human_face_detector.dat')
        # be careful of the pwd of dat files
        predictor = dlib.shape_predictor('predictor_nose_2.dat')
        # predictor = dlib.shape_predictor("weight/shape_predictor_68_face_landmarks.dat")


        if use_CUDA is True:
            # if the digit is 1, the img will be resized double. The detection speed will decline
            faces = detector_cnn(img, 0)
        else:
            faces, scores, idx = detector.run(img, 0)

        # ----face analysis
        if (len(faces) > 0):
            for k, d in enumerate(faces):

                # --binary face (only show)

                gray2 = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
                ret2, binary2 = cv2.threshold(
                    gray2, 50, 255, cv2.THRESH_BINARY_INV)

                cv2.imshow('gray2', binary2)

                if use_CUDA is True:
                    d = d.rect
                # ----draw rectangles on faces
                cv2.rectangle(img, (d.left(), d.top()),
                                (d.right(), d.bottom()), color, 2)
                if use_CUDA is False:
                    cv2.rectangle(
                        img, (d.left(), d.top()), (d.right(), d.bottom()), color, 2)
                    # cv2.putText(img, str('%6s %.2f %4s %1d'%('scores:',scores[k],'idx:',idx[k])), (d.left(), d.top()), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 255), 2)

                # ----draw 68 points of face characteristics
                if show_facial_points is True:
                    shape = predictor(img, d)
                    for i in range(7):
                        # cv2.circle(影像, 圓心座標, 半徑, 顏色, 線條寬度)
                        cv2.circle(img, (shape.part(i).x, shape.part(
                            i).y), 2, (0, 255, 0), -1, 8)
                        # cv2.putText(影像, 文字, 座標, 字型, 大小, 顏色, 線條寬度, 線條種類)
                        cv2.putText(img, str(i), (shape.part(i).x, shape.part(i).y), cv2.FONT_HERSHEY_SIMPLEX, 0.5,
                                    (255, 2555, 255))

                # show binary segement nose
                        if show_nose_segment is True:

                            img, cx, cy, left_top_x, left_top_y = self.find_nose(img, shape.part(
                                4).x, shape.part(4).y, shape.part(5).x, shape.part(5).y)

        # ----no faces detected
        else:
            cv2.putText(img, no_face_str, (10, 100),
                        cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 200), 1)

        # ----FPS count and claculation
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

        # ----image display
        cv2.imshow("face_detection", img)

        # rostopic publish
        nose_xyz = nose_xyz_data()
        try:
            nose_xyz.lnx = cx[0]+left_top_x
            nose_xyz.lny = cy[0]+left_top_y
            # nose_xyz.rnx = cx[1]
            # nose_xyz.rny = cy[1]
        except:
            nose_xyz.lnx = 0
            nose_xyz.lny = 0
            # nose_xyz.rnx = 30
            # nose_xyz.rny =  40



        # self.pub.publish(nose_xyz)
        # self.rate.sleep()

        # hello_str = "hello world %s" % rospy.get_time()
        # rospy.loginfo(hello_str)
        # pub.publish(hello_str)
        # rate.sleep()

        # ----'q' key pressed?
        # key = cv2.waitKey(1) & 0xFF
        # if key == ord('q'):
        #     cv2.destroyAllWindows()
        # elif key == ord('f'):
        #     show_facial_points = True
        # elif key == ord('g'):
        #     show_facial_points = False



        # (rows,cols,channels) = cv_image.shape
        # if cols > 60 and rows > 60 :
        #   cv2.circle(cv_image, (50,50), 10, 255)

        # cv2.imshow("Image window", cv_image)
        cv2.waitKey(1)

        try:
            self.pub.publish(nose_xyz)
            self.image_pub.publish(self.bridge.cv2_to_imgmsg(image, "bgr8"))
            # self.image_gray_pub.publish(self.bridge.cv2_to_imgmsg(binary2, "bgr8"))
            self.image_predicted_pub.publish(self.bridge.cv2_to_imgmsg(img, "bgr8"))

        except CvBridgeError as e:
            print(e)


def main(args):
    rospy.init_node('nose_xyz_talker', anonymous=True)    
    ic = image_converter()

    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")
    cv2.destroyAllWindows()


if __name__ == '__main__':
    main(sys.argv)
