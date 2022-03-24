FROM ubuntu:20.04

COPY ./ .
RUN sh install_elk.sh
ENTRYPOINT ["tail", "-f", "/dev/null"]
