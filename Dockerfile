FROM python:3-alpine

# add yaml, ansible python module and SSH package.
RUN set -xe \
    && apk add --no-cache --purge -u sudo curl ca-certificates openssh-client openssl \
    && apk --update add --virtual .build-dependencies python-dev libffi-dev openssl-dev build-base \
    && pip install --no-cache --upgrade pyyaml ansible \
    && apk del --purge .build-dependencies \
    && mkdir -p /etc/ansible \
    && mkdir -p /cip \
    && echo 'localhost' > /etc/ansible/hosts \
    && rm -rf /var/cache/apk/* /tmp/*

WORKDIR /cip
