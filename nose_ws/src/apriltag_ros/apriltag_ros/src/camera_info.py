#!/usr/bin/env python

from numpy import rate
import rospy
import cv2
from sensor_msgs.msg import CameraInfo

rospy.init_node('camers_info',anonymous=True)

pub = rospy.Publisher('/camera_rect/camera_info', CameraInfo,queue_size=10)
rate = rospy.Rate(60)
while not rospy.is_shutdown():
    q = CameraInfo()
    q.header.frame_id = 'usb_cam'
    q.height = 480
    q.width = 640
    q.D = [0.047292948055029566, -0.09857812414763728, 0.0010105674819336197, -0.012641655538665962, 0.0]
    q.K = [603.0143262529772, 0.0, 313.58041794133624, 0.0, 602.2531795307505, 241.87424958019477, 0.0, 0.0, 1.0]
    q.R = [1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0]
    q.P = [604.8887329101562, 0.0, 306.38562892902337, 0.0, 0.0, 610.3604125976562, 241.8316357272306, 0.0, 0.0, 0.0, 1.0, 0.0]
    q.binning_x = 0
    q.binning_y = 0
    q.roi.x_offset = 0
    q.roi.y_offset = 0
    q.roi.height = 0
    q.roi.width = 0
    q.roi.do_rectify = False
    pub.publish(q)
    rate.sleep()