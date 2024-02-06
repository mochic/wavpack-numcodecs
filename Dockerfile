FROM centos:7.9.2009

RUN yum -y update && \
    yum -y install python3 && \
    yum clean all

COPY . ./build

RUN yum -y install wavpack
RUN yum -y install python3-devel
RUN yum -y install gcc
RUN yum -y install wavpack-devel

RUN pip3 install setuptools wheel

RUN cd ./build && python3 setup.py bdist_wheel

# COPY ./build/dist/wavpack_numcodecs-0.1.5-cp36-cp36m-linux_aarch64.whl wavpack_numcodecs-0.1.5-cp36-cp36m-linux_aarch64.whl