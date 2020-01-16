FROM python:2.7-alpine

# add yaml, ansible python module and SSH package.
RUN set -xe \
    && apk add --no-cache --purge -u sudo curl ca-certificates openssh-client openssl git zip \
    && apk --update add --virtual .build-dependencies python-dev libffi-dev openssl-dev build-base \
    && pip install --no-cache --upgrade setuptools pip wheel virtualenv xmltodict pyyaml jinja2  \
    && apk del --purge .build-dependencies \
    && mkdir -p /cip \
    && rm -rf /var/cache/apk/* /tmp/*

WORKDIR /cip
