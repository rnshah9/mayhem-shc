# Build Stage
FROM --platform=linux/amd64 ubuntu:20.04 as builder
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install  -y vim less man wget tar git gzip unzip make cmake software-properties-common curl


ADD . /shc
WORKDIR /shc

RUN ./configure
RUN make

# FROM --platform=linux/amd64 ubuntu:22.04

# COPY --from=builder /chibicc/chibicc
