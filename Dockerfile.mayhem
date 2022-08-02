FROM --platform=linux/amd64 ubuntu:20.04 as builder

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y automake pkg-config libtool build-essential

ADD . /shc
WORKDIR /shc

RUN ./configure
RUN make

RUN mkdir -p /deps
RUN ldd /shc/src/shc | tr -s '[:blank:]' '\n' | grep '^/' | xargs -I % sh -c 'cp % /deps;'

FROM ubuntu:20.04 as package

COPY --from=builder /deps /deps
COPY --from=builder /shc/src/shc /shc/src/shc
ENV LD_LIBRARY_PATH=/deps
