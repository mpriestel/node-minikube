#!/bin/bash

# Script for deploying node app on a local minikube cluster
# Requirements: minikube, helm, Docker, kubectl
# Make sure not to run the script as root

minikube start #--kubernetes-version=1.24.3
minikube addons enable registry
eval $(minikube docker-env)
docker build -t node-app:latest .
helm version
helm repo add bitnami https://charts.bitnami.com/bitnami && helm install mongodb bitnami/mongodb --wait --set auth.username=node,auth.password=node123,auth.database=store
echo "Installing node-app chart"
helm install node-app node-app/ --values node-app/values.yaml
sleep 30
kubectl get pods