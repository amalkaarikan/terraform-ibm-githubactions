terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "~> 1.55.0"
    }
  }

  required_version = ">= 1.3.0"
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.region
}

resource "random_id" "suffix" {
  byte_length = 3
}

resource "ibm_resource_group" "rg_demo" {
  name = "${var.resource_group_name}-${random_id.suffix.hex}"
}

resource "ibm_resource_instance" "cos_instance" {
  name              = "demo-cos-instance"
  service           = "cloud-object-storage"
  plan              = "standard"
  location          = "global"
  resource_group_id = ibm_resource_group.rg_demo.id
}

output "cos_instance_id" {
  value = ibm_resource_instance.cos_instance.id
}
