packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  ami_name      = "container-runtimes-containerd"
  instance_type = "t2.large"
  region        = "eu-central-1"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-bionic-18.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}

build {
  sources = ["source.amazon-ebs.ubuntu"]
  provisioner "shell" {    
    inline = [
      "sudo apt-get clean",
      "sudo apt-get update",
      "DEBIAN_FRONTEND=noninteractive sudo apt-get install -y apt-transport-https ca-certificates containerd tcpdump",
      "sudo mkdir -p /etc/containerd/",
      "containerd config default | sudo tee /etc/containerd/config.toml"
    ]  
  }
  provisioner "file" {
    source      = "analyze.sh"
    destination = "~/analyze.sh"
  }
}


