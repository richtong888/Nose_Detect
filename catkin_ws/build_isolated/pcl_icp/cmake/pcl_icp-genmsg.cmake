# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "pcl_icp: 2 messages, 1 services")

set(MSG_I_FLAGS "-Ipcl_icp:/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg;-Ivisualization_msgs:/opt/ros/melodic/share/visualization_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(pcl_icp_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/msg/nose_xyz_data.msg" NAME_WE)
add_custom_target(_pcl_icp_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pcl_icp" "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/msg/nose_xyz_data.msg" ""
)

get_filename_component(_filename "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/msg/nose_pcxyz_data.msg" NAME_WE)
add_custom_target(_pcl_icp_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pcl_icp" "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/msg/nose_pcxyz_data.msg" ""
)

get_filename_component(_filename "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/srv/get_object_pose.srv" NAME_WE)
add_custom_target(_pcl_icp_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pcl_icp" "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/srv/get_object_pose.srv" "geometry_msgs/Pose:geometry_msgs/Quaternion:geometry_msgs/Point:geometry_msgs/PoseStamped:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(pcl_icp
  "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/msg/nose_xyz_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pcl_icp
)
_generate_msg_cpp(pcl_icp
  "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/msg/nose_pcxyz_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pcl_icp
)

### Generating Services
_generate_srv_cpp(pcl_icp
  "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/srv/get_object_pose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pcl_icp
)

### Generating Module File
_generate_module_cpp(pcl_icp
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pcl_icp
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(pcl_icp_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(pcl_icp_generate_messages pcl_icp_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/msg/nose_xyz_data.msg" NAME_WE)
add_dependencies(pcl_icp_generate_messages_cpp _pcl_icp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/msg/nose_pcxyz_data.msg" NAME_WE)
add_dependencies(pcl_icp_generate_messages_cpp _pcl_icp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/srv/get_object_pose.srv" NAME_WE)
add_dependencies(pcl_icp_generate_messages_cpp _pcl_icp_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pcl_icp_gencpp)
add_dependencies(pcl_icp_gencpp pcl_icp_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pcl_icp_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(pcl_icp
  "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/msg/nose_xyz_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pcl_icp
)
_generate_msg_eus(pcl_icp
  "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/msg/nose_pcxyz_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pcl_icp
)

### Generating Services
_generate_srv_eus(pcl_icp
  "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/srv/get_object_pose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pcl_icp
)

### Generating Module File
_generate_module_eus(pcl_icp
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pcl_icp
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(pcl_icp_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(pcl_icp_generate_messages pcl_icp_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/msg/nose_xyz_data.msg" NAME_WE)
add_dependencies(pcl_icp_generate_messages_eus _pcl_icp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/msg/nose_pcxyz_data.msg" NAME_WE)
add_dependencies(pcl_icp_generate_messages_eus _pcl_icp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/srv/get_object_pose.srv" NAME_WE)
add_dependencies(pcl_icp_generate_messages_eus _pcl_icp_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pcl_icp_geneus)
add_dependencies(pcl_icp_geneus pcl_icp_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pcl_icp_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(pcl_icp
  "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/msg/nose_xyz_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pcl_icp
)
_generate_msg_lisp(pcl_icp
  "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/msg/nose_pcxyz_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pcl_icp
)

### Generating Services
_generate_srv_lisp(pcl_icp
  "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/srv/get_object_pose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pcl_icp
)

### Generating Module File
_generate_module_lisp(pcl_icp
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pcl_icp
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(pcl_icp_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(pcl_icp_generate_messages pcl_icp_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/msg/nose_xyz_data.msg" NAME_WE)
add_dependencies(pcl_icp_generate_messages_lisp _pcl_icp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/msg/nose_pcxyz_data.msg" NAME_WE)
add_dependencies(pcl_icp_generate_messages_lisp _pcl_icp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/srv/get_object_pose.srv" NAME_WE)
add_dependencies(pcl_icp_generate_messages_lisp _pcl_icp_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pcl_icp_genlisp)
add_dependencies(pcl_icp_genlisp pcl_icp_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pcl_icp_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(pcl_icp
  "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/msg/nose_xyz_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pcl_icp
)
_generate_msg_nodejs(pcl_icp
  "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/msg/nose_pcxyz_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pcl_icp
)

### Generating Services
_generate_srv_nodejs(pcl_icp
  "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/srv/get_object_pose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pcl_icp
)

### Generating Module File
_generate_module_nodejs(pcl_icp
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pcl_icp
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(pcl_icp_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(pcl_icp_generate_messages pcl_icp_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/msg/nose_xyz_data.msg" NAME_WE)
add_dependencies(pcl_icp_generate_messages_nodejs _pcl_icp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/msg/nose_pcxyz_data.msg" NAME_WE)
add_dependencies(pcl_icp_generate_messages_nodejs _pcl_icp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/srv/get_object_pose.srv" NAME_WE)
add_dependencies(pcl_icp_generate_messages_nodejs _pcl_icp_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pcl_icp_gennodejs)
add_dependencies(pcl_icp_gennodejs pcl_icp_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pcl_icp_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(pcl_icp
  "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/msg/nose_xyz_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pcl_icp
)
_generate_msg_py(pcl_icp
  "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/msg/nose_pcxyz_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pcl_icp
)

### Generating Services
_generate_srv_py(pcl_icp
  "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/srv/get_object_pose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pcl_icp
)

### Generating Module File
_generate_module_py(pcl_icp
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pcl_icp
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(pcl_icp_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(pcl_icp_generate_messages pcl_icp_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/msg/nose_xyz_data.msg" NAME_WE)
add_dependencies(pcl_icp_generate_messages_py _pcl_icp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/msg/nose_pcxyz_data.msg" NAME_WE)
add_dependencies(pcl_icp_generate_messages_py _pcl_icp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/richtong888/nose_decect/catkin_ws/src/pcl_icp/srv/get_object_pose.srv" NAME_WE)
add_dependencies(pcl_icp_generate_messages_py _pcl_icp_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pcl_icp_genpy)
add_dependencies(pcl_icp_genpy pcl_icp_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pcl_icp_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pcl_icp)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pcl_icp
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(pcl_icp_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(pcl_icp_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET visualization_msgs_generate_messages_cpp)
  add_dependencies(pcl_icp_generate_messages_cpp visualization_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pcl_icp)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pcl_icp
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(pcl_icp_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(pcl_icp_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET visualization_msgs_generate_messages_eus)
  add_dependencies(pcl_icp_generate_messages_eus visualization_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pcl_icp)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pcl_icp
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(pcl_icp_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(pcl_icp_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET visualization_msgs_generate_messages_lisp)
  add_dependencies(pcl_icp_generate_messages_lisp visualization_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pcl_icp)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pcl_icp
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(pcl_icp_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(pcl_icp_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET visualization_msgs_generate_messages_nodejs)
  add_dependencies(pcl_icp_generate_messages_nodejs visualization_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pcl_icp)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pcl_icp\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pcl_icp
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(pcl_icp_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(pcl_icp_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET visualization_msgs_generate_messages_py)
  add_dependencies(pcl_icp_generate_messages_py visualization_msgs_generate_messages_py)
endif()
