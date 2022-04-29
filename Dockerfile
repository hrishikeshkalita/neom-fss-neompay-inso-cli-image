# FROM alpine
FROM ubuntu
USER root
RUN apt-get update -y && apt-get install -y wget && apt-get install xz-utils
RUN wget https://github.com/Kong/insomnia/releases/download/lib%402.8.0/inso-linux-2.8.0.tar.xz
RUN tar xf $(ls | grep inso-linux*) -C /bin --no-same-owner && rm -r $(ls | grep inso-linux*)
RUN export PATH=$PATH:/bin/inso
RUN echo $PATH && inso --version
CMD tail -f /dev/null