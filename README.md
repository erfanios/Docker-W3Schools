# Docker W3Schools

This project provides scripts to **download W3Schools.com** locally into the `html/` directory using the `httrack` command.  
Afterward, a Docker image is built with this static content and pushed to Docker Hub.  
The idea is to update this image periodically (e.g., monthly), so you can always run W3Schools offline – ideal for traveling (e.g., on a train).

## How to Build Locally

If you prefer building the image yourself:

1. Download the website content:

       ./download-or-update.sh

2. Build and push the image:

       ./docker-build-and-push.sh <your-dockerhub-username> <image-name>

> You need to be logged in via `docker login`. If not, the script will prompt you.
