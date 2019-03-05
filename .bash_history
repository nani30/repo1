gcloud container clusters get-credentials sampletest --zone us-central1-a --project balatest
kubectl get nodes
kubectl get pods
pwd
vi nginx-deploy.yaml
ansible --version
kubectl create -f nginx-deploy.yaml 
vi nginx-deploy.yaml 
kubectl create -f nginx-deploy.yaml 
vi nginx-deploy.yaml 
kubectl create -f nginx-deploy.yaml  --validate=false
kubectl apply -f https://k8s.io/examples/application/deployment.yaml
kubectl get  pods
ifconfig
curl http://localhost:80
kubectl get pods
kubectl describe pod nginx-deployment-75675f5897-m996j
curl http://10.36.2.8:80
curl http://localhost:80
ifconfig
curl http://172.18.0.1:80
curl http://172.17.0.5:80
gcloud config set compurte/zone us-central1-f
gcloud config set compute/zone us-central1-f
gcloud container clusters create spinnaker-tutorial \ --machine-type=n1-standard-2
gcloud help --search --machine
gcloud help search --machine
gcloud help search machine
gcloud compute machine-types list
gcloud container clusters create spinnaker-tutorial \ --machine-type=n1-standard-2
gcloud container clusters create spinnaker-tutorial --machine-type=n1-standard-1
gcloud iam service-accounts create  spinnaker-account     --display-name spinnaker-account
export SA_EMAIL=$(gcloud iam service-accounts list \
    --filter="displayName:spinnaker-account" \
    --format='value(email)')
export PROJECT=$(gcloud info --format='value(config.project)')
gcloud projects add-iam-policy-binding     $PROJECT --role roles/storage.admin --member serviceAccount:$SA_EMAIL
gcloud iam service-accounts keys create spinnaker-sa.json --iam-account $SA_EMAIL
gcloud beta pubsub topics create projects/$PROJECT/topics/gcr
gcloud beta pubsub subscriptions create gcr-triggers     --topic projects/${PROJECT}/topics/gcr
export SA_EMAIL=$(gcloud iam service-accounts list \
    --filter="displayName:spinnaker-account" \
    --format='value(email)')
gcloud beta pubsub subscriptions add-iam-policy-binding gcr-triggers     --role roles/pubsub.subscriber --member serviceAccount:$SA_EMAIL
wget https://storage.googleapis.com/kubernetes-helm/helm-v2.10.0-linux-amd64.tar.gz
tar zxfv helm-v2.10.0-linux-amd64.tar.gz
cp linux-amd64/helm .
kubectl create clusterrolebinding user-admin-binding --clusterrole=cluster-admin --user=$(gcloud config get-value account)
kubectl create serviceaccount tiller --namespace kube-system
kubectl create clusterrolebinding tiller-admin-binding --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
kubectl create clusterrolebinding --clusterrole=cluster-admin --serviceaccount=default:default spinnaker-admin
./helm init --service-account=tiller
./helm update
./helm version
export PROJECT=$(gcloud info \
    --format='value(config.project)')
export BUCKET=$PROJECT-spinnaker-config
gsutil mb -c regional -l us-central1 gs://$BUCKET
vi spinnaker-config.yaml
export SA_JSON=$(cat spinnaker-sa.json)
export PROJECT=$(gcloud info --format='value(config.project)')
export BUCKET=$PROJECT-spinnaker-config
cat > spinnaker-config.yaml <<EOF
gcs:
  enabled: true
  bucket: $BUCKET
  project: $PROJECT
  jsonKey: '$SA_JSON'

dockerRegistries:
- name: gcr
  address: https://gcr.io
  username: _json_key
  password: '$SA_JSON'
  email: 1234@5678.com

# Disable minio as the default storage backend
minio:
  enabled: false

# Configure Spinnaker to enable GCP services
halyard:
  spinnakerVersion: 1.10.2
  image:
    tag: 1.12.0
  additionalScripts:
    create: true
    data:
      enable_gcs_artifacts.sh: |-
        \$HAL_COMMAND config artifact gcs account add gcs-$PROJECT --json-path /opt/gcs/key.json
        \$HAL_COMMAND config artifact gcs enable
      enable_pubsub_triggers.sh: |-
        \$HAL_COMMAND config pubsub google enable
        \$HAL_COMMAND config pubsub google subscription add gcr-triggers           --subscription-name gcr-triggers           --json-path /opt/gcs/key.json           --project $PROJECT           --message-format GCR
EOF

