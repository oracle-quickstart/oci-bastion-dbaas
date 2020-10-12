// Copyright (c) 2019, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

variable compartment_id {
  type        = string
  description = "compartment for the dr resources"
}

variable tenancy_ocid {
  type        = string
  description = "tenancy id"
}

variable vcn_name {
  type        = string
  description = "CIDR range for the dr VCN"
}

variable dns_label {
  type        = string
  description = "CIDR range for the dr VCN"
  default     = ""
}

variable vcn_cidr_block {
  type        = string
  description = "CIDR range for the dr VCN"
}

variable freeform_tags {
  type        = map
  description = "map of freeform tags to apply to all resources created by this module"
  default     = {}
}

variable defined_tags {
  type        = map
  description = "map of defined tags to apply to all resources created by this module"
  default     = {}
}

variable igw_name {
  type        = string
  description = "Internet gateway name for dr VCN"
  default     = "igw"
}

variable nat_name {
  type        = string
  description = "NAT gateway name for dr VCN"
  default     = "nat"
}

variable sgw_name {
  type        = string
  description = "NAT gateway name for dr VCN"
  default     = "sgw"
}

variable public_rte_name {
  type        = string
  description = "route table namefor public subnet"
  default     = "public_rte"
}

variable private_rte_name {
  type        = string
  description = "route table namefor private subnet"
  default     = "private_rte"
}

variable access_subnet_name {
  type        = string
  description = "Access Subnet display name"
  default     = "access subnet"
}

variable access_subnet_dns_label {
  type        = string
  description = "Access Subnet display name"
  default     = "access"
}

variable db_subnet_name {
  type        = string
  description = "db Subnet display name"
  default     = "db subnet"
}

variable db_subnet_dns_label {
  type        = string
  description = "DB Subnet display name"
  default     = "db"
}
