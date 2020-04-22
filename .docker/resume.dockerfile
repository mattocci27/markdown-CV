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
#    context \
    fontconfig \
    fonts-font-awesome \
  && apt-get autoremove -y \
  && apt-get autoclean -y

RUN cd /tmp \
  && wget https://github.com/jgm/pandoc/releases/download/2.9.2/pandoc-2.9.2-1-amd64.deb \
  && dpkg -i pandoc-2.9.2-1-amd64.deb \
  && rm -rf /tmp/*

ENV APP_NAME=resume

RUN apt-get install -y rsync sudo
#RUN apt-get install -y context

RUN  mkdir /usr/local/context \
  && chown app:app /usr/local/context \
  && cd /usr/local/context \
  && wget http://minimals.contextgarden.net/setup/first-setup.sh \
  && sh ./first-setup.sh

#--engine=luatex --modules=all --fonts=all 

#RUN . /usr/local/context/tex/setuptex

#ENV OSFONTDIR=~/.fonts:/usr/share/fonts 
ENV TEXROOT=/usr/local/context/tex 
ENV PATH=/usr/local/context/tex/texmf-linux64/bin:/usr/local/context/bin:$PATH 
ENV OSFONTDIR=$HOME/.fonts:/usr/share/fonts:/usr/share/texmf/fonts/opentype/:/opt/libreoffice/basis3.3/share/fonts/

RUN which context
RUN which mtxrun

RUN cd /tmp \
  && mkdir /usr/share/fonts/truetype/marcellus \
  && mkdir /usr/share/fonts/truetype/cousine \
  && wget https://github.com/google/fonts/blob/master/ofl/marcellus/Marcellus-Regular.ttf -O /usr/share/fonts/truetype/marcellus/Marcellus-Regular.ttf\
  && wget https://github.com/google/fonts/blob/master/ofl/belleza/Belleza-Regular.ttf -O /usr/share/fonts/truetype/belleza/Belleza-Regular.ttf\
  && wget https://github.com/google/fonts/blob/master/apache/cousine/Cousine-Regular.ttf -O /usr/share/fonts/truetype/cousine/Cousine-Regular.ttf \
  && fc-cache -fv

#wget https://github.com/google/fonts/blob/master/ofl/raleway/Raleway-Regular.ttf -O /usr/share/fonts/truetype/raleway/Raleway-Regular.ttf

#RUN export OSFONTDIR=$HOME/.fonts:/usr/share/fonts:/usr/share/texmf/fonts/opentype/:/opt/libreoffice/basis3.3/share/fonts/


RUN mtxrun --script font --reload

RUN mtxrun --script fonts --list --all --pattern=ousine
RUN mtxrun --script fonts --list --all --pattern=arcel
RUN mtxrun --script fonts --list --all --pattern=new
RUN context --reload


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
