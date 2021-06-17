FROM python:3-slim
MAINTAINER Duo Labs https://duo.com/labs

RUN mkdir /app
COPY flask_demo /app/flask_demo/
RUN chmod 777 /app/flask_demo/record.log
COPY webauthn /app/webauthn/
RUN chmod -R 777 /app
RUN pip install -r /app/flask_demo/requirements.txt
RUN python /app/flask_demo/create_db.py

CMD ["python", "/app/flask_demo/app.py"]
