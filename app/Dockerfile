FROM python:3.10

ARG VERSION
ENV VERSION=${VERSION:-latest}

EXPOSE 8080

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY *.py .
COPY pypodinfo.ini .
COPY static/ static/
COPY templates/ templates/

CMD [ "uwsgi", "--ini", "pypodinfo.ini" ]
