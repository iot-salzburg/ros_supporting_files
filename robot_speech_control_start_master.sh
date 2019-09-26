#!/bin/bash
# Armin Niedermueller - SALZBURG RESEARCH


echo "Starting ROS Robot Speech Control - MASTER"

# set current ip - in order to be found as ros master
export ROS_IP=`hostname -I`

gnome-terminal -e "bash -c 'roslaunch franka_control franka_control.launch robot_ip:=192.168.13.1'"
#sleep 5
#gnome-terminal -e "roslaunch franka_gripper franka_gripper.launch robot_ip:=192.168.13.1"
sleep 3

rostopic pub -1 /franka_control/error_recovery/goal franka_control/ErrorRecoveryActionGoal "{}"
gnome-terminal -e "bash -c 'roslaunch panda_moveit_config panda_moveit.launch'"
sleep 3
gnome-terminal -e "bash -c 'roslaunch panda_moveit_config moveit_rviz.launch'"
sleep 3
gnome-terminal -e "bash -c 'cd ~/libfranka/franka_robot_ws/ && source devel/setup.bash && rosrun niks_experiments StretchingSpeech'"

echo "PRESS 'Continue' in rviz"
