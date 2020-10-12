// Copyright (c) 2019, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

output dr_vcn {
  description = "the `oci_core_vcn` resource"
  value       = oci_core_vcn.dr_vcn
}

output dr_db_subnet_id {
  description = "db_subnet_id"
  value       = oci_core_subnet.db_subnet.id
}

output dr_access_subnet_id {
  description = "access_subnet_id"
  value       = oci_core_subnet.access_subnet.id
}

output dr_ping_all_id {
  description = "ping_all_id"
  value       = oci_core_network_security_group.ping_all.id
}

output dr_availability_domains {
  description = "list of AD's of remote destination region"
  value       = data.oci_identity_availability_domains.AD.availability_domains
}