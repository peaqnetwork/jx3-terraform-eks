// ----------------------------------------------------------------------------
// Required Variables
// ----------------------------------------------------------------------------

variable "region" {
  description = "AWS region code for creating resources."
  type        = string
  default = "eu-central-1"
}
variable "profile" {
  description = "The AWS Profile used to provision the EKS Cluster"
  type        = string
  default     = "cicd"
}

variable "cluster_version" {
  description = "Kubernetes version to use for the EKS cluster."
  type        = string
  default = "1.30"
}


variable "jx_git_url" {
  description = "URL for the Jenins X cluster git repository"
  type        = string
  default = "https://github.com/peaqnetwork/jx3-eks-vault.git"
}

variable "jx_bot_username" {
  description = "Bot username used to interact with the Jenkins X cluster git repository"
  type        = string
  default = "peaqbot"
}

variable "jx_bot_token" {
  description = "Bot token used to interact with the Jenkins X cluster git repository"
  type        = string
}

// ----------------------------------------------------------------------------
// Optional Variables
// ----------------------------------------------------------------------------

variable "cluster_name" {
  description = "Name of the Kubernetes cluster to create"
  type        = string
  #default     = "peaq-jx"
}

variable "ami_type" {
  description = "ami type for the node group worker intances"
  type        = string
  default     = "AL2023_x86_64_STANDARD"
}

variable "node_machine_type" {
  type    = string
  default = "m6i.large"
}

variable "force_destroy" {
  description = "Flag to determine whether storage buckets get forcefully destroyed. If set to false, empty the bucket first in the aws s3 console, else terraform destroy will fail with BucketNotEmpty error"
  type        = bool
  default     = false
}

variable "nginx_chart_version" {
  type        = string
  description = "nginx chart version"
  default     = "3.12.0"
}

variable "use_asm" {
  description = "Flag to specify if resources for AWS Secret MAanger should be created instead of vault resources"
  type        = bool
  default     = false
}

# VPC
variable "vpc_name" {
  type    = string
  default = "peaq-jx-vpc"
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.11.1.0/24", "10.11.2.0/24", "10.11.3.0/24"]
}

variable "private_subnets" {
  type    = list(string)
  default = ["10.11.4.0/24", "10.11.5.0/24", "10.11.6.0/24"]
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.11.0.0/16"
}

variable "enable_nat_gateway" {
  type    = bool
  default = true
}

variable "single_nat_gateway" {
  type    = bool
  default = true
}

variable "cluster_in_private_subnet" {
  description = "Flag to enable installation of cluster on private subnets"
  type        = bool
  default     = true
}

variable "cluster_endpoint_private_access" {
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
  type        = bool
  default     = false
}

variable "cluster_endpoint_public_access" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled."
  type        = bool
  default     = true
}
