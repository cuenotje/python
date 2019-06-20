FROM python:3-alpine

# add yaml, ansible python module and SSH package.
RUN set -xe \
    && apk add --no-cache --purge -u sudo curl ca-certificates openssh-client openssl \
    && pip install --no-cache --upgrade pyyaml ansible \
    && mkdir -p /etc/ansible \
    && mkdir -p /cip \
    && echo 'localhost' > /etc/ansible/hosts \
    && rm -rf /var/cache/apk/* /tmp/*

WORKDIR /cip
