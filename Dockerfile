FROM python:3-alpine

# add yaml, ansible python module and SSH package.
RUN set -xe \
    && apk add --no-cache --purge -u sudo curl ca-certificates openssh-client openssl git \
    && apk --update add --virtual .build-dependencies python-dev libffi-dev openssl-dev build-base \
    && pip install --no-cache --upgrade xmltodict pyyaml ansible ara docker-py \
    && apk del --purge .build-dependencies \
    && mkdir -p /etc/ansible \
    && mkdir -p /cip \
    && echo 'localhost' > /etc/ansible/hosts \
    && rm -rf /var/cache/apk/* /tmp/*

ENV ARA_API_CLIENT=http
ENV ARA_API_SERVER="http://localhost:8000"
ENV ARA_API_TIMEOUT=15
ENV ARA_IGNORED_FACTS='["ansible_env", "ansible_all_ipv4_addresses"]'
ENV ARA_IGNORED_ARGUMENTS='["extra_vars", "vault_password_files"]'
ENV ANSIBLE_ACTION_PLUGINS=/usr/local/lib/python3.8/site-packages/ara/plugins/action
ENV ANSIBLE_CALLBACK_PLUGINS=/usr/local/lib/python3.8/site-packages/ara/plugins/callback

WORKDIR /cip
