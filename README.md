# Fork
Forked from https://github.com/theprophetictimeline/Bible-Gematria-Interlinear-Explorer. Uses gunicorn instead of uwsgi+nginx.

# Running this as a docker container
0. Ignore the files in this repo except docker-compose.yml. The purpose of this repo is to build the container.
1. Use the docker-compose.yml as a starting point to run the container on your host.
2. for reference, image is hosted at ghcr.io/jpiscaer/bible-gematria-app:latest. This docker image was created using the Dockerfile on this repo

# Building this docker container
1. git clone https://github.com/jpiscaer/Bible-Gematria-Interlinear-Explorer-docker/
2. cd Bible-Gematria-Interlinear-Explorer-docker/
3. unzip Complete.zip
4. docker build -t bible-gematria-app .
