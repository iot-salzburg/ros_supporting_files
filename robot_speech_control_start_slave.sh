#!/bin/bash
#Armin Niedermueller - SALZBURG RESEARCH


echo "Starting ROS Robot Speech Control - SLAVE"

# set current ip - in order to be found in distributed ros
export ROS_IP=`hostname -I`

# set panda pc as ros master
export ROS_MASTER_URI=http://192.168.48.41:11311

gnome-terminal -e "bash -c 'cd ~/libfranka/franka_robot_ws/src/MultilingualROSSpeechControl && python TTSNode.py'"
sleep 3
gnome-terminal -e "bash -c 'cd ~/libfranka/franka_robot_ws/src/MultilingualROSSpeechControl && python STTNode.py'"


