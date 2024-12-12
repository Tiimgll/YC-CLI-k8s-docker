FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y curl unzip wget zip bash git jq && \
    curl -sSL https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash && \
    mv /root/yandex-cloud/bin/yc /usr/local/bin/ && \
    rm -rf /root/yandex-cloud

RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

COPY authorized_key.json /root/.config/yandex-cloud/authorized_key.json

WORKDIR /app

CMD ["bash"]