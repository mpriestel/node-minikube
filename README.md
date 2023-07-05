# node-minikube

This is a simple node.js application developed under this [repository](https://github.com/sohamkamani/node-express-mongo-example/tree/master). Application is adapted to accept environment variables from configMap for connections strings. Later on, the application is deployed using github actions on local minikube cluster and tested.

Build Status: [![node-minikube-deploy](https://github.com/mpriestel/node-minikube/actions/workflows/ci.yaml/badge.svg?branch=main)](https://github.com/mpriestel/node-minikube/actions/workflows/ci.yaml)

## Requirements

- Nodejs
- Mongo
- Docker
- Minikube for local deployment
- Helm
- kubectl

## Local setup
- The local setup is simplified with a script. Just run:

```sh
./local_deploy.sh
```

In details, The scipt does the following:
- Starts minikube
- Builds the docker image with Dockerfile using ```docker build -t node-app .```
- Installs the helm chart

If kubernetes is not requred, docker image can also be ran on docker desktop using:

```docker run -p 8080:3000 -itd node-app```

## Helm chart deployment

Steps for deploying the helm chart on already running kubernets cluster are:
- Build the docker image using: ``` docker build -t node-app .```
- Navigate to ```node-app/``` folder
- Update ```environment/local/values.yaml``` with prefered values.
- Install the helm chart using: ```helm upgrade node-app charts/ --wait --install --values environments/local/values.yaml```

## Github actions

Workflow for github actions is configured in a manner that on each push on main branch the deploy is executed. There is only one job ```deploy``` which is running on ubuntu:latest with the following steps:
- actions/checkout@v2
- Install minikube using the script: `bash install_minikube.sh`
- Deploys to minikube cluster and sends requests to the app in order to create items and later on list them.