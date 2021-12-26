[![forthebadge](https://forthebadge.com/images/badges/cc-0.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/made-with-javascript.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/uses-css.svg)](https://forthebadge.com)

# docker_lamp: projet demo docker image LAMP

Projet docker: 
- Création d'un docker image LAMP tuto https://devopssec.fr/article/creer-ses-propres-images-docker-dockerfile

## Technologies
- Docker

## Contribute to the project

docker_lamp is an open source project.

## Authors

Gilles Muganza

## Licensing

Open source licence.

## Instructions
- Construction de l'image:
docker build -t <IMAGE_NAME> .
- Execution de l'image:
docker run -d --name <IMAGE_NAME> -p 8080:80 <IMAGE_NAME>

