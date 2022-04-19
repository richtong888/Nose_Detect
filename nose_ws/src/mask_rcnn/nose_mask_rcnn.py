import detectron2
from detectron2.utils.logger import setup_logger

# import some common libraries
import matplotlib.pyplot as plt
import numpy as np
import cv2
import os
import logging
import gdown
import torch
from zipfile import ZipFile

# import some common detectron2 utilities
from detectron2.engine import DefaultPredictor
from detectron2.config import get_cfg
from detectron2.utils.visualizer import Visualizer
from detectron2.data import MetadataCatalog, DatasetCatalog

from detectron2.data.datasets import register_coco_instances


register_coco_instances('face_train', {}, 
                        './nose_detect_dataset/content/face_train_dataset_output/annotations.json', 
                       './nose_detect_dataset/content/face_train_dataset_output/JPEGImages')
register_coco_instances('face_val', {}, 
                        './nose_detect_dataset/content/face_val1_dataset_output/annotations.json', 
                       './nose_detect_dataset/content/face_val1_dataset_output/JPEGImages')

nose_metadata = MetadataCatalog.get('face_train')
dataset_dicts = DatasetCatalog.get('face_train')
nose_metadata

import random

for d in random.sample(dataset_dicts, 1):
#     print(d)
    img = cv2.imread(d["file_name"])
    print(img)
    visualizer = Visualizer(img[:, :, ::1], metadata = nose_metadata, scale=0.8)
    vis = visualizer.draw_dataset_dict(d)
    plt.imshow(vis.get_image()[:, :, ::-1], cmap='nipy_spectral')

from detectron2.engine import DefaultTrainer
from detectron2.config import get_cfg
from detectron2 import model_zoo

cfg = get_cfg()
cfg.merge_from_file(model_zoo.get_config_file("COCO-InstanceSegmentation/mask_rcnn_R_50_FPN_3x.yaml"))
cfg.DATASETS.TRAIN = ("face_train",)
cfg.DATASETS.TEST = ("face_val", )
cfg.DATALOADER.NUM_WORKERS = 0 #Single thread
cfg.MODEL.WEIGHTS = model_zoo.get_checkpoint_url("COCO-InstanceSegmentation/mask_rcnn_R_50_FPN_3x.yaml")  # Let training initialize from model zoo
# cfg.MODEL.WEIGHTS = os.path.join(cfg.OUTPUT_DIR, "/content/output/model_final.pth")

cfg.MODEL.ROI_HEADS.NUM_CLASSES =5  # datasets classes
cfg.SOLVER.IMS_PER_BATCH =5 #Batch size
ITERS_IN_ONE_EPOCH = 200 #dataset_imgs/batch_size  
cfg.SOLVER.MAX_ITER = (ITERS_IN_ONE_EPOCH * 15) # ITERS

cfg.SOLVER.BASE_LR = 0.002  # pick a good LR
cfg.SOLVER.MOMENTUM = 0.9
cfg.SOLVER.WEIGHT_DECAY = 0.0001
cfg.SOLVER.GAMMA = 0.1
cfg.MODEL.ROI_HEADS.BATCH_SIZE_PER_IMAGE = 32   # faster, and good enough for this toy dataset (default: 512)
cfg.SOLVER.WARMUP_FACTOR = 1.0 / 1000
cfg.SOLVER.WARMUP_ITERS = 800
cfg.SOLVER.WARMUP_METHOD = "linear"
cfg.SOLVER.CHECKPOINT_PERIOD = ITERS_IN_ONE_EPOCH #Save training model interval   

from detectron2.utils.visualizer import ColorMode
import random

cfg.MODEL.WEIGHTS = os.path.join("./weight/model_final_1014_4500.pth")
# cfg.MODEL.WEIGHTS = "/content/output/model_0000499.pth"
cfg.MODEL.ROI_HEADS.SCORE_THRESH_TEST = 0.3   # set the testing threshold for this model
cfg.DATASETS.TEST = ("face_val", )
predictor = DefaultPredictor(cfg)
trainer = DefaultTrainer(cfg)
trainer.resume_or_load(False)

