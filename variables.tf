// Copyright (c) 2019, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

# OCI Provider variables
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}

# Deployment variables
variable "compartment_ocid" {
  type        = string
  description = "ocid of the compartment to deploy the bastion host in"
}

variable "freeform_tags" {
  type        = map
  description = "map of freeform tags to apply to all resources"
  default     = {
    "Environment" =  "dr"
  }
}

variable "defined_tags" {
  type        = map
  description = "map of defined tags to apply to all resources"
  default     = {}
}

variable "vcn_cidr_block" {
  type        = string
  description = "dr vcn cidr block"
  default     = "192.168.0.0/16"
}

variable "vcn_dns_label" {
    description = "DNS label for Virtual Cloud Network (VCN)"
    default = "drvcn"
}


variable "ssh_public_key_file" {
  type        = string
  description = "path to public ssh key for all instances deployed in the environment"
}

variable "ssh_private_key_file" {
  type        = string
  description = "path to private ssh key to acccess all instance in the deployed environment"
} 

variable bastion_server_shape {
  type        = string
  description = "oci shape for the instance"
  default     = "VM.Standard2.1"
}

variable "db_system_display_name" {
  type        = string
  description = "display name of database system"
  default     = "DBSystemName"
}

variable "db_name" {
  type        = string
  description = "database name"
  default     = "dbname"
}

variable "db_system_shape" {
  type        = string
  description = "shape of database instance"
  default     = "VM.Standard2.2"
}

variable "db_admin_password" {
  type        = string
  description = "password for SYS, SYSTEM, PDB Admin and TDE Wallet."
}
