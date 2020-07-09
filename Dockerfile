FROM rust:1.44.1-slim-stretch AS builder

WORKDIR /app

COPY . .

RUN apt update && \
  apt install -y --no-install-recommends git pkg-config libssl-dev && \
  git clone https://github.com/paritytech/substrate-telemetry.git substrate-telemetry && \
  cd substrate-telemetry && \
  git checkout 26c1c6d61809bab0ba0e21381da5310fbdc9cf34 && \
  cd backend && \
  cargo build --release

FROM nikolaik/python-nodejs:python3.7-nodejs13-stretch

WORKDIR /app

COPY . .

COPY --from=builder /app/substrate-telemetry/backend/target/release/telemetry /usr/local/bin

RUN apt update && \
  apt install -y --no-install-recommends git && \
  git clone https://github.com/paritytech/substrate-telemetry.git substrate-telemetry && \
  cd substrate-telemetry && \
  git checkout 0a89382127b9fb1b95d144cae816c46582975e93 && \
  yarn && yarn build:all

EXPOSE 1024
EXPOSE 8080

CMD ["/usr/local/bin/telemetry"]
