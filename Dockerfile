# Exec into the container
# docker run -it docker.io/library/backend:local /bin/sh

# Start the service
# docker run -d -p 5000:5000 docker.io/library/backend:local

FROM 382942022480.dkr.ecr.us-east-1.amazonaws.com/frontend-dev:0fe990bf5b32e22de71ce151355612216ea6b17f as frontend

FROM python:3.8-slim-buster

WORKDIR /srv
COPY --from=frontend /srv/build /frontend/build/.

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]