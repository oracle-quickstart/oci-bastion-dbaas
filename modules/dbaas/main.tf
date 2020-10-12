// Copyright (c) 2019, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

/* Create DBaaS */

resource "oci_database_db_system" "db_system" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id
  database_edition    = var.db_edition

  db_home {
    database {
      admin_password = var.db_admin_password
      db_name        = var.db_name
      character_set  = var.character_set
      ncharacter_set = var.n_character_set
      db_workload    = var.db_workload
      pdb_name       = var.pdb_name

      db_backup_config {
        auto_backup_enabled = var.db_backup_enabled
      }
    }

    db_version   = var.db_version
    display_name = var.db_home_display_name
  }

  db_system_options {
    storage_management = "LVM"
  }

  disk_redundancy         = var.db_disk_redundancy
  shape                   = var.db_system_shape
  subnet_id               = var.subnet_id
  ssh_public_keys         = [var.ssh_public_keys]
  display_name            = var.db_system_display_name
  hostname                = var.hostname
  data_storage_size_in_gb = var.data_storage_size_in_gb
  license_model           = var.license_model
  node_count              = var.node_count
  nsg_ids = [
      var.ping_all_id
  ]
}

data "oci_database_db_homes" "t" {
  compartment_id = var.compartment_id
  db_system_id   = oci_database_db_system.db_system.id

  filter {
    name   = "display_name"
    values = [var.db_home_display_name]
  }
}

data "oci_database_databases" "db" {
  compartment_id = var.compartment_id
  db_home_id     = data.oci_database_db_homes.t.db_homes.0.db_home_id
}
