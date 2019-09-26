# ros_supporting_files
In here you can find start scripts for the demonstrators, etc

### PiValueCalculator

1. Download libfranka
2. copy PiValueCalulator into libfranka/example
3. Add PiValueCalculator to files inside CMakeLists.txt
4. build libfranka -> see franka FCI Docs in the web
5. PiValueCalculator returns the actual joint values


### Robot Speech Control

There are specific python dependencies to fullfil. See robot_speech_control_pip_files.md for the whole list.
the most imporant are scikit-learn, numpy, snips-nlu, speech recognition in the exact same version numbers!

####Szenario 1: Speech Control at the Panda PC
use the robot_speech_control_start.sh script

####Szenario 2: Speech Control via an Remote PC
use the robot_speech_control_start_slave.sh script on the remote PC
use the robot_speech_control_start_master.sh script on the Panda PC


