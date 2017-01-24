FROM node:6
MAINTAINER Troy Topnik <troy.topnik@hpe.com> 

RUN apt-get update \
  && apt-get install -y git vim curl unzip jq ruby ruby-dev \
  && npm install tty.js \
  && gem install cf-uaac \
  && useradd -d /home/dev -m -s /bin/bash dev \
  && echo 'dev:helion' | chpasswd

COPY bin/* /usr/local/bin/
COPY .tty.js /home/dev/.tty.js
COPY .bashrc /home/dev/.bashrc 
RUN chown -R dev:dev /home/dev/ 
USER dev
ENV PATH /node_modules/tty.js/bin:$PATH

EXPOSE 8080 

CMD ["/node_modules/tty.js/bin/tty.js"]
