FROM quay.io/fedora/fedora:latest

RUN dnf update -y && \
    dnf install git procps-ng caddy -y && \
    dnf clean all

RUN cd /tmp && \
    curl -LO https://github.com/gohugoio/hugo/releases/download/v0.104.2/hugo_0.104.2_linux-amd64.tar.gz && \
    tar xvf hugo_0.104.2_linux-amd64.tar.gz && \
    mv hugo /usr/local/bin/ && \
    rm -f hugo_0.104.2_linux-amd64.tar.gz README.md LICENSE

RUN git clone https://github.com/dharmit/sampleSite /opt/samplesite && \
    cd /opt/samplesite && \
    hugo --gc --minify

WORKDIR "/opt/samplesite"
