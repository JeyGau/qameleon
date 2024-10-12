FROM mcr.microsoft.com/devcontainers/cpp:1-ubuntu-22.04

ARG REINSTALL_CMAKE_VERSION_FROM_SOURCE="3.22.2"

# Optionally install the cmake for vcpkg
COPY ./reinstall-cmake.sh /tmp/

RUN if [ "${REINSTALL_CMAKE_VERSION_FROM_SOURCE}" != "none" ]; then \
        chmod +x /tmp/reinstall-cmake.sh && /tmp/reinstall-cmake.sh ${REINSTALL_CMAKE_VERSION_FROM_SOURCE}; \
    fi \
    && rm -f /tmp/reinstall-cmake.sh

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    automake \
    build-essential \
    clang \
    debianutils \
    g++ \
    libgl1-mesa-dev \
    libopencv-dev \
    libqt5quickcontrols2-5 \
    libxcb-xinerama0 \
    python3 \
    python3-dev \
    python3-pip \
    python3-tk \
    python3-venv \
    qtbase5-dev \
    qtdeclarative5-dev \
    qtquickcontrols2-5-dev \
    qml-module-qtquick-controls \
    qml-module-qtquick-controls2 \
    qml-module-qtquick-dialogs \
    qml-module-qtquick-layouts \
    qml-module-qtquick-window2 \
    qttools5-dev \
    qttools5-dev-tools \
    unzip \
    wget \
    x11-apps \
    xz-utils \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
