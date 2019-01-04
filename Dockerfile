FROM alpine:3.8

ARG LANG='en_US.UTF-8'

LABEL maintainer="Bobby Grayson, bobbyis.me" \
    decription="Phish gifs, friend" \
    org.label-schema.name="phishme" \
    org.label-schema.vcs-url="https://github.com/notactuallypagemcconnell/phishme"


RUN set -xe; \
    addgroup -g 1000 -S phishme; \
    adduser -u 1000 -S -h /phishme -s /bin/sh -G phishme phishme;

COPY . /phishme

RUN set -xe; \
    apk --update add --no-cache --virtual .runtime-deps \
        bash \
        ca-certificates \
        curl \
        ffmpeg \
        git \
        gmp-dev \
        jpeg \
        libressl \
        make \
        py3-pip \
        python3 \
        tar \
        tzdata \
        yaml \
        xz \
        zlib \
        alpine-sdk \
        jpeg-dev \
        python3-dev \
        zlib-dev; \
    pip3 install --upgrade pip; \
    pip3 install gif-for-cli; \
    curl -SL "https://media.giphy.com/media/dLswRvqOSDfEI/giphy.gif" > /phishme/phish.gif; \
    chown -R phishme:phishme /phishme;

RUN gif-for-cli --display-mode truecolor -l 30 /phishme/phish.gif & \
    reset; \
    wait;

COPY --chown=phishme:phishme ./docker-assets /

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

RUN set -xe; \
