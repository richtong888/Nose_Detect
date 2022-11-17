
(cl:in-package :asdf)

(defsystem "Dlib_detection-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "nose_xyz_data" :depends-on ("_package_nose_xyz_data"))
    (:file "_package_nose_xyz_data" :depends-on ("_package"))
  ))