for d in random.sample(dataset_dicts, 1):    
    im = cv2.imread(d["file_name"])
    print(d["file_name"])
    outputs = predictor(im)
    v = Visualizer(im[:, :, ::1],
                   metadata=nose_metadata, 
                   scale=1, 
                   
#                    instance_mode=ColorMode.IMAGE_BW   # remove the colors of unsegmented pixels
    )
    v = v.draw_instance_predictions(outputs["instances"].to("cpu"))
    # plt.imshow('Display window', cmap='nipy_spectral')
    plt.imshow(v.get_image()[:, :, ::-1], cmap='nipy_spectral')
    plt.imsave('output/testing1.jpg',v.get_image()[:, :, ::-1],cmap='nipy_spectral')
    
    print('---------position-----------')
    print('The catogory ID : ( 1 , nose ) ( 2 , l ) ( 3 , r ) ')
    print('Following four parameters are (up-left-x,up-left-y,extension x length,extension y length)')
    print(d['annotations'][0]['category_id'])
    print(d['annotations'][0]['bbox'])
    print(d['annotations'][1]['category_id'])
    print(d['annotations'][1]['bbox'])
    print(d['annotations'][2]['category_id'])
    print(d['annotations'][2]['bbox'])

import pyrealsense2 as rs
import numpy as np
import cv2

# Configure depth and color streams
pipeline = rs.pipeline()
config = rs.config()

# Get device product line for setting a supporting resolution
pipeline_wrapper = rs.pipeline_wrapper(pipeline)
pipeline_profile = config.resolve(pipeline_wrapper)
device = pipeline_profile.get_device()
device_product_line = str(device.get_info(rs.camera_info.product_line))

def face_xyz(images):

    #Pridict your own images
    img_in = 'nose_xyz_image.png'
    img_out = 'testing_img/out_' + img_in
    img = cv2.imread(img_in)
    print(img)
    outputs = predictor(img)
    v = Visualizer(img[:, :, ::1],metadata=nose_metadata, scale=1,)
    v = v.draw_instance_predictions(outputs["instances"].to("cpu"))
    # plt.imshow('Display window', cmap='nipy_spectral')
    plt.imshow(v.get_image()[:, :, ::-1], cmap='nipy_spectral')
    plt.imsave(img_out ,v.get_image()[:, :, ::-1],cmap='nipy_spectral')

    print('---------position-----------')
    print('The catogory ID : ( 1 , nose ) ( 2 , l ) ( 3 , r )')
    print(d['annotations'][0]['category_id'])
    print(d['annotations'][0]['bbox'])
    print(d['annotations'][1]['category_id'])
    print(d['annotations'][1]['bbox'])
    print(d['annotations'][2]['category_id'])
    print(d['annotations'][2]['bbox'])
    
    nose_top = np.array([d['annotations'][0]['bbox'][0] + 0.5*d['annotations'][0]['bbox'][2],d['annotations'][0]['bbox'][1]])
    nose_bot = np.array([d['annotations'][0]['bbox'][0] + 0.5*d['annotations'][0]['bbox'][2],d['annotations'][0]['bbox'][1]+d['annotations'][0]['bbox'][3]])
    # nose_position = np.array(d['annotations'][0]['bbox'])
    print('this is nose top z')
    print(depth_frame.get_distance(int(d['annotations'][0]['bbox'][0] + 0.5*d['annotations'][0]['bbox'][2]),int(d['annotations'][0]['bbox'][1])))
    print('this is nose bot z')
    print(depth_frame.get_distance(int(d['annotations'][0]['bbox'][0] + 0.5*d['annotations'][0]['bbox'][2]),int(d['annotations'][0]['bbox'][1]+d['annotations'][0]['bbox'][3])))

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
            cv2.imwrite('nose_xyz_image.png',images)
            face_xyz(images)

finally:

    # Stop streaming
    pipeline.stop()



