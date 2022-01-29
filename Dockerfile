FROM amazonlinux:2

RUN curl --silent --location https://rpm.nodesource.com/setup_14.x | bash -
RUN yum -y install nodejs
RUN yum -y install openssh-server openssh-clients
RUN yum -y install \
    make \
    wget \
    tar \
    gcc \
    gcc-c++ \
    openssl-devel \
    bzip2-devel \
    libffi-devel
RUN cd /tmp && wget https://www.python.org/ftp/python/3.9.6/Python-3.9.6.tgz && \
    tar xzf Python-3.9.6.tgz && \
    cd Python-3.9.6 && \
    ./configure --enable-optimizations && \
    make install && \
    rm -rf /tmp
RUN python -m ensurepip --upgrade && \
    pip install awscli boto3
RUN npm install -g npm@latest && rm -rf /tmp
RUN npm install -g yarn && rm -rf /tmp

WORKDIR /workspace