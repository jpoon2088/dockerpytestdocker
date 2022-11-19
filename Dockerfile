FROM python:3.9.15-slim

RUN apt-get -y update 
RUN apt-get -y install vim
RUN pip3 install docker
WORKDIR /stuff

CMD tail -f /dev/null
