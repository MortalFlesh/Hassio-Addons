ARG BUILD_FROM="alpine"
ARG CONSOLE_VERSION="1.2.0"

FROM $BUILD_FROM

RUN apk update && apk add \
    bash \
    icu-libs \
    krb5-libs \
    libgcc \
    libintl \
    libssl1.1 \
    libstdc++ \
    zlib \
    ;

ADD https://github.com/MortalFlesh/home-console/releases/download/$CONSOLE_VERSION/alpine.3.16-arm64.tar.gz /app/

WORKDIR /app

RUN tar -xzf alpine.3.16-arm64.tar.gz \
    && rm alpine.3.16-arm64.tar.gz

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
