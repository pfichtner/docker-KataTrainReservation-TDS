FROM python:3.3.6-alpine

MAINTAINER pfichtner "https://github.com/pfichtner"

RUN apk update 
RUN apk add git
RUN pip install cherrypy

WORKDIR /opt/
RUN git clone -b master https://github.com/emilybache/KataTrainReservation.git
WORKDIR /opt/KataTrainReservation/train_data_service

# bind to 0.0.0.0 instead of 127.0.0.1
RUN sed -i '/"server.socket_port"/i \\    cherrypy.config.update({"server.socket_host" : "0.0.0.0"})' train_data_service_cherrypy.py

CMD ["python3", "start_service.py"]

