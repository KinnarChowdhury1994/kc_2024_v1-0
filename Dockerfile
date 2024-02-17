FROM python

# Ubuntu Install Dependency (Packages Outside PyPi Repository)
#RUN apt-get update
#RUN apt-get install -y python3-dev default-libmysqlclient-dev libreoffice

# AWS CLI Implementation
# RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
# RUN apt install unzip
# RUN unzip awscliv2.zip
# RUN ./aws/install

# RUN aws configure set aws_access_key_id <access_key>
# RUN aws configure set aws_secret_access_key <secret_key>
# RUN aws configure set default.region <region>


ARG PROJECT=project_kc
ARG PROJECT_DIR=/shared/kc/

WORKDIR $PROJECT_DIR

COPY requirements.txt .

ADD . $PROJECT_DIR

RUN pip3 install --no-cache-dir --upgrade -r requirements.txt

ADD . $PROJECT_DIR

# Django App
ENTRYPOINT [ "python3", "manage.py" ]
# CMD [ "makemigrations" ]
# CMD [ "migrate"]
HEALTHCHECK CMD curl --fail http://localhost:8000|| exit 1
CMD [ "runserver", "0.0.0.0:8000" ]

# Flask App
# ENTRYPOINT [ "python3", "flask_app.py"]

# FAST API APP
# CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

# Python File
# CMD [ "python3", "test.py" ]
