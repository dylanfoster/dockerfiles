#!/bin/bash
set -e

DIR=$( cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd)

#######################################################################
# automated build script
#
# usage:
#   ./build.sh
#   ./build.sh node postgres
########################################################################

NAMESPACE="dylanfoster"

IMAGES=(
  alpine
  nginx
  node
  postgres
  redis
)

if [[ -z "$@" ]]; then
  IMAGES="$@"
fi

nope() {
  echo -e "\033[1;31m$@\033[0m";
}

maybe() {
  echo -e "\033[1;32m$@\033[0m";
}

woot() {
  echo -e "\033[1;32m$@\033[0m";
}

foam() {
  echo -e "\n\033[1m$@\033[0m";
}

build_all() {
  for image in ${IMAGES[*]}; do
    build_images $image
  done
}

build_images() {
  local tags=$(find_tags $image)

  if [[ -z "$tags" ]]; then
    nope "No tags were found for image: $image"
    exit 1
  fi

  for tag in $tags; do
    foam "Building image $image"

    build_image $image $tag
  done

  tag_image $image $tags

  woot "successfully build image $image:$tag"
}

build_image() {
  if [[ ! -f "$DIR/$1/$2/Dockerfile" ]]; then
    nope "No Dockefile for image: $1:$2"
    exit 1
  fi

  set +e
  docker pull "$NAMESPACE/$1:$2" 2> /dev/null
  set -e

  docker build -t "$NAMESPACE/$1:$2" "$DIR/$1/$2"
}

find_tags() {
  ls "$DIR/$1"
}

tag_image() {
  local latest_tag=$(get_latest_tag "$tags")
  docker tag -f "$NAMESPACE/$1:$latest_tag" "$NAMESPACE/$1:latest"
}

get_latest_tag() {
  echo $1 | awk '{print $NF}'
}

build_all
