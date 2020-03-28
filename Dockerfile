FROM pandoc/core:2.9.2
RUN apk add --update --no-cache ttf-dejavu

WORKDIR /root
COPY . .

RUN chmod +x gen.sh

EXPOSE 80
ENTRYPOINT []
CMD ./gen.sh
