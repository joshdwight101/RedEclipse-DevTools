FROM ubuntu:24.04 AS builder

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ca-certificates git make g++ curl libsdl2-mixer-2.0-0 libsdl2-image-2.0-0 libsdl2-2.0-0 libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build
RUN git clone --recurse-submodules https://github.com/redeclipse/base.git redeclipse
WORKDIR /build/redeclipse
RUN make -C src install -j"$(nproc)"

FROM ubuntu:24.04
RUN useradd -m -u 10001 redeclipse && mkdir -p /usr/lib/games/redeclipse /dev/shm/redeclipse && chown -R redeclipse:redeclipse /usr/lib/games/redeclipse /dev/shm/redeclipse
COPY --from=builder /build/redeclipse /usr/lib/games/redeclipse
COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
USER redeclipse
WORKDIR /usr/lib/games/redeclipse
ENTRYPOINT ["/entrypoint.sh"]
