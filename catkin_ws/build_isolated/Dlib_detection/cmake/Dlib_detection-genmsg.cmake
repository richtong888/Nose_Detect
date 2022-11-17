# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "Dlib_detection: 1 messages, 0 services")

set(MSG_I_FLAGS "-IDlib_detection:/home/richtong888/nose_decect/catkin_ws/src/Dlib_detection/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(Dlib_detection_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/richtong888/nose_decect/catkin_ws/src/Dlib_detection/msg/nose_xyz_data.msg" NAME_WE)
add_custom_target(_Dlib_detection_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "Dlib_detection" "/home/richtong888/nose_decect/catkin_ws/src/Dlib_detection/msg/nose_xyz_data.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(Dlib_detection
  "/home/richtong888/nose_decect/catkin_ws/src/Dlib_detection/msg/nose_xyz_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/Dlib_detection
)

### Generating Services

### Generating Module File
_generate_module_cpp(Dlib_detection
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/Dlib_detection
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(Dlib_detection_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(Dlib_detection_generate_messages Dlib_detection_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/richtong888/nose_decect/catkin_ws/src/Dlib_detection/msg/nose_xyz_data.msg" NAME_WE)
add_dependencies(Dlib_detection_generate_messages_cpp _Dlib_detection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(Dlib_detection_gencpp)
add_dependencies(Dlib_detection_gencpp Dlib_detection_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS Dlib_detection_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(Dlib_detection
  "/home/richtong888/nose_decect/catkin_ws/src/Dlib_detection/msg/nose_xyz_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/Dlib_detection
)

### Generating Services

### Generating Module File
_generate_module_eus(Dlib_detection
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/Dlib_detection
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(Dlib_detection_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(Dlib_detection_generate_messages Dlib_detection_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/richtong888/nose_decect/catkin_ws/src/Dlib_detection/msg/nose_xyz_data.msg" NAME_WE)
add_dependencies(Dlib_detection_generate_messages_eus _Dlib_detection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(Dlib_detection_geneus)
add_dependencies(Dlib_detection_geneus Dlib_detection_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS Dlib_detection_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(Dlib_detection
  "/home/richtong888/nose_decect/catkin_ws/src/Dlib_detection/msg/nose_xyz_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/Dlib_detection
)

### Generating Services

### Generating Module File
_generate_module_lisp(Dlib_detection
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/Dlib_detection
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(Dlib_detection_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(Dlib_detection_generate_messages Dlib_detection_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/richtong888/nose_decect/catkin_ws/src/Dlib_detection/msg/nose_xyz_data.msg" NAME_WE)
add_dependencies(Dlib_detection_generate_messages_lisp _Dlib_detection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(Dlib_detection_genlisp)
add_dependencies(Dlib_detection_genlisp Dlib_detection_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS Dlib_detection_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(Dlib_detection
  "/home/richtong888/nose_decect/catkin_ws/src/Dlib_detection/msg/nose_xyz_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/Dlib_detection
)

### Generating Services

### Generating Module File
_generate_module_nodejs(Dlib_detection
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/Dlib_detection
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(Dlib_detection_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(Dlib_detection_generate_messages Dlib_detection_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/richtong888/nose_decect/catkin_ws/src/Dlib_detection/msg/nose_xyz_data.msg" NAME_WE)
add_dependencies(Dlib_detection_generate_messages_nodejs _Dlib_detection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(Dlib_detection_gennodejs)
add_dependencies(Dlib_detection_gennodejs Dlib_detection_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS Dlib_detection_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(Dlib_detection
  "/home/richtong888/nose_decect/catkin_ws/src/Dlib_detection/msg/nose_xyz_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/Dlib_detection
)

### Generating Services

### Generating Module File
_generate_module_py(Dlib_detection
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/Dlib_detection
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(Dlib_detection_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(Dlib_detection_generate_messages Dlib_detection_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/richtong888/nose_decect/catkin_ws/src/Dlib_detection/msg/nose_xyz_data.msg" NAME_WE)
add_dependencies(Dlib_detection_generate_messages_py _Dlib_detection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(Dlib_detection_genpy)
add_dependencies(Dlib_detection_genpy Dlib_detection_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS Dlib_detection_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/Dlib_detection)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/Dlib_detection
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(Dlib_detection_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/Dlib_detection)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/Dlib_detection
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(Dlib_detection_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/Dlib_detection)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/Dlib_detection
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(Dlib_detection_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/Dlib_detection)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/Dlib_detection
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(Dlib_detection_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/Dlib_detection)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/Dlib_detection\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/Dlib_detection
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(Dlib_detection_generate_messages_py std_msgs_generate_messages_py)
endif()
