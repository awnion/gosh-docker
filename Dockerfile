#syntax=docker/dockerfile:1.6.0

ARG GOSH_VERSION=6.1.35

FROM --platform=amd64 ubuntu:22.04

RUN <<EOF
apt update
apt install -yq wget curl ca-certificates git
EOF

# Git will not complain about unsafe directories
# For all users and all repositories
RUN git config --system --add safe.directory '*'

ENV TAG=${GOSH_VERSION}
ENV PATH=$PATH:/root/.gosh

# install gosh binaries
RUN wget -O - https://raw.githubusercontent.com/gosh-sh/gosh/dev/install.sh | TAG=6.1.35 bash -s


WORKDIR /workdir
