# Exec into the container
# docker run -it docker.io/library/backend:local /bin/sh

# Start the service
# make build
# docker run -d -p 5000:5000 docker.io/library/backend:local

# Use remote image
# make aws-registry-auth
# docker run -d -p 5000:5000 382942022480.dkr.ecr.us-east-1.amazonaws.com/backend-dev:cdffd61f132cc91fabdb2cc87b2ad865d2af722a
FROM python:3.8-slim-buster

WORKDIR /srv

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]