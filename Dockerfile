FROM php:7.2

MAINTAINER Martin Wagner <web@mawalabs.de>

ENV DEBIAN_FRONTEND noninteractive

COPY setup.sh /
RUN ./setup.sh
