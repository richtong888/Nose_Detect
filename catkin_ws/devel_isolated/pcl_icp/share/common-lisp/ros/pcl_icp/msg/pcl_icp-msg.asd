
(cl:in-package :asdf)

(defsystem "pcl_icp-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "nose_pcxyz_data" :depends-on ("_package_nose_pcxyz_data"))
    (:file "_package_nose_pcxyz_data" :depends-on ("_package"))
    (:file "nose_xyz_data" :depends-on ("_package_nose_xyz_data"))
    (:file "_package_nose_xyz_data" :depends-on ("_package"))
  ))