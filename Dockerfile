ARG COMMIT=525f95b92a376f071c12e18a625d0dedaa6ea49d

FROM rust:1.44.1-slim-stretch AS builder

WORKDIR /app

COPY . .

RUN apt update && \
  apt install -y --no-install-recommends git pkg-config libssl-dev && \
  git clone https://github.com/paritytech/substrate-telemetry.git substrate-telemetry && \
  cd substrate-telemetry && \
  git checkout $COMMIT && \
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
  git checkout $COMMIT && \
  yarn && yarn build:all

EXPOSE 3000
EXPOSE 8000

CMD ["/usr/local/bin/telemetry"]
