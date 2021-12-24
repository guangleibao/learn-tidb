#!/bin/bash

# Install
sudo apt update -y
sudo apt install ntp mysql-client -y
sudo systemctl restart ntp

# Install Google Cloud SDK
sudo apt-get install apt-transport-https ca-certificates gnupg -y
sudo rm /etc/apt/sources.list.d/google-cloud-sdk.list
echo "deb https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-get update && sudo apt-get install google-cloud-sdk -y

# Setup Instance Labels
DEMO_INSTANCE_LABEL="tidb-demo"
BASTION_INSTANCE_LABEL="tidb-bastion"

# Get Current Zone From Metadata of Instance
# ZONE=`curl -H "Metadata-Flavor: Google" "http://metadata.google.internal/computeMetadata/v1/instance/zone"`
# ZONE_CODE=${ZONE##*/}

# Get Current Zone by gcloud
ZONE_CODE=`gcloud compute instances list \
  --filter="labels.name=${DEMO_INSTANCE_LABEL} AND status=RUNNING" \
  --format="table[csv,no-heading](zone)"`

echo export ZONE_CODE=${ZONE_CODE} > ./cloud-env.sh

# Setup Demo Host Info
HOST_DEMO_PRIVATE_IP=`gcloud compute instances list \
  --filter="labels.name=${DEMO_INSTANCE_LABEL} AND status=RUNNING" \
  --format='get(networkInterfaces[0].networkIP)' \
  --zones=$ZONE_CODE`

echo export HOST_DEMO_PRIVATE_IP=${HOST_DEMO_PRIVATE_IP} > ./host-demo-env.sh
echo ssh -A ${HOST_DEMO_PRIVATE_IP} > ./ssh-to-demo.sh

# Setup Bastion Host Info
HOST_BASTION_PRIVATE_IP=`gcloud compute instances list \
  --filter="labels.name=${BASTION_INSTANCE_LABEL} AND status=RUNNING" \
  --format='get(networkInterfaces[0].networkIP)' \
  --zones=$ZONE_CODE`

echo export HOST_BASTION_PRIVATE_IP=${HOST_BASTION_PRIVATE_IP} > ./host-bastion-env.sh
echo ssh -A ${HOST_BASTION_PRIVATE_IP} > ./ssh-to-bastion.sh

# Setup hybrid.yaml
cp ./hybrid-template.yaml ./hybrid.yaml
sed -i '' -e "s/<HOST_BASTION_PRIVATE_IP>/${HOST_BASTION_PRIVATE_IP}/g" ./hybrid.yaml 2>/dev/null
sed -i '' -e "s/<HOST_DEMO_PRIVATE_IP>/${HOST_DEMO_PRIVATE_IP}/g" ./hybrid.yaml 2>/dev/null
echo hybrid.yaml for cluster prepared

# Conslusion
chmod +x ./*.sh
