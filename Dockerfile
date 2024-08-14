# syntax=docker/dockerfile:1
FROM python:3.10.5-alpine

RUN adduser -D myuser
USER myuser
WORKDIR /home/myuser/code

ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

RUN apk add --update gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000
COPY . .

CMD ["flask", "run", "-h", "0.0.0.0", "-p", "5000", "--debug"]
