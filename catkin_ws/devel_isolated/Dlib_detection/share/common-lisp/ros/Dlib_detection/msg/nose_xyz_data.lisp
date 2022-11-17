; Auto-generated. Do not edit!


(cl:in-package Dlib_detection-msg)


;//! \htmlinclude nose_xyz_data.msg.html

(cl:defclass <nose_xyz_data> (roslisp-msg-protocol:ros-message)
  ((lnx
    :reader lnx
    :initarg :lnx
    :type cl:integer
    :initform 0)
   (lny
    :reader lny
    :initarg :lny
    :type cl:integer
    :initform 0)
   (rnx
    :reader rnx
    :initarg :rnx
    :type cl:integer
    :initform 0)
   (rny
    :reader rny
    :initarg :rny
    :type cl:integer
    :initform 0))
)

(cl:defclass nose_xyz_data (<nose_xyz_data>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <nose_xyz_data>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'nose_xyz_data)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name Dlib_detection-msg:<nose_xyz_data> is deprecated: use Dlib_detection-msg:nose_xyz_data instead.")))

(cl:ensure-generic-function 'lnx-val :lambda-list '(m))
(cl:defmethod lnx-val ((m <nose_xyz_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader Dlib_detection-msg:lnx-val is deprecated.  Use Dlib_detection-msg:lnx instead.")
  (lnx m))

(cl:ensure-generic-function 'lny-val :lambda-list '(m))
(cl:defmethod lny-val ((m <nose_xyz_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader Dlib_detection-msg:lny-val is deprecated.  Use Dlib_detection-msg:lny instead.")
  (lny m))

(cl:ensure-generic-function 'rnx-val :lambda-list '(m))
(cl:defmethod rnx-val ((m <nose_xyz_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader Dlib_detection-msg:rnx-val is deprecated.  Use Dlib_detection-msg:rnx instead.")
  (rnx m))

(cl:ensure-generic-function 'rny-val :lambda-list '(m))
(cl:defmethod rny-val ((m <nose_xyz_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader Dlib_detection-msg:rny-val is deprecated.  Use Dlib_detection-msg:rny instead.")
  (rny m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <nose_xyz_data>) ostream)
  "Serializes a message object of type '<nose_xyz_data>"
  (cl:let* ((signed (cl:slot-value msg 'lnx)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'lny)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'rnx)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'rny)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <nose_xyz_data>) istream)
  "Deserializes a message object of type '<nose_xyz_data>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'lnx) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'lny) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rnx) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rny) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<nose_xyz_data>)))
  "Returns string type for a message object of type '<nose_xyz_data>"
  "Dlib_detection/nose_xyz_data")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'nose_xyz_data)))
  "Returns string type for a message object of type 'nose_xyz_data"
  "Dlib_detection/nose_xyz_data")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<nose_xyz_data>)))
  "Returns md5sum for a message object of type '<nose_xyz_data>"
  "bdeaa40a8607bdbfa496b05a8dcf2e21")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'nose_xyz_data)))
  "Returns md5sum for a message object of type 'nose_xyz_data"
  "bdeaa40a8607bdbfa496b05a8dcf2e21")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<nose_xyz_data>)))
  "Returns full string definition for message of type '<nose_xyz_data>"
  (cl:format cl:nil "int64 lnx~%int64 lny~%int64 rnx~%int64 rny~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'nose_xyz_data)))
  "Returns full string definition for message of type 'nose_xyz_data"
  (cl:format cl:nil "int64 lnx~%int64 lny~%int64 rnx~%int64 rny~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <nose_xyz_data>))
  (cl:+ 0
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <nose_xyz_data>))
  "Converts a ROS message object to a list"
  (cl:list 'nose_xyz_data
    (cl:cons ':lnx (lnx msg))
    (cl:cons ':lny (lny msg))
    (cl:cons ':rnx (rnx msg))
    (cl:cons ':rny (rny msg))
))
