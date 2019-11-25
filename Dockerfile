FROM node:10.16-alpine

WORKDIR /app

RUN apk update && apk add --no-cache \
  python \
  g++ \
  make \
  openssh \
  git

RUN export PYTHONPATH=${PYTHONPATH}:/usr/lib/python2.7

RUN git clone https://github.com/paritytech/substrate-telemetry.git . && \
  git checkout 31784131d607c6b009e2d7abcf1ed94b04830916

RUN yarn && \
  yarn build:all

EXPOSE 1024
EXPOSE 8080

CMD ["yarn", "start:backend"]
