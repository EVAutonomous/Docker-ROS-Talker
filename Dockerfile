# syntax=docker/dockerfile:1
#
#Every docker file starts from a base image instead of an empty machine. This is a pre-built image that is maintained by OpenRobotics that contains all the tools we want. The base image publishes for both computer architecures (amd64 and arm64) under one tag.
FROM ros:humble-ros-base

#This prevents interactive prompts from popping up that usually do when apt-get install is run. Without this, the build could wait forever for some kind of keypress that may never occour
ENV DEBIAN_FRONTEND=noninteractive

#There is a reason the RUN keyword is only mentioned once - each new RUN line creates a new image layer. Using && keeps everything here as one layer
#There is a final line where rm is used. This removes some package indexing files that we don't need anymore
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-humble-demo-nodes-cpp \
    ros-humble-demo-nodes-py \
    && rm -rf /var/lib/apt/lists/*

# Auto-source ROS in any terminal opened inside the desktop session; this is needed to set environment variables in ROS. Anytime you have a ROS error in terminal, ensure you have done the proper sourcing when you first opened the terminal.
RUN echo "source /opt/ros/humble/setup.bash" >> /root/.bashrc

#sets the defautlt working directory for the ROS2 workspace
WORKDIR /root/ros2_ws

# Keep the container running so teammates can `docker exec` into it
# from multiple terminals at once (one for talker, one for listener).
CMD ["sleep", "infinity"]
