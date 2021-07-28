FROM ubuntu

# prepare a user which runs everything locally! - required in child images!
RUN useradd --user-group --create-home --shell /bin/false app
#useradd --user-group --shell /bin/false app

ENV HOME=/home/app
WORKDIR $HOME

RUN apt-get update \
  && apt-get install -y \
    build-essential \
    wget \
    context \
    fontconfig \
    fonts-font-awesome \
  && apt-get autoremove -y \
  && apt-get autoclean -y

RUN cd /tmp \
  && wget https://github.com/jgm/pandoc/releases/download/2.9.2/pandoc-2.9.2-1-amd64.deb \
  && dpkg -i pandoc-2.9.2-1-amd64.deb \
  && rm -rf /tmp/*

ENV APP_NAME=resume

RUN cd /tmp \
  && mkdir /usr/share/fonts/truetype/raleway \
  && mkdir /usr/share/fonts/truetype/cousine \
  && wget https://github.com/google/fonts/blob/master/ofl/raleway/Raleway-Regular.ttf -O /usr/share/fonts/truetype/raleway/Raleway-Regular.ttf\
  && wget https://github.com/google/fonts/blob/master/apache/cousine/Cousine-Regular.ttf -O /usr/share/fonts/truetype/cousine/Cousine-Regular.ttf \
  && fc-cache -fv \
  && mtxrun --script fonts --reload \
  && mtxrun --script fonts --list pattern="Raleway*" --all  \
  && mtxrun --script fonts --list pattern="Cousine*" --all  \
  && context --reload


RUN ls -la /usr/share/fonts/truetype
# before switching to user we need to set permission properly
# copy all files, except the ignored files from .dockerignore
COPY . $HOME/$APP_NAME/
#COPY ./.docker/Makefile $HOME/$APP_NAME/
RUN chown -R app:app $HOME/*

#RUN chown -R app:app /usr/share/fonts/*

USER app
WORKDIR $HOME/$APP_NAME

RUN context --reload

RUN make clean
