ARG BUILD_FROM="alpine:3.24"

FROM $BUILD_FROM

ENV CONSOLE_VERSION="1.19.3"

RUN apk --no-cache add \
    bash \
    icu-libs \
    krb5-libs \
    libgcc \
    libintl \
    libssl3 \
    libstdc++ \
    zlib \
    ;

ADD "https://github.com/MortalFlesh/home-console/releases/download/${CONSOLE_VERSION}/linux-musl-arm64.tar.gz" /app/

WORKDIR /app

RUN tar -xzf linux-musl-arm64.tar.gz \
    && rm linux-musl-arm64.tar.gz

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
    CMD wget -qO- http://localhost:28080/health || exit 1

CMD [ "/run.sh" ]