./helm install -n cd stable/spinnaker -f spinnaker-config.yaml --timeout 600     --version 1.1.6 --wait
export DECK_POD=$(kubectl get pods --namespace default -l "cluster=spin-deck" \
    -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward --namespace default $DECK_POD 8080:9000 >> /dev/null &
kubectl port-forward --namespace default $DECK_POD 8080:9000 >> /dev/null 
export DECK_POD=$(kubectl get pods --namespace default -l "cluster=spin-deck" \
    -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward --namespace default $DECK_POD 8080:9000 >> /dev/null
kubectl get pods
kubectl port-forward --namespace default $DECK_POD 8080:9000 >> /dev/null &
docker images
docker --version
docker images
docker pull bala19/baseimage2
gcloud docker push bala19/baseimage2:latest
gcloud docker push bala19/baseimage2
docker login
gcloud docker push bala19/baseimage2
gcloud init
docker images
gcloud docker push bala19/baseimage2
docker tag bala19/baseimage2 gcr.io/233505/dssimage
gcloud docker push gcr.io/233505/dssimage
gcloud docker — pushgcr.io/233505/dssimage
gcloud docker — push gcr.io/233505/dssimage
gcloud docker   push gcr.io/233505/dssimage
docker   push gcr.io/233505/dssimage
docker push gcr.io/233505/dssimage
docker push gcr.io/kubernetes-233505/dssimage
docker images
docker tag bala19/baseimage2 gcr.io/kubernetes-233505/dssimage
docker push gcr.io/kubernetes-233505/dssimage
clear
gcloud componenets install kubectl
gcloud components install kubectl
gcloud config set project kubernetes-233505
gcloud config set compute/zone us-central1-b
git clone https://github.com/GoogleCloudPlatform/kubernetes-engine-samples
cd kubernetes-engine-samples/hello-app
export PROJECT_ID="$(gcloud config get-value project -q)"
clear
cd
clear
docker images
docker run --rm -p 12000:12000 gcr.io/kubernetes-233505/dssimage
clear
gcloud container clusters create dssimage --num-nodes=3
gcloud compute instances list
gcloud container cluster get-credentials dssimage
gcloud container cluster get-credentials 
gcloud container clusters get-credentials dssimage
kubectl get pods
kubectl run dssimage --image=gcr.io/kubernetes-233505/dssimage --port=12000
kubectl get pods
clear
kubectl get pods
kubectl expose deployment dssimage --type=LoadBalancer --port=12000 --target-port=12000
kubectl get services
curl http://35.188.118.155:12000
clear
vi main.go
vi cloudbuild.yaml
vi Dockerfile
git init
git add main.go cloudbuild.yaml Dockerfile 
git commit -m "First Build"
git config --global user.nani30 
git config --global user.nani30 "balajoji2009@gmail.com"
git commit -m "First Build"
git config --global user.email "balajoji2009@gmail.com"
git config --global user.name "nani30"
Omit --global
git commit -m "First Build"
git push origin master
git push origin repo1
git push origin nani30/repo1
git login
git status
git push origin 
git push --set-upstream origin master
git push --set-upstream repo1 master
git push
git push nani30
git push --set-upstream nani30 master
git remote add origin https://github.com/nani30/repo1.git
git  push origin master
git pull https://github.com/nani30/repo1.git
git status
git  push origin master
git pull https://github.com/nani30/repo1.git
git pull origin master --allow-unrelated-histories
git  push origin master
clear
gcloud compute ssh spinnaker-cd-dss --project kubernetes-233505 --zone us-central1-f --ssh-flag= "-L 8084:localhost:8084"
clear
gcloud compute ssh spinnaker-cd-dss --project kubernetes-233505 --zone us-central1-f --ssh-flag= "-L 8084:localhost:8084" --ssh-flag="-L 9000:localhost:9000"
gcloud compute ssh spinnaker-cd-dss --project kubernetes-233505 --zone us-central1-f --ssh-flag="-L 8084:localhost:8084" --ssh-flag="-L 9000:localhost:9000"
gcloud compute ssh spinnaker-cd-dssimage --project kubernetes-233505 --zone us-central1-f --ssh-flag="-L 8084:localhost:8084" --ssh-flag="-L 9000:localhost:9000"
clear
history
kubectl port-forward --namespace default $DECK_POD 8080:9000 >> /dev/null &
clear
./helm install -n cd stable/spinnaker -f spinnaker-config.yaml --timeout 600     --version 1.1.6 --wait
export DECK_POD=$(kubectl get pods --namespace default -l "cluster=spin-deck" \
        -o jsonpath="{.items[0].metadata.name}")
export DECK_POD=$(kubectl get pods --namespace default -l "cluster=spin-deck" -o jsonpath="{.items[0].metadata.name}")
clear
history
clear
history
clear
./helm init --service-account=tiller
./helm update
./helm version
./helm install -n cd stable/spinnaker -f spinnaker-config.yaml --timeout 600     --version 1.1.6 --wait
clear
export SA_JSON=$(cat spinnaker-sa.json)
export PROJECT=$(gcloud info --format='value(config.project)')
export BUCKET=$PROJECT-spinnaker-config
cat > spinnaker-config.yaml <<EOF
gcs:
  enabled: true
  bucket: $BUCKET
  project: $PROJECT
  jsonKey: '$SA_JSON'

dockerRegistries:
- name: gcr
  address: https://gcr.io
  username: _json_key
  password: '$SA_JSON'
  email: 1234@5678.com

# Disable minio as the default storage backend
minio:
  enabled: false

# Configure Spinnaker to enable GCP services
halyard:
  spinnakerVersion: 1.10.2
  image:
    tag: 1.12.0
  additionalScripts:
    create: true
    data:
      enable_gcs_artifacts.sh: |-
        \$HAL_COMMAND config artifact gcs account add gcs-$PROJECT --json-path /opt/gcs/key.json
        \$HAL_COMMAND config artifact gcs enable
      enable_pubsub_triggers.sh: |-
        \$HAL_COMMAND config pubsub google enable
        \$HAL_COMMAND config pubsub google subscription add gcr-triggers           --subscription-name gcr-triggers           --json-path /opt/gcs/key.json           --project $PROJECT           --message-format GCR
EOF

./helm install -n cd stable/spinnaker -f spinnaker-config.yaml --timeout 600     --version 1.1.6 --wait
cp linux-amd64/helm .
clear
kubectl create clusterrolebinding user-admin-binding --clusterrole=cluster-admin --user=$(gcloud config get-value account)
kubectl create serviceaccount tiller --namespace kube-system
kubectl create clusterrolebinding tiller-admin-binding --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
kubectl create clusterrolebinding --clusterrole=cluster-admin --serviceaccount=default:default spinnaker-admin
./helm init --service-account=tiller
./helm update
./helm version
clear
tar zxfv helm-v2.10.0-linux-amd64.tar.gz
cp linux-amd64/helm .
kubectl create clusterrolebinding user-admin-binding --clusterrole=cluster-admin --user=$(gcloud config get-value account)
kubectl create serviceaccount tiller --namespace kube-system
kubectl create clusterrolebinding tiller-admin-binding --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
./helm init --service-account=tiller
./helm update
./helm version
kubectl get deployments
kubectl delete deplloyments dssimage
kubectl delete deployments dssimage
kubectl get services
kubectl delete service dssimage
clear
kubectl get all
clear
gcloud config set compute/zone us-central1-f
kubectl get nodes
gcloud iam service-accounts create spinnaker-accout --display-name spinnaker-accoutn
gcloud iam service-accounts create spinnaker-accout --display-name spinnaker-account
clear
export SA_EMAIL=$(gcloud iam service-accounts list \
    --filter="displayName:spinnaker-account" \
    --format='value(email)')
export PROJECT=$(gcloud info --format='value(config.project)')
gcloud projects add-iam-policy-binding     $PROJECT --role roles/storage.admin --member serviceAccount:$SA_EMAIL
gcloud iam service-accounts keys create spinnaker-sa.json --iam-account $SA_EMAIL
gcloud beta pubsub topics create projects/$PROJECT/topics/gcr
export SA_EMAIL=$(gcloud iam service-accounts list \
    --filter="displayName:spinnaker-account" \
    --format='value(email)')
gcloud beta pubsub subscriptions add-iam-policy-binding gcr-triggers     --role roles/pubsub.subscriber --member serviceAccount:$SA_EMAIL
ls
cp linux-amd64/helm .
kubectl create clusterrolebinding user-admin-binding --clusterrole=cluster-admin --user=$(gcloud config get-value account)
kubectl create serviceaccount tiller --namespace kube-system
kubectl create clusterrolebinding tiller-admin-binding --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
kubectl create clusterrolebinding --clusterrole=cluster-admin --serviceaccount=default:default spinnaker-admin
./helm init --service-account=tiller
./helm update
./helm version
./helm install -n cd stable/spinnaker -f spinnaker-config.yaml --timeout 600     --version 1.1.6 --wait
export DECK_POD=$(kubectl get pods --namespace default -l "cluster=spin-deck" \
    -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward --namespace default $DECK_POD 8080:9000 >> /dev/null &
clear
wget https://gke-spinnaker.storage.googleapis.com/sample-app-v2.tgz
tar xzvf sample-app-v2.tgz 
clear
ls
cd sample-app/
ls
cat cloudbuild.yaml 
vi Jenkinsfile 
cd spinnaker/
ls
vi pipeline-deploy.json 
cd ..
clear
git config --global user.email "balajoji2009@gmail.com"
git config --global user.name "nani30"
git init
