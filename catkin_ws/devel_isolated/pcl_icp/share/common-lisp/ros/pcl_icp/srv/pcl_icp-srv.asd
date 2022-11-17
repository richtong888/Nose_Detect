
(cl:in-package :asdf)

(defsystem "pcl_icp-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "get_object_pose" :depends-on ("_package_get_object_pose"))
    (:file "_package_get_object_pose" :depends-on ("_package"))
  ))