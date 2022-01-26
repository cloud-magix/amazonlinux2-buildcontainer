FROM amazonlinux:2

RUN curl --silent --location https://rpm.nodesource.com/setup_14.x | bash -
RUN yum -y install nodejs
RUN yum -y install openssh-server openssh-clients
RUN yum -y install \
    make \
    wget \
    tar \
    gcc \
    openssl-devel \
    bzip2-devel \
    libffi-devel
RUN cd /tmp && wget https://www.python.org/ftp/python/3.9.6/Python-3.9.6.tgz && \
    tar xzf Python-3.9.6.tgz && \
    cd Python-3.9.6 && \
    ./configure --enable-optimizations && \
    make install
RUN cd /usr/bin && ln -sf /usr/local/bin/python3 python
RUN python -m ensurepip --upgrade && \
    cd /usr/bin && ln -sf /usr/local/bin/pip3 pip && \
    pip install awscli boto3
RUN npm install -g npm@latest
RUN npm install -g yarn

WORKDIR /workspace