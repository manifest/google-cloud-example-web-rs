# Google Cloud Example - Web Application

Example of web application written in Rust.



### How to use

There are three ways applcation could be executed:

1. On the localhost:

```bash
$ cargo run
$ curl -fsSL http://localhost:8080
```

2. Within Docker container on the localhost:

```bash
$ ./docker/run.sh
$ curl -fsSL http://$(docker-machine ip):8080
```

3. On Google Cloud using Container Engine:

```bash
## Create Docker container called 'manifesthub/google-cloud-example-web'
## and upload it to Container Registry
docker build -t manifesthub/google-cloud-example-web -f ./docker/Dockerfile .
docker tag manifesthub/google-cloud-example-web gcr.io/example-project/google-cloud-example-web
gcloud docker -- push gcr.io/example-project/google-cloud-example-web

## Create cluster, deployment, expose application to load balancer
gcloud container clusters create example-cluster
gcloud container clusters get-credentials example-cluster
kubectl run example-app --image=gcr.io/example-project/google-cloud-example-web --port=8080
kubectl expose deployment example-app --type="LoadBalancer"

## Get external ip addess
kubectl get service example-app
curl -fsSL http://${EXTERNAL-IP}:8080

## Clean up
kubectl delete deploy/example-app
kubectl delete service/example-app
gcloud container clusters delete example-cluster
```


### License

The source code is provided under the terms of [the MIT license][license].

[license]:http://www.opensource.org/licenses/MIT
