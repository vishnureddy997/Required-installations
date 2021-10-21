FROM ubuntu:latest

MAINTAINER "vishnu"

RUN apt-get update

RUN apt install nginx -y

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
