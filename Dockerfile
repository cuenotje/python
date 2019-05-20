FROM python:3-alpine

# Configure working directory.
RUN pip --no-cache-dir install yaml && mkdir -p /cip
WORKDIR /cip
