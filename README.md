# oci-bastion-dbaas 

This solution provides a Network Architecture deployment to spin up a bastion server and database instance.


## Quickstart Deployment

1. Clone this repository to your local host. The `oci-bastion-dbaas` directory contains the Terraform configurations for a sample topology based on the architecture described earlier.
    ```
    $ git clone https://github.com/oracle-quickstart/oci-bastion-dbaas.git
    ```

2. Install Terraform. See https://learn.hashicorp.com/terraform/getting-started/install.html.

3. Setup tenancy values for terraform variables by updating **env-vars** file with the required information. The file contains definitions of environment variables for your Oracle Cloud Infrastructure tenancy.
    ```
    $ source env-vars
    ```

4. Create **terraform.tfvars** from *terraform.tfvars.sample* file with the inputs for the architecture that you want to build. A running sample terraform.tfvars file is available below. The contents of sample file can be copied to create a running terraform.tfvars input file. Update db_admin_password with actual password in terraform.tfvars file.


5. Deploy the topology:

-   **Deploy Using Terraform**
    
    ```
    $ terraform init
    $ terraform plan
    $ terraform apply
    ```
    When you’re prompted to confirm the action, enter yes.

    When all components have been created, Terraform displays a completion message. For example: Apply complete! Resources: 14 added, 0 changed, 0 destroyed.

6. If you want to delete the infrastructure, run:
    run the following command
    ```
    $ terraform destroy
    ```
    When you’re prompted to confirm the action, enter yes.


## Inputs required in the terraform.tfvars file
*Sample terraform.tfvars file to create bastion-database architecture*

```
# CIDR block of Primary VCN to be created
vcn_cidr_block = "192.168.0.0/16"

# DNS label of VCN to be created
vcn_dns_label = "drvcn"

# Compute shape for bastion server
bastion_server_shape = "VM.Standard2.1"

# Database System display name
db_system_display_name = "ActiveDBSystem"

# Database name
db_name = "ORCLCDB"

# Compute shape for Database server
db_system_shape = "VM.Standard2.2"

# DB admin password for database
db_admin_password = "YourPwd__111"

# path to public ssh key to set as the authorized key on the bastion host
ssh_public_key_file  = "~/.ssh/id_rsa.pub"

# path to private ssh key to access the bastion host
ssh_private_key_file = "~/.ssh/id_rsa"
```


### End