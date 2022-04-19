#! /bin/bash

HOME=/home/sis

export ROS_IP=127.0.0.1
export ROS_MASTER_URI=http://127.0.0.1:11311

source /opt/ros/melodic/setup.bash
source $HOME/.bashrc
source $HOME/sis2021_final/catkin_ws/devel/setup.bash

echo "sis2021 final environment"
