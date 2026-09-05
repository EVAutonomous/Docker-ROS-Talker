# syntax=docker/dockerfile:1
#
# Minimal ROS2 Humble image for the talker/listener demo.
# No Gazebo, no desktop, no VNC -- just ROS2 core + the demo nodes.
#
# ros:humble-ros-base is genuinely multi-arch (amd64 + arm64), so this
# builds and runs natively on both Apple Silicon Macs and Windows/Intel
# machines -- no emulation, no platform-specific gaps like the ones
# Gazebo currently has on arm64.

FROM ros:humble-ros-base

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-humble-demo-nodes-cpp \
    ros-humble-demo-nodes-py \
    && rm -rf /var/lib/apt/lists/*

# Auto-source ROS in any terminal opened inside the container
RUN echo "source /opt/ros/humble/setup.bash" >> /root/.bashrc

WORKDIR /root/ros2_ws

# Keep the container running so teammates can `docker exec` into it
# from multiple terminals at once (one for talker, one for listener).
CMD ["sleep", "infinity"]
