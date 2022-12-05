FROM ubuntu:22.04

WORKDIR /tmp/builder/
COPY requirements.txt .
RUN apt-get update

RUN apt-get install -y locales locales-all
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8


RUN apt-get install -y python3 python3-pip

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --no-cache-dir  -r requirements.txt



ENTRYPOINT ["./entrypoint.sh"]