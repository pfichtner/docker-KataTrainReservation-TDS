FROM ubuntu:latest

MAINTAINER pfichtner "https://github.com/pfichtner"

RUN apt-get update && apt-get install -y \
  git \
  python3-cherrypy3

WORKDIR /opt/
RUN git clone -b master https://github.com/emilybache/KataTrainReservation.git
WORKDIR /opt/KataTrainReservation/train_data_service

# bind to 0.0.0.0 instead of 127.0.0.1
sed -i '/"server.socket_port"/a cherrypy.config.update({"server.socket_host" : "0.0.0.0"})' train_data_service_cherrypy.py

CMD ["python3", "start_service.py"]

