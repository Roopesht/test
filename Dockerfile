FROM ubuntu:latest
MAINTAINER roopesht "roopesh@arthasangraha.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y python3.8 python3-pip \
  && apt-get install -y apache2 build-essential libapache2-mod-wsgi-py3 \
  && apt-get install -y  nano\
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3.8 python \
  && pip3 --no-cache-dir install --upgrade pip \
  && rm -rf /var/lib/apt/lists/*


apt-get install --no-install-recommends -y \
        apache2 \
        apache2-dev \
        build-essential \ 
        libapache2-mod-wsgi-py3 \
        python3-dev \
        python3-pip \
        python3-setuptools\
    && apt-get clean \ 
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* \
    && pip3 install --upgrade pip

ONBUILD EXPOSE 80 443

RUN pip install -r /setup/requirements.txt a2enmod ssl a2dissite 000-default.conf
a2enmod ssl 
a2dissite 000-default.conf

cmd ("mkdir",  "/app")
ADD app.py /app/
ADD uwsgi.ini /app/

ONBUILD CMD ["/usr/sbin/apache2ctl","-DFOREGROUND"]

ENTRYPOINT ["sh", "-c", "echo $port && python /app/app.py" ]

#CMD [ "python", "/app/app.py" ]

