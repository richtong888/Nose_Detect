import numpy as np
import cv2
import os

name = 'point13.txt'
path = 'cal_0913/default_paramters/'
 #path = ''
f = open(path+name, 'r')


    
#     f = open(path+file_point[i],'r')
text = f.read()
    
newtext = text.split("\n")
output_path = path +'output_' + name
f = open(output_path,'w')
cnt = 0

i = 0
f.writelines('tag_0\n')
while i < len(newtext):
    if newtext[i] == '    child_frame_id: "tag_0"':
        print(newtext[i])
    #        print(newtext[i+3],newtext[i+4],newtext[i+5],newtext[i+7],newtext[i+8],newtext[i+9],newtext[i+10])
        tag_1 = newtext[i+3].replace('x: ','') + newtext[i+4].replace('y: ','') + newtext[i+5].replace('z: ','') + newtext[i+7].replace('x: ','') + newtext[i+8].replace('y: ','') + newtext[i+9].replace('z: ','') + newtext[i+10].replace('w: ','') 
    #         print(tag_1)
        f.writelines(tag_1 + '\n')
        cnt = cnt +1
    i=i+1


i = 0
f.writelines('tag_1\n')
while i < len(newtext):
    if newtext[i] == '    child_frame_id: "tag_1"':
        print(newtext[i])
    #         print(newtext[i+3],newtext[i+4],newtext[i+5],newtext[i+7],newtext[i+8],newtext[i+9],newtext[i+10])
        tag_1 = newtext[i+3].replace('x: ','') + newtext[i+4].replace('y: ','') + newtext[i+5].replace('z: ','') + newtext[i+7].replace('x: ','') + newtext[i+8].replace('y: ','') + newtext[i+9].replace('z: ','') + newtext[i+10].replace('w: ','') 
    #         print(tag_1)
        f.writelines(tag_1 + '\n')
        cnt = cnt +1
    i=i+1


i = 0
f.writelines('tag_2\n')

while i < len(newtext):
    if newtext[i] == '    child_frame_id: "tag_2"':
        print(newtext[i])
    #         print(newtext[i+3],newtext[i+4],newtext[i+5],newtext[i+7],newtext[i+8],newtext[i+9],newtext[i+10])
        tag_1 = newtext[i+3].replace('x: ','') + newtext[i+4].replace('y: ','') + newtext[i+5].replace('z: ','') + newtext[i+7].replace('x: ','') + newtext[i+8].replace('y: ','') + newtext[i+9].replace('z: ','') + newtext[i+10].replace('w: ','') 
    #         print(tag_1)
        f.writelines(tag_1 + '\n')
        cnt = cnt +1
    i=i+1


i = 0
f.writelines('tag_3\n')

while i < len(newtext):
    if newtext[i] == '    child_frame_id: "tag_3"':
        print(newtext[i])
    #         print(newtext[i+3],newtext[i+4],newtext[i+5],newtext[i+7],newtext[i+8],newtext[i+9],newtext[i+10])
        tag_1 = newtext[i+3].replace('x: ','') + newtext[i+4].replace('y: ','') + newtext[i+5].replace('z: ','') + newtext[i+7].replace('x: ','') + newtext[i+8].replace('y: ','') + newtext[i+9].replace('z: ','') + newtext[i+10].replace('w: ','') 
    #         print(tag_1)
        f.writelines(tag_1 + '\n')
        cnt = cnt +1
    i=i+1   


    i = 0
    f.writelines('tag_4\n')

    while i < len(newtext):
        if newtext[i] == '    child_frame_id: "tag_4"':
            print(newtext[i])
    #         print(newtext[i+3],newtext[i+4],newtext[i+5],newtext[i+7],newtext[i+8],newtext[i+9],newtext[i+10])
            tag_1 = newtext[i+3].replace('x: ','') + newtext[i+4].replace('y: ','') + newtext[i+5].replace('z: ','') + newtext[i+7].replace('x: ','') + newtext[i+8].replace('y: ','') + newtext[i+9].replace('z: ','') + newtext[i+10].replace('w: ','') 
    #         print(tag_1)
            f.writelines(tag_1 + '\n')
            cnt = cnt +1
        i=i+1


    i = 0
    f.writelines('tag_5\n')

    while i < len(newtext):
        if newtext[i] == '    child_frame_id: "tag_5"':
            print(newtext[i])
    #         print(newtext[i+3],newtext[i+4],newtext[i+5],newtext[i+7],newtext[i+8],newtext[i+9],newtext[i+10])
            tag_1 = newtext[i+3].replace('x: ','') + newtext[i+4].replace('y: ','') + newtext[i+5].replace('z: ','') + newtext[i+7].replace('x: ','') + newtext[i+8].replace('y: ','') + newtext[i+9].replace('z: ','') + newtext[i+10].replace('w: ','') 
    #         print(tag_1)
            f.writelines(tag_1 + '\n')
            cnt = cnt +1
        i=i+1

    i = 0
    f.writelines('my_bundle\n')

    while i < len(newtext):
        if newtext[i] == '    child_frame_id: "my_bundle"':
            print(newtext[i])
    #         print(newtext[i+3],newtext[i+4],newtext[i+5],newtext[i+7],newtext[i+8],newtext[i+9],newtext[i+10])
            tag_1 = newtext[i+3].replace('x: ','') + newtext[i+4].replace('y: ','') + newtext[i+5].replace('z: ','') + newtext[i+7].replace('x: ','') + newtext[i+8].replace('y: ','') + newtext[i+9].replace('z: ','') + newtext[i+10].replace('w: ','') 
    #         print(tag_1)
            f.writelines(tag_1 + '\n')
            cnt = cnt +1
        i=i+1

f.close()    

