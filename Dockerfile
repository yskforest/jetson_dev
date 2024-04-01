FROM nvcr.io/nvidia/l4t-jetpack:r35.4.1

ARG UID=1000
ARG USER=developer
RUN useradd -m -u ${UID} ${USER}
ENV DEBIAN_FRONTEND=noninteractive \
    HOME=/home/${USER}
WORKDIR ${HOME}

# https://docs.nvidia.com/deeplearning/frameworks/install-pytorch-jetson-platform/index.html

RUN apt-get update && apt-get install -y \
    git wget curl build-essential \
    python3-dev python3-pip \
    libopenblas-dev libatlas-base-dev
    # && apt-get clean && rm -rf /var/lib/apt/lists/*

# USER ${USER}
COPY requirements.txt ./requirements.txt
RUN python3 -m pip install --upgrade pip \
    && python3 -m pip install -r requirements.txt

# RUN echo 'export PATH=:$PATH' >> .bashrc
CMD ["/bin/bash"]
