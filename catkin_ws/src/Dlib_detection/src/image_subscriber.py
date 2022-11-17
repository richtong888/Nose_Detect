#!/usr/bin/env python3

# import rospy
# from sensor_msgs.msg import Image
# from cv_bridge import CvBridge
# import cv2
# import os
# import numpy as np

# class Nodo(object):
#     def __init__(self):
#         # Params
#         self.image = None
#         self.br = CvBridge()
#         # Node cycle rate (in Hz).
#         self.loop_rate = rospy.Rate(30)

#         # Publishers
#         self.pub = rospy.Publisher('imagetimer', Image, queue_size=10)

#         # Subscribers
#         rospy.Subscriber("/camera/color/image_raw",Image,self.callback)

#     def callback(self, msg):
#         rospy.loginfo('Image received...')
#         self.image = self.br.imgmsg_to_cv2(msg)


#     def start(self):
#         rospy.loginfo("Timing images")
#         #rospy.spin()
#         while not rospy.is_shutdown():
#             rospy.loginfo('publishing image')
#             #br = CvBridge()
#             if self.image is not None:
#                 self.pub.publish(self.br.cv2_to_imgmsg(self.image))
#             self.loop_rate.sleep()

# if __name__ == '__main__':
#     rospy.init_node("imagetimer111", anonymous=True)
#     my_node = Nodo()
#     my_node.start()

#!/usr/bin/env python
from __future__ import print_function

import roslib
# roslib.load_manifest('my_package')
import sys
import rospy
import cv2
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

class image_converter:

  def __init__(self):
    self.image_pub = rospy.Publisher("/nose/color/image_raw",Image)

    self.bridge = CvBridge()
    self.image_sub = rospy.Subscriber("/camera/color/image_raw",Image,self.callback)

  def callback(self,data):
    try:
      cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
    except CvBridgeError as e:
      print(e)

    (rows,cols,channels) = cv_image.shape
    if cols > 60 and rows > 60 :
      cv2.circle(cv_image, (50,50), 10, 255)

    cv2.imshow("Image window", cv_image)
    cv2.waitKey(3)

    try:
      self.image_pub.publish(self.bridge.cv2_to_imgmsg(cv_image, "bgr8"))
    except CvBridgeError as e:
      print(e)

def main(args):
  ic = image_converter()
  rospy.init_node('image_converter', anonymous=True)
  try:
    rospy.spin()
  except KeyboardInterrupt:
    print("Shutting down")
  cv2.destroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)
