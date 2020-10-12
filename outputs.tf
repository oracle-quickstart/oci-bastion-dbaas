// Copyright (c) 2019, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

### Primary Region Outputs

output "bastion_ip" {
  value = module.bastion_instance.dr_instance_ip
}