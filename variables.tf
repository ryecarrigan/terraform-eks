# Required variables
variable "cluster_name" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

# Optional variables
variable "acm_subdomain" {
  default = "*"
  type    = string
}

variable "cluster_security_group_id" {
  default = ""
  type    = string
}

variable "create_acm_certificate" {
  default = false
  type    = bool
}

variable "instance_types" {
  default = ["m5.xlarge", "m5a.xlarge", "m4.xlarge"]
  type    = set(string)
}

variable "key_name" {
  default = ""
  type    = string
}

variable "kubeconfig_file" {
  default = "eks_kubeconfig"
  type    = string
}

variable "kubernetes_version" {
  default = "1.21"
  type    = string

  validation {
    condition     = contains(["1.19", "1.20", "1.21"], var.kubernetes_version)
    error_message = "Provided Kubernetes version is not supported by EKS and/or CloudBees."
  }
}

variable "node_group_desired_size" {
  default = 1
  type    = number
}

variable "node_group_max_size" {
  default = 8
  type    = number
}

variable "node_group_min_size" {
  default = 1
  type    = number
}

variable "node_security_group_id" {
  default = ""
  type    = string
}

variable "tags" {
  default = {}
  type    = map(string)
}
