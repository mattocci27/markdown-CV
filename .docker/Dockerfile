FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

ENV HOME=/home/app
WORKDIR $HOME

RUN apt-get update \
  && apt-get install -y \
    gosu \
    python3 \
    wget \
  && apt-get autoremove -y \
  && apt-get autoclean -y

RUN cd /tmp \
  && wget https://github.com/jgm/pandoc/releases/download/2.14.1/pandoc-2.14.1-1-amd64.deb \
  && dpkg -i pandoc-2.14.1-1-amd64.deb \
  && rm -rf /tmp/*

ENV APP_NAME=markdown-cv

WORKDIR $HOME/$APP_NAME

COPY scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
