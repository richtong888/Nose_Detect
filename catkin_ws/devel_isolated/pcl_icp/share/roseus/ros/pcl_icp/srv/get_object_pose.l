;; Auto-generated. Do not edit!


(when (boundp 'pcl_icp::get_object_pose)
  (if (not (find-package "PCL_ICP"))
    (make-package "PCL_ICP"))
  (shadow 'get_object_pose (find-package "PCL_ICP")))
(unless (find-package "PCL_ICP::GET_OBJECT_POSE")
  (make-package "PCL_ICP::GET_OBJECT_POSE"))
(unless (find-package "PCL_ICP::GET_OBJECT_POSEREQUEST")
  (make-package "PCL_ICP::GET_OBJECT_POSEREQUEST"))
(unless (find-package "PCL_ICP::GET_OBJECT_POSERESPONSE")
  (make-package "PCL_ICP::GET_OBJECT_POSERESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass pcl_icp::get_object_poseRequest
  :super ros::object
  :slots ())

(defmethod pcl_icp::get_object_poseRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass pcl_icp::get_object_poseResponse
  :super ros::object
  :slots (_object_pose ))

(defmethod pcl_icp::get_object_poseResponse
  (:init
   (&key
    ((:object_pose __object_pose) (instance geometry_msgs::PoseStamped :init))
    )
   (send-super :init)
   (setq _object_pose __object_pose)
   self)
  (:object_pose
   (&rest __object_pose)
   (if (keywordp (car __object_pose))
       (send* _object_pose __object_pose)
     (progn
       (if __object_pose (setq _object_pose (car __object_pose)))
       _object_pose)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/PoseStamped _object_pose
    (send _object_pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/PoseStamped _object_pose
       (send _object_pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/PoseStamped _object_pose
     (send _object_pose :deserialize buf ptr-) (incf ptr- (send _object_pose :serialization-length))
   ;;
   self)
  )

(defclass pcl_icp::get_object_pose
  :super ros::object
  :slots ())

(setf (get pcl_icp::get_object_pose :md5sum-) "ce62f562fe862ddbebe5377023767cb7")
(setf (get pcl_icp::get_object_pose :datatype-) "pcl_icp/get_object_pose")
(setf (get pcl_icp::get_object_pose :request) pcl_icp::get_object_poseRequest)
(setf (get pcl_icp::get_object_pose :response) pcl_icp::get_object_poseResponse)

(defmethod pcl_icp::get_object_poseRequest
  (:response () (instance pcl_icp::get_object_poseResponse :init)))

(setf (get pcl_icp::get_object_poseRequest :md5sum-) "ce62f562fe862ddbebe5377023767cb7")
(setf (get pcl_icp::get_object_poseRequest :datatype-) "pcl_icp/get_object_poseRequest")
(setf (get pcl_icp::get_object_poseRequest :definition-)
      "---
geometry_msgs/PoseStamped object_pose


================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
")

(setf (get pcl_icp::get_object_poseResponse :md5sum-) "ce62f562fe862ddbebe5377023767cb7")
(setf (get pcl_icp::get_object_poseResponse :datatype-) "pcl_icp/get_object_poseResponse")
(setf (get pcl_icp::get_object_poseResponse :definition-)
      "---
geometry_msgs/PoseStamped object_pose


================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
")



(provide :pcl_icp/get_object_pose "ce62f562fe862ddbebe5377023767cb7")


