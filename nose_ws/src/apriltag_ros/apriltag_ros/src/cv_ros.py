#!/usr/bin/env python

import sys
import rospy
from sensor_msgs.msg import Image
import cv2
import numpy as np
from cv_bridge import CvBridge , CvBridgeError

def webcam_pub():
    pub = rospy.Publisher('/camera_rect/image_rect' , Image , queue_size=1)
    rospy.init_node('webcam_pub', anonymous=True)
    rate = rospy.Rate(60)

    cam = cv2.VideoCapture(4)

    if not cam.isOpened():
        sys.stdout.write("Webcam is not available!!")
        return -1

    while not rospy.is_shutdown():
        ret, frame = cam.read()
        bridge = CvBridge()
        msg = bridge.cv2_to_imgmsg(frame)

        if ret:
            rospy.loginfo('Capturing images' )

        pub.publish(msg)
        rate.sleep()

if __name__ == '__main__':
    try:
        webcam_pub()
    except rospy.ROSInitException:
        pass