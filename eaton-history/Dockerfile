ARG BUILD_FROM="alpine:3.19"

FROM $BUILD_FROM

ENV CONSOLE_VERSION "1.15.0"

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

CMD [ "/run.sh" ]
