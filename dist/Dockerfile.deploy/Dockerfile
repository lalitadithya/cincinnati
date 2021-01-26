FROM rust:1.49 AS builder

WORKDIR /usr/src/cincinnati
COPY . .

RUN cargo build --release

FROM debian:buster-slim

RUN apt-get update && apt-get install -y libssl-dev openssl ca-certificates && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/src/cincinnati/target/release/graph-builder /usr/local/bin/graph-builder
COPY --from=builder /usr/src/cincinnati/target/release/policy-engine /usr/local/bin/policy-engine
COPY dist/Dockerfile.deploy/start_services.sh /root/start_services.sh

CMD [ "./root/start_services.sh" ]
