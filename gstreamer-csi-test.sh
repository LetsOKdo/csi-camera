#!/bin/bash

# Gstreamer CSI camera test on port CAM0
# Opens a new video window
# Use flip-method (2 or 4) to flip camera view
# Ctrl + C to close

gst-launch-1.0 nvarguscamerasrc sensor_id=0 ! \
'video/x-raw(memory:NVMM), \
width=3280, height=2464, framerate=21/1, format=NV12' ! \
nvvidconv flip-method=2 ! 'video/x-raw,  \
width=816, height=616' ! \
nvvidconv ! nvegltransform ! nveglglessink -e

