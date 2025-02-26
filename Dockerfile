FROM python:3-slim
MAINTAINER Duo Labs https://duo.com/labs

RUN mkdir /app
RUN mkdir /data
COPY flask_demo /app/flask_demo/
RUN chmod 777 /app/flask_demo/record.log
COPY webauthn /app/webauthn/
RUN pip install -r /app/flask_demo/requirements.txt
RUN touch /data/webauthn.db
RUN touch /app/flask_demo/webauthn.db
RUN chmod 777 /data/webauthn.db
RUN chown 1015030000 /data/webauthn.db
RUN chmod 777 /app/flask_demo
RUN chmod 777 /app/flask_demo/webauthn.db
RUN chown 1015030000 /app/flask_demo/webauthn.db
RUN chown 1015030000 /data/webauthn.db
RUN python /app/flask_demo/create_db.py
RUN chown 1015030000 /data
RUN chown 1015030000 /app/flask_demo
CMD ["python", "/app/flask_demo/app.py"]
