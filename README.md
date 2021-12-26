# Runnable Samples for Learning TiDB
+ Notes:
  + No containers required for this version.
  + Samples in this project are not designed for `playground`, they are real `clusters` but consume minimal resources.

## Preparation steps for the "cloud guys"
+ AWS or GCP accounts at hands.
+ Labs:
   1. `general-lab` requires one instance.
   2. `tidb-lab` requires one instance.
   3. `tikv-lab-aws` and `tikv-lab-gcp` require two instances.
    + In case of AWS, tag them with key `Name`, set value to `bastion` and `demo` respectively.
    + In case of GCP, nodes naming scripts are provided.
+ `ssh` into (any) VM by using `-A` option (for simple handling the `-i` and `-u` options with `tiup` tool).
+ Make sure current user has passwordless `sudo` permission (Cloud providers should already did this for you).

## general-lab folder
### Concept
+ `general-lab` will deploy an all-in-one cluster on single EC2 instance.
+ No replication for any components.
### Manual Preparation
+ N/A
### How to Run
+ Simple setup scripts: `00`, `01`, `02`
+ Start/Stop scripts: `03`, `04`
+ Simple check: `check-cluster.sh`
+ Simple connection for MySQL interface: `connect.sh`
+ Tier down **caution**: `destroy-all.sh`

## tidb-lab folder
### Concept
+ `tikv-lab` will deploy an all-in-one cluster on single EC2 instance.
+ 2 tidb servers will be deployed.
### Manual Preparation
+ N/A
### How to Run
+ Simple setup scripts: `00`, `01`, `02`
+ Start/Stop scripts: `03`, `04`
+ Simple check: `check-cluster.sh`
+ Simple connection for MySQL interface: `connect-4000.sh` or `connect-4001.sh`
+ Tier down **caution**: `destroy-all.sh`

## tikv-lab-aws folder
### Concept
+ Scripts in this folder are designed for AWS
+ `tikv-lab` will deploy a hybrid cluster across two EC2 instances.
+ 3 tikv servers will be deployed.
### Manual Preparation
+ Spin up two EC2 instances, tag:Name them with `bastion` and `demo` respectively.
+ Assign read EC2 service role to above EC2 instances.
+ Smooth the network traffics between them.
### How to Run
+ Simple setup scripts: `00`, `01`, `02`
+ Start/Stop scripts: `03`, `04`
+ Simple check: `check-cluster.sh`
+ Simple connection to TiDB instances with MySQL interface: `connect-demo.sh` and `connect-bastion.sh`
+ Tier down **caution**: `destroy-all.sh`

## tikv-lab-gcp folder
### Concept
+ Scripts in this folder are designed for GCP.
+ `tikv-lab` will deploy a hybrid cluster across two VMs.
+ 3 tikv servers will be deployed.
### Manual Preparation
+ Put required account related information into `create-instance.sh`, then run `create-instance.sh`.
+ Smooth the network traffics between them.
### How to Run
+ Simple setup scripts: `00`, `01`, `02`
+ Start/Stop scripts: `03`, `04`
+ Simple check: `check-cluster.sh`
+ Simple connection to TiDB instances with MySQL interface: `connect-demo.sh` and `connect-bastion.sh`
+ Tier down **caution**: `destroy-all.sh`
