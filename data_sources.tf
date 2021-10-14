// Copyright (c) 2019, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


# Availability Domains for Primary Region
data oci_identity_availability_domains ADs {
  compartment_id = var.tenancy_ocid
}

# Oracle Linux VM Image for Primary Region
data oci_core_images oraclelinux {
  compartment_id = var.compartment_ocid

  operating_system         = "Oracle Linux"
  operating_system_version = "7.9"

  # exclude GPU specific images
  filter {
    name   = "display_name"
    values = ["^Oracle-Linux-7.9-([\\.0-9]+)-([\\.0-9-]+)$"]
    regex  = true
  }
}
