FROM python:3.6

EXPOSE 8080

WORKDIR /app

# TODO - run this inside venv
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY *.py .
COPY pypodinfo.ini .
COPY static/ static/
COPY templates/ templates/

CMD [ "uwsgi", "--ini", "pypodinfo.ini" ]
