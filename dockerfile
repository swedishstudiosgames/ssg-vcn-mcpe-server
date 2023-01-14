FROM ubuntu:22.04.1

RUN apt-get update && apt-get install -y \
    wget \
    nginx \
    openjdk-19-jre-headless \
    screen

RUN wget https://github.com/cloudflare/cloudflare-reverse-proxy/releases/download/v1.0.0/cloudflare-reverse-proxy_1.0.0_linux_amd64.tar.gz && \
    tar xvf cloudflare-reverse-proxy_1.0.0_linux_amd64.tar.gz && \
    mv cloudflare-reverse-proxy_1.0.0_linux_amd64/cloudflare-reverse-proxy /usr/local/bin/ && \
    rm -rf cloudflare-reverse-proxy_1.0.0_linux_amd64.tar.gz cloudflare-reverse-proxy_1.0.0_linux_amd64

RUN wget https://github.com/cloudflare/cloudflare-reverse-proxy/releases/download/v1.0.0/cloudflare-origin-server-certificate_1.0.0_linux_amd64.tar.gz && \
    tar xvf cloudflare-origin-server-certificate_1.0.0_linux_amd64.tar.gz && \
    mv cloudflare-origin-server-certificate_1.0.0_linux_amd64/cloudflare-origin-server-certificate /usr/local/bin/ && \
    rm -rf cloudflare-origin-server-certificate_1.0.0_linux_amd64.tar.gz cloudflare-origin-server-certificate_1.0.0_linux_amd64

RUN wget https://minecraft.azureedge.net/bin-linux/bedrock-server-1.16.100.02.zip && \
    unzip bedrock-server-1.16.100.02.zip && \
    rm -rf bedrock-server-1.16.100.02.zip

CMD ["screen", "-S", "minecraft-bedrock-server", "./bedrock_server"]
