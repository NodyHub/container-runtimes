# Analysis of [containerd](https://landscape.cncf.io/card-mode?category=container-runtime&grouping=category&selected=containerd)

## Packer part

Follow the instructions to create an AWS AMI with containerd

1. Install HashiCorp Packer: https://learn.hashicorp.com/tutorials/packer/get-started-install-cli
2. Init packer with AWS provider: `packer init .`   
3. Export AWS access key: `export AWS_ACCESS_KEY_ID=<YOUR_ACCESS_KEY>` and export AWS secret: `export AWS_SECRET_ACCESS_KEY=<YOUR_SECRET_KEY>`
4. Validate packer file: `packer validate .`
5. Build AWS AMI `image.pkr.hcl`: `packer build --force image.pkr.hcl`


## Analysis

* `containerd` does not configure a default registry to pull images.
* The configuration can be added in the `config.toml`of the daemon.
* Even if the documentation states that the default registry is docker.io,  i t is necessary to pass the full resorce link to the start command `ctr image pull docker.io/library/alpine:latest`
