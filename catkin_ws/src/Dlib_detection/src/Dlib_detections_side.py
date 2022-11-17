import dlib
import cv2
import imutils
import numpy as np


# 讀取照片圖檔
img_id = '10'
img_name = 'human_face_' + img_id + '.jpg'
img_name = '../img/img8.jpg'
print(img_name)
img_output = 'output_' + img_name
#img_name = 'val_human1.jpg'
img = cv2.imread(img_name)

# 縮小圖片
img = imutils.resize(img, width=1280)

#Dlib facial landmarks model的path
# predictor_path = "shape_predictor_68_face_landmarks.dat"
predictor_path = "../weight/predictor_face_side_816_0515.dat"
detector_path = "../weight/predictor_face_side_816_0515.svm"


#於landmarks上畫圓，標識特徴點
def renderFace(im, landmarks, color=(0, 255, 0), radius=3):
  for p in landmarks.parts():
    cv2.circle(im, (p.x, p.y), radius, color, -1)


#detector為臉孔偵測，predictor為landmarks偵測
# detector = dlib.get_frontal_face_detector()
detector = dlib.simple_object_detector(detector_path)
predictor = dlib.shape_predictor(predictor_path)

# 偵測人臉
face_rects = detector(img, 1)


# 取出所有偵測的結果
for i, d in enumerate(face_rects):
    x1 = d.left()
    y1 = d.top()
    x2 = d.right()
    y2 = d.bottom()
    # text = "%2.2f(%d)" % (scores[i], idx[i])

# Landmarkiing 68 face points   
    # shape = predictor(img, d)
    # for i in range(68):
    # #cv2.circle(影像, 圓心座標, 半徑, 顏色, 線條寬度)
    #     cv2.circle(img, (shape.part(i).x, shape.part(i).y), 2, (0, 255, 0), -1, 8)
    #     #cv2.putText(影像, 文字, 座標, 字型, 大小, 顏色, 線條寬度, 線條種類)
    #     cv2.putText(img, str(i), (shape.part(i).x, shape.part(i).y), cv2.FONT_HERSHEY_SIMPLEX, 0.5,(255, 2555, 255))
    # print('point 31 is ( ' + str(shape.part(31).x) + ' , ' + str(shape.part(31).y) + ' )')
    # print('point 32 is ( ' + str(shape.part(32).x) + ' , ' + str(shape.part(32).y) + ' )')
    # print('point 33 is ( ' + str(shape.part(33).x) + ' , ' + str(shape.part(33).y) + ' )')
    # print('point 34 is ( ' + str(shape.part(34).x) + ' , ' + str(shape.part(34).y) + ' )')
    # print('point 35 is ( ' + str(shape.part(35).x) + ' , ' + str(shape.part(35).y) + ' )')

    shape = predictor(img, d)
    for i in range(6):
    #cv2.circle(影像, 圓心座標, 半徑, 顏色, 線條寬度)
        cv2.circle(img, (shape.part(i).x, shape.part(i).y), 4, (255, 0, 0), 2, 8)
        #cv2.putText(影像, 文字, 座標, 字型, 大小, 顏色, 線條寬度, 線條種類)
        cv2.putText(img, str(i), (shape.part(i).x, shape.part(i).y), cv2.FONT_HERSHEY_SIMPLEX, 2,(255, 2555, 255))
    print('point 1 is ( ' + str(shape.part(1).x) + ' , ' + str(shape.part(1).y) + ' )')
    print('point 2 is ( ' + str(shape.part(2).x) + ' , ' + str(shape.part(2).y) + ' )')
    print('point 3 is ( ' + str(shape.part(3).x) + ' , ' + str(shape.part(3).y) + ' )')
    print('point 4 is ( ' + str(shape.part(4).x) + ' , ' + str(shape.part(4).y) + ' )')
    print('point 5 is ( ' + str(shape.part(5).x) + ' , ' + str(shape.part(5).y) + ' )')    

# 以方框標示偵測的人臉
    cv2.rectangle(img, (x1, y1), (x2, y2), (0, 255, 0), 4, cv2.LINE_AA)
    print('Top-left and Bot-right coordinates are ' + ' ( ' + str(x1) + ' , ' + str(y1) + ' ) '  + ' ( ' + str(x2) + ' , ' + str(y2) + ' ) '  )
    # cv2.putText(img,  (x1, y1), cv2.FONT_HERSHEY_DUPLEX, 1.5, (255, 255, 255), 1, cv2.LINE_AA)

# output result
cv2.imshow("Face Detection", img)
cv2.imwrite(img_output,img)

# we can use images = np.hstack((color_image, depth_colormap)) to combine to images.
print('Press esc to exit')
key = cv2.waitKey(0) & 0xFF
if key == ord('q'):
  cv2.destroyAllWindows()


