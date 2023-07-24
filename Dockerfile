FROM node:18 as builder

RUN apt-get update && apt-get install -y ca-certificates wget unzip jq \
    && wget https://github.com/GuntharDeNiro/BTCT/releases/download/hny/gunthy_linux.zip \
    && unzip gunthy_linux.zip
    
FROM node:18

RUN mkdir -p /gunbot

RUN npm install pm2@latest -g

VOLUME ["/gunbot"]

COPY --from=builder /gunthy_linux /gunbot

WORKDIR "/gunbot"

EXPOSE 5000

CMD ["pm2-runtime", "gunthy-linux"]
