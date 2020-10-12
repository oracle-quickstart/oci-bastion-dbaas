// Copyright (c) 2019, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

terraform {
  required_version = ">= 0.12.0"

  backend "local" {
    path = "./state/terraform.tfstate"
  }
}

locals {
  availability_domain = lookup(data.oci_identity_availability_domains.ADs.availability_domains[0], "name")
  image_id = data.oci_core_images.oraclelinux.images.0.id
}

#############################################
### primary region resource provisioning ####
#############################################
module network {
  source = "./modules/network"

  providers = {
      oci.destination    = "oci"
  }

  tenancy_ocid           = var.tenancy_ocid
  compartment_id         = var.compartment_ocid
  vcn_name               = var.vcn_dns_label
  dns_label              = var.vcn_dns_label
  vcn_cidr_block         = var.vcn_cidr_block
  freeform_tags          = var.freeform_tags
  defined_tags           = var.defined_tags
}

module bastion_instance {
  source = "./modules/bastion_instance"

  providers = {
      oci.destination = "oci"
  }
  
  compartment_id      = var.compartment_ocid
  source_id           = local.image_id
  subnet_id           = module.network.dr_access_subnet_id
  availability_domain = local.availability_domain
  ping_all_id         = module.network.dr_ping_all_id
  shape               = var.bastion_server_shape

  ssh_public_key_file  = var.ssh_public_key_file
  ssh_private_key_file = var.ssh_private_key_file

  freeform_tags          = var.freeform_tags
  defined_tags           = var.defined_tags
}

module database {
  source = "./modules/dbaas"

  providers = {
      oci.destination    = "oci"
  }

  compartment_id      = var.compartment_ocid
  subnet_id           = module.network.dr_db_subnet_id
  availability_domain = local.availability_domain
  display_name        = var.db_system_display_name
  db_name             = var.db_name
  ping_all_id         = module.network.dr_ping_all_id
  ssh_public_keys     = file(var.ssh_public_key_file)
  db_system_shape     = var.db_system_shape
  db_admin_password   = var.db_admin_password
}