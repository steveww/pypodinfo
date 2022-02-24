FROM python:3.6

EXPOSE 8080

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY *.py .
COPY pypodinfo.ini .

CMD [ "uwsgi", "--ini", "pypodinfo.ini" ]
