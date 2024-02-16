FROM python

# Ubuntu Install Dependency (Packages Outside PyPi Repository)
#RUN apt-get update
#RUN apt-get install -y python3-dev default-libmysqlclient-dev libreoffice

ARG PROJECT=kc
ARG PROJECT_DIR=/shared/kc/

WORKDIR $PROJECT_DIR

COPY requirements.txt .

ADD . $PROJECT_DIR

RUN pip3 install --no-cache-dir --upgrade -r requirements.txt

ADD . $PROJECT_DIR

# Django App
ENTRYPOINT [ "python3", "manage.py" ]
CMD [ "runserver", "0.0.0.0:8000" ]

# Flask App
# ENTRYPOINT [ "python3", "flask_app.py"]

# FAST API APP
# CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

# Python File
# CMD [ "python3", "test.py" ]
