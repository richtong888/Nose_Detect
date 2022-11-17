## License: Apache 2.0. See LICENSE file in root directory.
## Copyright(c) 2015-2017 Intel Corporation. All Rights Reserved.

###############################################
##      Open CV and Numpy integration        ##
###############################################

import pyrealsense2 as rs
import numpy as np
import cv2
import dlib
import imutils

def Dlib_detection(img):
    img = imutils.resize(img, width=640 , height =480)
    predictor_path = 'weight/predictor_nose.dat'

    detector = dlib.get_frontal_face_detector()
    predictor = dlib.shape_predictor(predictor_path)

    # The final parameter of detector is possibility value and 1 means high
    face_rect, score, idx = detector.run(img, 0, 0)

    for i, d in enumerate(face_rect):
        x1 = d.left()
        y1 = d.top()
        x2 = d.right()
        y2 = d.bottom()
        text = '%2.2f(%d)' % (score[i], idx[i])
        shape = predictor(img, d)
        for i in range(7):
            cv2.circle(img,(shape.part(i).x, shape.part(i).y), 2, (0, 255, 0), -1, 8)
            # cv2.putText(img, str(i), shape.part(i).x, shape.part(i).y, cv2.FONT_HERSHEY_SIMPLEX, 0.5,(255, 2555, 255))

        print('point 0 is ( ' + str(shape.part(0).x) + ' , ' + str(shape.part(0).y) + ' , ' +  str(np.round(depth_frame.get_distance(shape.part(0).x, shape.part(0).y),10))+ ' )')
        print('point 1 is ( ' + str(shape.part(1).x) + ' , ' + str(shape.part(1).y) + ' , ' +  str(np.round(depth_frame.get_distance(shape.part(1).x, shape.part(1).y),10))+ ' )')
        print('point 2 is ( ' + str(shape.part(2).x) + ' , ' + str(shape.part(2).y) + ' , ' +  str(np.round(depth_frame.get_distance(shape.part(2).x, shape.part(2).y),10))+ ' )')
        print('point 3 is ( ' + str(shape.part(3).x) + ' , ' + str(shape.part(3).y) + ' , ' +  str(np.round(depth_frame.get_distance(shape.part(3).x, shape.part(3).y),10))+ ' )')
        print('point 4 is ( ' + str(shape.part(4).x) + ' , ' + str(shape.part(4).y) + ' , ' +  str(np.round(depth_frame.get_distance(shape.part(4).x, shape.part(4).y),10))+ ' )')
        print('point 5 is ( ' + str(shape.part(5).x) + ' , ' + str(shape.part(5).y) + ' , ' +  str(np.round(depth_frame.get_distance(shape.part(5).x, shape.part(5).y),10))+ ' )')

        path = 'landmark_pixels.txt'
        f = open(path, 'w')
        lmark = str(shape.part(4).x) + ' ' + str(shape.part(4).y) + ' ' + str(np.round(depth_frame.get_distance(shape.part(4).x, shape.part(4).y),10))
        rmark = str(shape.part(5).x) + ' ' + str(shape.part(5).y) + ' ' + str(np.round(depth_frame.get_distance(shape.part(5).x, shape.part(5).y),10))
        f.write( lmark )
        f.write(' \n')
        f.write( rmark )        
        f.close()

        cv2.rectangle(img, (x1, y1), (x2, y2), (0, 255, 0), 4, cv2.LINE_AA)
        print('Top-left and Bot-right coordinates are ' + ' ( ' + str(x1) + ' , ' + str(y1) + ' ) '  + ' ( ' + str(x2) + ' , ' + str(y2) + ' ) '  )
        cv2.putText(img, text, (x1, y1), cv2.FONT_HERSHEY_DUPLEX, 1.5, (255, 255, 255), 1, cv2.LINE_AA)

        cv2.imshow("Landmark_Detection", img)
        cv2.imwrite('nose_xyz_out_landmark.png', img)



# Configure depth and color streams
pipeline = rs.pipeline()
config = rs.config()

# Get device product line for setting a supporting resolution
pipeline_wrapper = rs.pipeline_wrapper(pipeline)
pipeline_profile = config.resolve(pipeline_wrapper)
device = pipeline_profile.get_device()
device_product_line = str(device.get_info(rs.camera_info.product_line))

# Make RGB & Depth align at the same time 

align_to =  rs.stream.color
align = rs.align(align_to)

found_rgb = False
for s in device.sensors:
    if s.get_info(rs.camera_info.name) == 'RGB Camera':
        found_rgb = True
        break
if not found_rgb:
    print("The demo requires Depth camera with Color sensor")
    exit(0)

config.enable_stream(rs.stream.depth, 640, 480, rs.format.z16, 30)

if device_product_line == 'L500':
    config.enable_stream(rs.stream.color, 960, 540, rs.format.bgr8, 30)
else:
    config.enable_stream(rs.stream.color, 640, 480, rs.format.bgr8, 30)

# Start streaming
pipeline.start(config)

try:
    while True:

        # Wait for a coherent pair of frames: depth and color
        frames = pipeline.wait_for_frames()
        aligned_frames = align.process(frames)
        depth_frame = aligned_frames.get_depth_frame()
        color_frame = aligned_frames.get_color_frame()
        # depth_frame.get_distance(x,y)
        # depth_frame = frames.get_depth_frame()
        # color_frame = frames.get_color_frame()

        if not depth_frame or not color_frame:
            continue

        # Convert images to numpy arrays
        depth_image = np.asanyarray(depth_frame.get_data())
        color_image = np.asanyarray(color_frame.get_data())

        # Apply colormap on depth image (image must be converted to 8-bit per pixel first)
        depth_colormap = cv2.applyColorMap(cv2.convertScaleAbs(depth_image, alpha=0.03), cv2.COLORMAP_JET)

        text_depth = 'depth value of point (320,240) is '+ str(np.round(depth_frame.get_distance(320, 240),4))+" meter(s)"
        color_image = cv2.circle(color_image,(320,240),1,(0,255,255),-1)
        color_image=cv2.putText(color_image, text_depth, (10,20),  cv2.FONT_HERSHEY_PLAIN, 1, (0,0,255), 1, cv2.LINE_AA)

        depth_colormap_dim = depth_colormap.shape
        color_colormap_dim = color_image.shape

        # If depth and color resolutions are different, resize color image to match depth image for display
        if depth_colormap_dim != color_colormap_dim:
            resized_color_image = cv2.resize(color_image, dsize=(depth_colormap_dim[1], depth_colormap_dim[0]), interpolation=cv2.INTER_AREA)
            # images = np.hstack((resized_color_image, depth_colormap))
            images = resized_color_image
        else:
            # images = np.hstack((color_image, depth_colormap))
            images = color_image

        # Show images
        cv2.namedWindow('RealSense', cv2.WINDOW_AUTOSIZE)
        cv2.imshow('RealSense', images)
        
        key = cv2.waitKey(1)

        if key & 0xFF == ord('q') or key == 27:
            cv2.destroyAllWindows()
            break
        if key & 0xFF == key == 13: #Press Enter to save image
            output_image = 'nose_xyz_out.png'
            cv2.imwrite(output_image,images)
            img = cv2.imread(output_image)
            Dlib_detection(img)

finally:

    # Stop streaming
    pipeline.stop()