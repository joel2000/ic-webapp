FROM python:3.6-alpine
MAINTAINER jkouassi (kouassi.joel052@gmail.com)
RUN groupadd -r jojo -g 436 && useradd -u 435 -r -g jojo -s /sbin/nologin -c "utlisateur dockerfile" jojo
WORKDIR /opt
RUN pip install flask==1.1.2
RUN apk add python3
RUN apk add git
EXPOSE 8080
ENV ODOO_URL https://www.odoo.com/
ENV PGADMIN_URL https://www.pgadmin.org/ 
RUN rm -rf /opt/ic-webapp/*
RUN git clone https://github.com/sadofrazer/ic-webapp.git /opt/
ENTRYPOINT ["python3", "/opt/app.py"]
USER jojo
