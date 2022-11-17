; Auto-generated. Do not edit!


(cl:in-package pcl_icp-msg)


;//! \htmlinclude nose_pcxyz_data.msg.html

(cl:defclass <nose_pcxyz_data> (roslisp-msg-protocol:ros-message)
  ((pc_lnx
    :reader pc_lnx
    :initarg :pc_lnx
    :type cl:float
    :initform 0.0)
   (pc_lny
    :reader pc_lny
    :initarg :pc_lny
    :type cl:float
    :initform 0.0)
   (pc_lnz
    :reader pc_lnz
    :initarg :pc_lnz
    :type cl:float
    :initform 0.0)
   (pc_rnx
    :reader pc_rnx
    :initarg :pc_rnx
    :type cl:float
    :initform 0.0)
   (pc_rny
    :reader pc_rny
    :initarg :pc_rny
    :type cl:float
    :initform 0.0)
   (pc_rnz
    :reader pc_rnz
    :initarg :pc_rnz
    :type cl:float
    :initform 0.0))
)

(cl:defclass nose_pcxyz_data (<nose_pcxyz_data>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <nose_pcxyz_data>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'nose_pcxyz_data)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pcl_icp-msg:<nose_pcxyz_data> is deprecated: use pcl_icp-msg:nose_pcxyz_data instead.")))

(cl:ensure-generic-function 'pc_lnx-val :lambda-list '(m))
(cl:defmethod pc_lnx-val ((m <nose_pcxyz_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_icp-msg:pc_lnx-val is deprecated.  Use pcl_icp-msg:pc_lnx instead.")
  (pc_lnx m))

(cl:ensure-generic-function 'pc_lny-val :lambda-list '(m))
(cl:defmethod pc_lny-val ((m <nose_pcxyz_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_icp-msg:pc_lny-val is deprecated.  Use pcl_icp-msg:pc_lny instead.")
  (pc_lny m))

(cl:ensure-generic-function 'pc_lnz-val :lambda-list '(m))
(cl:defmethod pc_lnz-val ((m <nose_pcxyz_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_icp-msg:pc_lnz-val is deprecated.  Use pcl_icp-msg:pc_lnz instead.")
  (pc_lnz m))

(cl:ensure-generic-function 'pc_rnx-val :lambda-list '(m))
(cl:defmethod pc_rnx-val ((m <nose_pcxyz_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_icp-msg:pc_rnx-val is deprecated.  Use pcl_icp-msg:pc_rnx instead.")
  (pc_rnx m))

(cl:ensure-generic-function 'pc_rny-val :lambda-list '(m))
(cl:defmethod pc_rny-val ((m <nose_pcxyz_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_icp-msg:pc_rny-val is deprecated.  Use pcl_icp-msg:pc_rny instead.")
  (pc_rny m))

(cl:ensure-generic-function 'pc_rnz-val :lambda-list '(m))
(cl:defmethod pc_rnz-val ((m <nose_pcxyz_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_icp-msg:pc_rnz-val is deprecated.  Use pcl_icp-msg:pc_rnz instead.")
  (pc_rnz m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <nose_pcxyz_data>) ostream)
  "Serializes a message object of type '<nose_pcxyz_data>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pc_lnx))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pc_lny))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pc_lnz))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pc_rnx))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pc_rny))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pc_rnz))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <nose_pcxyz_data>) istream)
  "Deserializes a message object of type '<nose_pcxyz_data>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pc_lnx) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pc_lny) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pc_lnz) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pc_rnx) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pc_rny) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pc_rnz) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<nose_pcxyz_data>)))
  "Returns string type for a message object of type '<nose_pcxyz_data>"
  "pcl_icp/nose_pcxyz_data")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'nose_pcxyz_data)))
  "Returns string type for a message object of type 'nose_pcxyz_data"
  "pcl_icp/nose_pcxyz_data")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<nose_pcxyz_data>)))
  "Returns md5sum for a message object of type '<nose_pcxyz_data>"
  "c1bcc417cdf6514a0c8a8d9befe1cdd8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'nose_pcxyz_data)))
  "Returns md5sum for a message object of type 'nose_pcxyz_data"
  "c1bcc417cdf6514a0c8a8d9befe1cdd8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<nose_pcxyz_data>)))
  "Returns full string definition for message of type '<nose_pcxyz_data>"
  (cl:format cl:nil "float32 pc_lnx~%float32 pc_lny~%float32 pc_lnz~%float32 pc_rnx~%float32 pc_rny~%float32 pc_rnz~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'nose_pcxyz_data)))
  "Returns full string definition for message of type 'nose_pcxyz_data"
  (cl:format cl:nil "float32 pc_lnx~%float32 pc_lny~%float32 pc_lnz~%float32 pc_rnx~%float32 pc_rny~%float32 pc_rnz~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <nose_pcxyz_data>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <nose_pcxyz_data>))
  "Converts a ROS message object to a list"
  (cl:list 'nose_pcxyz_data
    (cl:cons ':pc_lnx (pc_lnx msg))
    (cl:cons ':pc_lny (pc_lny msg))
    (cl:cons ':pc_lnz (pc_lnz msg))
    (cl:cons ':pc_rnx (pc_rnx msg))
    (cl:cons ':pc_rny (pc_rny msg))
    (cl:cons ':pc_rnz (pc_rnz msg))
))
