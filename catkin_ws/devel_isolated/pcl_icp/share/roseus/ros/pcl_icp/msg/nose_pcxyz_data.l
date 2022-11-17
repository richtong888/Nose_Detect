;; Auto-generated. Do not edit!


(when (boundp 'pcl_icp::nose_pcxyz_data)
  (if (not (find-package "PCL_ICP"))
    (make-package "PCL_ICP"))
  (shadow 'nose_pcxyz_data (find-package "PCL_ICP")))
(unless (find-package "PCL_ICP::NOSE_PCXYZ_DATA")
  (make-package "PCL_ICP::NOSE_PCXYZ_DATA"))

(in-package "ROS")
;;//! \htmlinclude nose_pcxyz_data.msg.html


(defclass pcl_icp::nose_pcxyz_data
  :super ros::object
  :slots (_pc_lnx _pc_lny _pc_lnz _pc_rnx _pc_rny _pc_rnz ))

(defmethod pcl_icp::nose_pcxyz_data
  (:init
   (&key
    ((:pc_lnx __pc_lnx) 0.0)
    ((:pc_lny __pc_lny) 0.0)
    ((:pc_lnz __pc_lnz) 0.0)
    ((:pc_rnx __pc_rnx) 0.0)
    ((:pc_rny __pc_rny) 0.0)
    ((:pc_rnz __pc_rnz) 0.0)
    )
   (send-super :init)
   (setq _pc_lnx (float __pc_lnx))
   (setq _pc_lny (float __pc_lny))
   (setq _pc_lnz (float __pc_lnz))
   (setq _pc_rnx (float __pc_rnx))
   (setq _pc_rny (float __pc_rny))
   (setq _pc_rnz (float __pc_rnz))
   self)
  (:pc_lnx
   (&optional __pc_lnx)
   (if __pc_lnx (setq _pc_lnx __pc_lnx)) _pc_lnx)
  (:pc_lny
   (&optional __pc_lny)
   (if __pc_lny (setq _pc_lny __pc_lny)) _pc_lny)
  (:pc_lnz
   (&optional __pc_lnz)
   (if __pc_lnz (setq _pc_lnz __pc_lnz)) _pc_lnz)
  (:pc_rnx
   (&optional __pc_rnx)
   (if __pc_rnx (setq _pc_rnx __pc_rnx)) _pc_rnx)
  (:pc_rny
   (&optional __pc_rny)
   (if __pc_rny (setq _pc_rny __pc_rny)) _pc_rny)
  (:pc_rnz
   (&optional __pc_rnz)
   (if __pc_rnz (setq _pc_rnz __pc_rnz)) _pc_rnz)
  (:serialization-length
   ()
   (+
    ;; float32 _pc_lnx
    4
    ;; float32 _pc_lny
    4
    ;; float32 _pc_lnz
    4
    ;; float32 _pc_rnx
    4
    ;; float32 _pc_rny
    4
    ;; float32 _pc_rnz
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _pc_lnx
       (sys::poke _pc_lnx (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pc_lny
       (sys::poke _pc_lny (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pc_lnz
       (sys::poke _pc_lnz (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pc_rnx
       (sys::poke _pc_rnx (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pc_rny
       (sys::poke _pc_rny (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pc_rnz
       (sys::poke _pc_rnz (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _pc_lnx
     (setq _pc_lnx (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pc_lny
     (setq _pc_lny (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pc_lnz
     (setq _pc_lnz (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pc_rnx
     (setq _pc_rnx (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pc_rny
     (setq _pc_rny (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pc_rnz
     (setq _pc_rnz (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get pcl_icp::nose_pcxyz_data :md5sum-) "c1bcc417cdf6514a0c8a8d9befe1cdd8")
(setf (get pcl_icp::nose_pcxyz_data :datatype-) "pcl_icp/nose_pcxyz_data")
(setf (get pcl_icp::nose_pcxyz_data :definition-)
      "float32 pc_lnx
float32 pc_lny
float32 pc_lnz
float32 pc_rnx
float32 pc_rny
float32 pc_rnz

")



(provide :pcl_icp/nose_pcxyz_data "c1bcc417cdf6514a0c8a8d9befe1cdd8")


