#syntax=docker/dockerfile:1.6.0

FROM --platform=amd64 ubuntu:22.04

RUN <<EOF
apt update
apt install -yq wget curl ca-certificates git
EOF

# install gosh binaries
RUN wget -O - https://raw.githubusercontent.com/gosh-sh/gosh/dev/install.sh | bash -s

ENV PATH=$PATH:$HOME/.gosh
