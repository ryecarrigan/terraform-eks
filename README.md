# terraform-cloudbees-ci
Terraform plan for creating an AWS EKS Cluster.

## Prerequisites
### Tools
The following tools should be installed and available in your PATH:

* Required
  * `terraform` v1.0+
* Recommended
  * `aws` CLI with configured profile(s).
  * `kubectl` at a version matching the target Kubernetes cluster.

### Configuration
1. Set the AWS_REGION variable in your environment or configure it in your shell profile.
   ```shell
   $ export AWS_REGION=<region_code>
   $ export AWS_DEFAULT_REGION=<region_code>
   ```
2. Set up your local configuration variables.
   * Copy `.auto.tfvars.example` to `.auto.tfvars`.
   * Edit `.auto.tfvars` and provide your desired values.
   Required fields are:
   * `cluster_name`
   * `domain_name`
   * `subnet_ids`
   * `vpc_id`
3. Set up the Terraform backend (It is recommended to configure a remote Terraform backend.)
   * The plan contains a `backend.tf.example` that you can copy to `backend.tf` and modify as needed.
   * Otherwise, Terraform will use the default local store.

### Building the EKS cluster
1. Prepare the EKS cluster.
    * Initialize the terraform plan. 
        ```shell
        $ terraform init
        ```
    * (Optional) View the terraform plan.
        ```shell
        $ terraform plan
        ```
    * Create the EKS cluster.
        ```shell
        $ terraform apply
        ```

### Destroying the EKS cluster
1. Teardown the EKS cluster. Note that anything still using elements of the cluster
   can prevent the teardown from completing. For example, if CloudBees CI is installed,
   it should be uninstalled first, as it will continue to use the ALB that was created.
   * Destroy the cluster.
        ```shell
        $ terraform destroy
        ```