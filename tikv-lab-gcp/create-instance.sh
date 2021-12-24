# Create Google Cloud Compute Instance

PROJECT=XXXXXXXX
ZONE=asia-east2-a
MACHINE_TYPE=e2-medium
SUBNET=subnet-asia-east2
SERVICE_ACCOUNT=xxxxxxxxxx-compute@developer.gserviceaccount.com

DEMO_INSTANCE_LABEL="tidb-demo"
BASTION_INSTANCE_LABEL="tidb-bastion"

# tidb-demo

gcloud compute instances create ${DEMO_INSTANCE_LABEL} \
 --project=${PROJECT} \
--zone=${ZONE} \
--machine-type=${MACHINE_TYPE} \
--network-interface=network-tier=PREMIUM,subnet=${SUBNET} \
--maintenance-policy=MIGRATE \
--service-account=${SERVICE_ACCOUNT} \
--scopes=https://www.googleapis.com/auth/cloud-platform \
--create-disk=auto-delete=yes,boot=yes,device-name=${DEMO_INSTANCE_LABEL},image=projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20211202,mode=rw,size=50,type=projects/${PROJECT}/zones/asia-east2-a/diskTypes/pd-balanced \
--labels="name=${DEMO_INSTANCE_LABEL}" \
--no-shielded-secure-boot \
--shielded-vtpm \
--shielded-integrity-monitoring \
--reservation-affinity=any

# tidb-bastion

gcloud compute instances create ${BASTION_INSTANCE_LABEL} \
 --project=${PROJECT} \
--zone=${ZONE} \
--machine-type=${MACHINE_TYPE} \
--network-interface=network-tier=PREMIUM,subnet=${SUBNET} \
--maintenance-policy=MIGRATE \
--service-account=${SERVICE_ACCOUNT} \
--scopes=https://www.googleapis.com/auth/cloud-platform \
--create-disk=auto-delete=yes,boot=yes,device-name=${BASTION_INSTANCE_LABEL},image=projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20211202,mode=rw,size=50,type=projects/${PROJECT}/zones/asia-east2-a/diskTypes/pd-balanced \
--labels="name=${BASTION_INSTANCE_LABEL}" \
--no-shielded-secure-boot \
--shielded-vtpm \
--shielded-integrity-monitoring \
--reservation-affinity=any
