FROM minidocks/context:lmtx-with-fonts

RUN apk update && apk add fontconfig ttf-font-awesome

RUN cd /tmp \
  && wget https://github.com/jpswalsh/academicons/archive/refs/tags/v1.9.1.tar.gz \
  && tar -xvzf v1.9.1.tar.gz \
  && rm v1.9.1.tar.gz \
  && cp /tmp/academicons-1.9.1/fonts/academicons.ttf /usr/share/fonts

ENV OSFONTDIR=$HOME/.fonts:/usr/share/fonts:/usr/share/tex/texmf/fonts

RUN mkdir -p /usr/share/fonts/truetype/cousine \
  && mkdir -p /usr/share/fonts/truetype/Noto-sans \
  && wget http://fonts.gstatic.com/s/cousine/v10/GYX4bPXObJNJo63QJEUnLg.ttf \
    -O /usr/share/fonts/truetype/cousine/Cousine-Regular.ttf \
  && wget http://fonts.gstatic.com/s/notosans/v6/0Ue9FiUJwVhi4NGfHJS5uA.ttf \
    -O /usr/share/fonts/truetype/Noto-sans/NotoSans-Regular.ttf \
  && wget http://fonts.gstatic.com/s/notosans/v6/dLcNKMgJ1H5RVoZFraDz0qCWcynf_cDxXwCLxiixG1c.ttf \
    -O /usr/share/fonts/truetype/Noto-sans/NotoSans-Italic.ttf \
  && wget http://fonts.gstatic.com/s/notosans/v6/PIbvSEyHEdL91QLOQRnZ1y3USBnSvpkopQaUR-2r7iU.ttf \
    -O /usr/share/fonts/truetype/Noto-sans/NotoSans-Bold.ttf \
  && wget http://fonts.gstatic.com/s/notosans/v6/9Z3uUWMRR7crzm1TjRicDne1Pd76Vl7zRpE7NLJQ7XU.ttf \
    -O /usr/share/fonts/truetype/Noto-sans/NotoSans-BoldItalic.ttf \
  && fc-cache -fv

RUN mtxrun --generate \
 && mtxrun --script fonts --reload \
 && mtxrun --script fonts --list -pattern="cousine*" --all \
 && mtxrun --script fonts --list -pattern="academicons*" --all \
 && mtxrun --script fonts --list -pattern="noto*" --all
