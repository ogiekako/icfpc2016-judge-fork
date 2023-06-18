FROM ubuntu:xenial-20160503

WORKDIR /app

RUN apt-get update

# Install gflags
RUN apt-get install -y libgflags-dev

# Install glog
RUN apt-get install -y libgoogle-glog-dev

# Install gmp
RUN apt-get install -y \
    build-essential \
    m4 \
    wget \
    xz-utils

RUN (cd /tmp && \
    wget -O gmp.tar.xz https://gmplib.org/download/gmp/gmp-6.2.1.tar.xz && \
    echo "fd4829912cddd12f84181c3451cc752be224643e87fac497b69edddadc49b4f2 gmp.tar.xz" | sha256sum --check && \
    tar -xf gmp.tar.xz && \
    cd gmp-6.2.1 && \
    ./configure --enable-cxx && \
    make && make check && make install)

# Build akatsuki
COPY akatsuki /app/akatsuki-build

RUN apt-get install -y liblzma-dev libunwind-dev

# Provision hibiki
RUN (cd akatsuki-build && make && mv akatsuki /app/akatsuki)

COPY hibiki /app/hibiki

RUN apt-get install -y python virtualenv pkg-config libfontconfig1-dev python-dev

RUN (cd hibiki/app && make dev devpython)

ENV PYTHONPATH=/app/hibiki/app PATH=/app/hibiki/app/build/python/bin:$PATH

COPY inazuma tasks /app/
