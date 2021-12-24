# Delete Demo Instances
gcloud compute instances delete ${DEMO_INSTANCE_LABEL} \
  --zone=${ZONE} --quiet
  
gcloud compute instances delete ${BASTION_INSTANCE_LABEL} \
  --zone=${ZONE} --quiet
