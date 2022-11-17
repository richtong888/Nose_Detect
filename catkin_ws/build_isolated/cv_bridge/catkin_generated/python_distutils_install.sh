#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/richtong888/nose_decect/catkin_ws/src/vision_opencv/cv_bridge"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/richtong888/nose_decect/catkin_ws/install_isolated/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/richtong888/nose_decect/catkin_ws/install_isolated/lib/python2.7/dist-packages:/home/richtong888/nose_decect/catkin_ws/build_isolated/cv_bridge/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/richtong888/nose_decect/catkin_ws/build_isolated/cv_bridge" \
    "/usr/bin/python2" \
    "/home/richtong888/nose_decect/catkin_ws/src/vision_opencv/cv_bridge/setup.py" \
     \
    build --build-base "/home/richtong888/nose_decect/catkin_ws/build_isolated/cv_bridge" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/richtong888/nose_decect/catkin_ws/install_isolated" --install-scripts="/home/richtong888/nose_decect/catkin_ws/install_isolated/bin"
