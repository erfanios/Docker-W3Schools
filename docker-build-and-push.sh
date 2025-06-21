#!/usr/bin/env bash
# SCRIPT: docker-build-and-push.sh 
# AUTHOR: efn
# DATE: 2025-06-21T14:58:00
# REV: 1.0
# ARGUMENTS: [1: Username in docker hub ][2: name of the image in docker hub ][3:Optional: Numer for version nummber	][4:        ]
#
# PURPOSE: Builds the image and pushes it to docker hub 
#
 set -x # Uncomment to debug
# set -n # Uncomment to check script syntax without execution
# set -e # Break on the first failure
source config.sh || { echo "sourcing config failed" >&2; exit 1; }

user="${1:?'Please insert your docker hub username'}"
imagename="${2:?'Please insert name of your image'}"
tag="${user}/${imagename}"
today=$(date '+%F')
number="${3:-"$today"}"

# Next line is for keeping track of the version.
# cat version.txt | grep -q "$number" || { echo "First write the number in the version.txt file" >&2; exit 1; }
version="${tag}:${number}"

mkdir -p html

# docker build --no-cache -t $tag . || exit 1
docker build -t $tag . || exit 1
docker tag ${tag} ${version}

docker login

docker push ${version}
docker push ${tag}:latest
