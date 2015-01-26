FROM debian:jessie
MAINTAINER EverydayHero "edh-dev@everydayhero.com.au"
RUN apt-get update && apt-get install -y \
  build-essential \
  git \
  python2.7 \
  python-pip \
  python-dev \
  libevent-dev \
  libzmq-dev \
  python-virtualenv \
  && rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/locustio/locust.git /opt/locust
RUN cd /opt/locust; python setup.py install
RUN pip install pyzmq

EXPOSE 8089

CMD ["/usr/local/bin/locust","-f","/locust-config/locustfile.py"]
