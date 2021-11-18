# Analysis of [cri-o](https://landscape.cncf.io/card-mode?category=container-runtime&grouping=category&selected=cri-o)

## Packer part

Follow the instructions to create an AWS AMI with containerd

1. Install HashiCorp Packer: https://learn.hashicorp.com/tutorials/packer/get-started-install-cli
2. Init packer with AWS provider: `packer init .`   
3. Export AWS access key: `export AWS_ACCESS_KEY_ID=<YOUR_ACCESS_KEY>` and export AWS secret: `export AWS_SECRET_ACCESS_KEY=<YOUR_SECRET_KEY>`
4. Validate packer file: `packer validate .`
5. Build AWS AMI `image.pkr.hcl`: `packer build --force image.pkr.hcl`


## Analysis

