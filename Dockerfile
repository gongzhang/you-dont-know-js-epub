FROM ubuntu:16.04 AS builder
COPY sources.list /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -y fonts-dejavu-core git pandoc unzip zip wget && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /root
RUN git clone --single-branch --branch 2nd-ed https://github.com/getify/You-Dont-Know-JS.git

WORKDIR /root/You-Dont-Know-JS
COPY epub.css ./
COPY gen.sh ./
RUN chmod +x gen.sh && ./gen.sh

FROM python:3-alpine
WORKDIR /root/epub
COPY --from=builder /root/You-Dont-Know-JS/*.epub /root/epub/
EXPOSE 80
CMD python3 -m http.server 80
