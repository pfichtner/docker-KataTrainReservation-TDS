FROM ubuntu:latest

MAINTAINER pfichtner "https://github.com/pfichtner"

RUN RUN apt-get update && apt-get install -y \
  git \
  python3-cherrypy3

WORKDIR /opt/
RUN git clone -b master https://github.com/emilybache/KataTrainReservation.git
WORKDIR /opt/KataTrainReservation/train_data_service

CMD ["python3", "start_service.py"]

