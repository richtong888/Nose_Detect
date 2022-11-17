# CMake generated Testfile for 
# Source directory: /home/richtong888/nose_decect/catkin_ws/src/realsense-ros/realsense2_description
# Build directory: /home/richtong888/nose_decect/catkin_ws/build_isolated/realsense2_description
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_realsense2_description_nosetests_tests "/home/richtong888/nose_decect/catkin_ws/build_isolated/realsense2_description/catkin_generated/env_cached.sh" "/usr/bin/python2" "/opt/ros/melodic/share/catkin/cmake/test/run_tests.py" "/home/richtong888/nose_decect/catkin_ws/build_isolated/realsense2_description/test_results/realsense2_description/nosetests-tests.xml" "--return-code" "\"/home/richtong888/.local/lib/python3.6/site-packages/cmake/data/bin/cmake\" -E make_directory /home/richtong888/nose_decect/catkin_ws/build_isolated/realsense2_description/test_results/realsense2_description" "/usr/bin/nosetests-2.7 -P --process-timeout=60 --where=/home/richtong888/nose_decect/catkin_ws/src/realsense-ros/realsense2_description/tests --with-xunit --xunit-file=/home/richtong888/nose_decect/catkin_ws/build_isolated/realsense2_description/test_results/realsense2_description/nosetests-tests.xml")
set_tests_properties(_ctest_realsense2_description_nosetests_tests PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/melodic/share/catkin/cmake/test/tests.cmake;160;add_test;/opt/ros/melodic/share/catkin/cmake/test/nosetests.cmake;83;catkin_run_tests_target;/home/richtong888/nose_decect/catkin_ws/src/realsense-ros/realsense2_description/CMakeLists.txt;17;catkin_add_nosetests;/home/richtong888/nose_decect/catkin_ws/src/realsense-ros/realsense2_description/CMakeLists.txt;0;")
subdirs("gtest")
