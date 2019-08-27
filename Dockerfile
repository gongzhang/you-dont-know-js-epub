FROM ubuntu:16.04
COPY sources.list /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y fonts-dejavu-core git pandoc unzip zip

WORKDIR /root
RUN git clone --single-branch --branch 2nd-ed https://github.com/getify/You-Dont-Know-JS.git

RUN apt-get install -y wget
RUN apt-get install -y python3

WORKDIR /root/You-Dont-Know-JS
COPY epub.css ./
COPY gen.sh ./
RUN chmod +x gen.sh
RUN ./gen.sh

RUN mkdir dist && mv *.epub dist

WORKDIR /root/You-Dont-Know-JS/dist

EXPOSE 80
CMD python3 -m http.server 80
