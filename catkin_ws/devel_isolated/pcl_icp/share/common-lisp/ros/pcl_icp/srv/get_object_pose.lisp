; Auto-generated. Do not edit!


(cl:in-package pcl_icp-srv)


;//! \htmlinclude get_object_pose-request.msg.html

(cl:defclass <get_object_pose-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass get_object_pose-request (<get_object_pose-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <get_object_pose-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'get_object_pose-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pcl_icp-srv:<get_object_pose-request> is deprecated: use pcl_icp-srv:get_object_pose-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <get_object_pose-request>) ostream)
  "Serializes a message object of type '<get_object_pose-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <get_object_pose-request>) istream)
  "Deserializes a message object of type '<get_object_pose-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<get_object_pose-request>)))
  "Returns string type for a service object of type '<get_object_pose-request>"
  "pcl_icp/get_object_poseRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'get_object_pose-request)))
  "Returns string type for a service object of type 'get_object_pose-request"
  "pcl_icp/get_object_poseRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<get_object_pose-request>)))
  "Returns md5sum for a message object of type '<get_object_pose-request>"
  "ce62f562fe862ddbebe5377023767cb7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'get_object_pose-request)))
  "Returns md5sum for a message object of type 'get_object_pose-request"
  "ce62f562fe862ddbebe5377023767cb7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<get_object_pose-request>)))
  "Returns full string definition for message of type '<get_object_pose-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'get_object_pose-request)))
  "Returns full string definition for message of type 'get_object_pose-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <get_object_pose-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <get_object_pose-request>))
  "Converts a ROS message object to a list"
  (cl:list 'get_object_pose-request
))
;//! \htmlinclude get_object_pose-response.msg.html

(cl:defclass <get_object_pose-response> (roslisp-msg-protocol:ros-message)
  ((object_pose
    :reader object_pose
    :initarg :object_pose
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped)))
)

(cl:defclass get_object_pose-response (<get_object_pose-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <get_object_pose-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'get_object_pose-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pcl_icp-srv:<get_object_pose-response> is deprecated: use pcl_icp-srv:get_object_pose-response instead.")))

(cl:ensure-generic-function 'object_pose-val :lambda-list '(m))
(cl:defmethod object_pose-val ((m <get_object_pose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_icp-srv:object_pose-val is deprecated.  Use pcl_icp-srv:object_pose instead.")
  (object_pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <get_object_pose-response>) ostream)
  "Serializes a message object of type '<get_object_pose-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'object_pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <get_object_pose-response>) istream)
  "Deserializes a message object of type '<get_object_pose-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'object_pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<get_object_pose-response>)))
  "Returns string type for a service object of type '<get_object_pose-response>"
  "pcl_icp/get_object_poseResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'get_object_pose-response)))
  "Returns string type for a service object of type 'get_object_pose-response"
  "pcl_icp/get_object_poseResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<get_object_pose-response>)))
  "Returns md5sum for a message object of type '<get_object_pose-response>"
  "ce62f562fe862ddbebe5377023767cb7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'get_object_pose-response)))
  "Returns md5sum for a message object of type 'get_object_pose-response"
  "ce62f562fe862ddbebe5377023767cb7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<get_object_pose-response>)))
  "Returns full string definition for message of type '<get_object_pose-response>"
  (cl:format cl:nil "geometry_msgs/PoseStamped object_pose~%~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'get_object_pose-response)))
  "Returns full string definition for message of type 'get_object_pose-response"
  (cl:format cl:nil "geometry_msgs/PoseStamped object_pose~%~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <get_object_pose-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'object_pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <get_object_pose-response>))
  "Converts a ROS message object to a list"
  (cl:list 'get_object_pose-response
    (cl:cons ':object_pose (object_pose msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'get_object_pose)))
  'get_object_pose-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'get_object_pose)))
  'get_object_pose-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'get_object_pose)))
  "Returns string type for a service object of type '<get_object_pose>"
  "pcl_icp/get_object_pose")