#!/bin/sh

DOCKER_NETWORK=`docker network ls |grep gitlab_net |awk '{print $2}'`

docker-compose exec runner gitlab-runner register \
  --non-interactive \
  --name "default runner" \
  --url "http://gitlab/" \
  --registration-token "$1" \
  --clone-url "http://gitlab" \
  --executor docker \
  --docker-image "docker:stable" \
  --docker-network-mode "${DOCKER_NETWORK}" \
  --docker-pull-policy "if-not-present"
