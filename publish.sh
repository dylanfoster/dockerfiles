#!/bin/bash
set -e

NAMESPACE="dylanfoster"

IMAGES=(
  alpine
  nginx
  node
  postgres
  redis
)

if [[ "$@" ]]; then
  IMAGES=("$@")
fi

publish() {
  for image in ${IMAGES[*]}; do
    docker push "$NAMESPACE/$image"
  done
}

publish
