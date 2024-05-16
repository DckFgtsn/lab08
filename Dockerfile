FROM ubuntu:22.04


RUN apt update
RUN apt install -yy gcc g++ cmake git

COPY . print/
WORKDIR print

RUN git submodule update --init --recursive
RUN cmake -H. -B_build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_install
RUN cmake --build _build
RUN cmake --build _build --target install

ENV LOG_PATH /home/logs/log.txt

VOLUME /home/logs

WORKDIR _install/bin

ENTRYPOINT ./example2
