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
ADD https://github.com/getify/You-Dont-Know-JS/blob/1st-ed/async%20&%20performance/cover.jpg?raw=true async-performance/cover.jpg
ADD https://github.com/getify/You-Dont-Know-JS/blob/1st-ed/es6%20&%20beyond/cover.jpg?raw=true        es-next-beyond/cover.jpg
ADD https://github.com/getify/You-Dont-Know-JS/blob/1st-ed/scope%20&%20closures/cover.jpg?raw=true    scope-closures/cover.jpg
ADD https://github.com/getify/You-Dont-Know-JS/blob/1st-ed/this%20&%20object%20prototypes/cover.jpg?raw=true  this-object-prototypes/cover.jpg
ADD https://github.com/getify/You-Dont-Know-JS/blob/1st-ed/types%20&%20grammar/cover.jpg?raw=true     types-grammar/cover.jpg
ADD https://github.com/getify/You-Dont-Know-JS/blob/1st-ed/up%20&%20going/cover.jpg?raw=true          getting-started/cover.jpg
RUN chmod +x gen.sh && ./gen.sh

FROM python:3-alpine
WORKDIR /root/epub
COPY --from=builder /root/You-Dont-Know-JS/*.epub /root/epub/
EXPOSE 80
CMD python3 -m http.server 80
