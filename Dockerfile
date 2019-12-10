FROM rust:1.39.0-slim-stretch AS builder

WORKDIR /app

COPY . .

RUN apt update && \
  apt install -y --no-install-recommends git pkg-config libssl-dev && \
  git clone https://github.com/paritytech/substrate-telemetry.git substrate-telemetry && \
  cd substrate-telemetry && \
  git checkout 0a89382127b9fb1b95d144cae816c46582975e93 && \
  cd backend && \
  cargo build --release

FROM slim-stretch

COPY --from=builder /app/target/release /telemetry /usr/local/bin

EXPOSE 1024
EXPOSE 8080

CMD ["/usr/local/bin/telemetry"]
