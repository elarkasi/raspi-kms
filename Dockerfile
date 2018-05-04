FROM resin/rpi-raspbian:latest
MAINTAINER alexliu4u <alexliu4u@hotmail.com>

RUN apt-get update \
    && apt-get install git -y \
    && cd /var/local \
    && git clone https://github.com/alexliu4u/vlmcsd.git \
    && cd /var/log \
    && mkdir vlmcsd \
    && chmod 777 /var/local/vlmcsd/binaries/Linux/arm/little-endian/glibc/vlmcsd-armv6hf-Raspberry-glibc \
    && apt-get clean

VOLUME ["/var/log/vlmcsd"]

EXPOSE 1688

ENTRYPOINT ["/var/local/vlmcsd/binaries/Linux/arm/little-endian/glibc/vlmcsd-armv6hf-Raspberry-glibc"]
CMD ["-l","/var/log/vlmcsd/run.log"]
