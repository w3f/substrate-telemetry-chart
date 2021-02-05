ARG SUBSTRATE_TELEMETRY_TAG=20-01-2021

FROM rust:1.44.1-slim-stretch AS builder

WORKDIR /app

COPY . .

RUN apt update && \
  apt install -y --no-install-recommends git pkg-config libssl-dev && \
  git clone https://github.com/paritytech/substrate-telemetry.git substrate-telemetry && \
  cd substrate-telemetry && \
  git checkout ${SUBSTRATE_TELEMETRY_TAG} && \
  cd backend && \
  cargo build --release

FROM nikolaik/python-nodejs:python3.7-nodejs13-stretch

WORKDIR /app

COPY . .

COPY --from=builder /app/substrate-telemetry/backend/target/release/telemetry /usr/local/bin

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -

RUN apt update && \
  apt install -y --no-install-recommends git && \
  git clone https://github.com/paritytech/substrate-telemetry.git substrate-telemetry && \
  cd substrate-telemetry && \
  git checkout  ${SUBSTRATE_TELEMETRY_TAG} && \
  cd frontend && \
  yarn && \
  yarn build && \
  yarn global add serve

EXPOSE 3000
EXPOSE 8000

CMD ["/usr/local/bin/telemetry"]
