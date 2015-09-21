FROM node:0.12.4 
MAINTAINER Troy Topnik <troyt@activestate.com> 

RUN apt-get update \
  && apt-get install -y git vim curl unzip \
  && npm install tty.js \
  && useradd -d /home/dev -m -s /bin/bash dev \
  && echo 'dev:stackato' | chpasswd

COPY bin/* /usr/local/bin/
COPY .tty.js /home/dev/.tty.js
COPY .bashrc /home/dev/.bashrc 
RUN chown -R dev:dev /home/dev/ 
USER dev
ENV PATH /node_modules/tty.js/bin:$PATH

EXPOSE 8080 

CMD ["/node_modules/tty.js/bin/tty.js"]
