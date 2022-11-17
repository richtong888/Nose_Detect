;; Auto-generated. Do not edit!


(when (boundp 'pcl_icp::nose_xyz_data)
  (if (not (find-package "PCL_ICP"))
    (make-package "PCL_ICP"))
  (shadow 'nose_xyz_data (find-package "PCL_ICP")))
(unless (find-package "PCL_ICP::NOSE_XYZ_DATA")
  (make-package "PCL_ICP::NOSE_XYZ_DATA"))

(in-package "ROS")
;;//! \htmlinclude nose_xyz_data.msg.html


(defclass pcl_icp::nose_xyz_data
  :super ros::object
  :slots (_lnx _lny _rnx _rny ))

(defmethod pcl_icp::nose_xyz_data
  (:init
   (&key
    ((:lnx __lnx) 0)
    ((:lny __lny) 0)
    ((:rnx __rnx) 0)
    ((:rny __rny) 0)
    )
   (send-super :init)
   (setq _lnx (round __lnx))
   (setq _lny (round __lny))
   (setq _rnx (round __rnx))
   (setq _rny (round __rny))
   self)
  (:lnx
   (&optional __lnx)
   (if __lnx (setq _lnx __lnx)) _lnx)
  (:lny
   (&optional __lny)
   (if __lny (setq _lny __lny)) _lny)
  (:rnx
   (&optional __rnx)
   (if __rnx (setq _rnx __rnx)) _rnx)
  (:rny
   (&optional __rny)
   (if __rny (setq _rny __rny)) _rny)
  (:serialization-length
   ()
   (+
    ;; int64 _lnx
    8
    ;; int64 _lny
    8
    ;; int64 _rnx
    8
    ;; int64 _rny
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _lnx
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _lnx (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _lnx) (= (length (_lnx . bv)) 2)) ;; bignum
              (write-long (ash (elt (_lnx . bv) 0) 0) s)
              (write-long (ash (elt (_lnx . bv) 1) -1) s))
             ((and (class _lnx) (= (length (_lnx . bv)) 1)) ;; big1
              (write-long (elt (_lnx . bv) 0) s)
              (write-long (if (>= _lnx 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _lnx s)(write-long (if (>= _lnx 0) 0 #xffffffff) s)))
     ;; int64 _lny
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _lny (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _lny) (= (length (_lny . bv)) 2)) ;; bignum
              (write-long (ash (elt (_lny . bv) 0) 0) s)
              (write-long (ash (elt (_lny . bv) 1) -1) s))
             ((and (class _lny) (= (length (_lny . bv)) 1)) ;; big1
              (write-long (elt (_lny . bv) 0) s)
              (write-long (if (>= _lny 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _lny s)(write-long (if (>= _lny 0) 0 #xffffffff) s)))
     ;; int64 _rnx
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _rnx (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _rnx) (= (length (_rnx . bv)) 2)) ;; bignum
              (write-long (ash (elt (_rnx . bv) 0) 0) s)
              (write-long (ash (elt (_rnx . bv) 1) -1) s))
             ((and (class _rnx) (= (length (_rnx . bv)) 1)) ;; big1
              (write-long (elt (_rnx . bv) 0) s)
              (write-long (if (>= _rnx 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _rnx s)(write-long (if (>= _rnx 0) 0 #xffffffff) s)))
     ;; int64 _rny
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _rny (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _rny) (= (length (_rny . bv)) 2)) ;; bignum
              (write-long (ash (elt (_rny . bv) 0) 0) s)
              (write-long (ash (elt (_rny . bv) 1) -1) s))
             ((and (class _rny) (= (length (_rny . bv)) 1)) ;; big1
              (write-long (elt (_rny . bv) 0) s)
              (write-long (if (>= _rny 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _rny s)(write-long (if (>= _rny 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _lnx
#+(or :alpha :irix6 :x86_64)
      (setf _lnx (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _lnx (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _lny
#+(or :alpha :irix6 :x86_64)
      (setf _lny (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _lny (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _rnx
#+(or :alpha :irix6 :x86_64)
      (setf _rnx (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _rnx (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _rny
#+(or :alpha :irix6 :x86_64)
      (setf _rny (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _rny (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get pcl_icp::nose_xyz_data :md5sum-) "bdeaa40a8607bdbfa496b05a8dcf2e21")
(setf (get pcl_icp::nose_xyz_data :datatype-) "pcl_icp/nose_xyz_data")
(setf (get pcl_icp::nose_xyz_data :definition-)
      "int64 lnx
int64 lny
int64 rnx
int64 rny

")



(provide :pcl_icp/nose_xyz_data "bdeaa40a8607bdbfa496b05a8dcf2e21")


