FROM ubuntu:20.04

WORKDIR /ffserver

RUN apt update && \
    apt install -y build-essential wget yasm && \
    wget -O - https://ffmpeg.org/releases/ffmpeg-3.4.12.tar.gz | tar -xz --strip-components=1 && \
    ./configure && \
    make && \
    make install && \
    apt purge -y build-essential wget yasm && \
    apt -y autoremove

EXPOSE 8090

CMD ["ffserver"]

