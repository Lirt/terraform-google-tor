# ---------------------------------------------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# Define one of these secrets as environment variable
# ---------------------------------------------------------------------------------------------------------------------
#
# Path to service account JSON keyfile:
#   GOOGLE_APPLICATION_CREDENTIALS
#   GOOGLE_CREDENTIALS
#   GOOGLE_CLOUD_KEYFILE_JSON
#   GCLOUD_KEYFILE_JSON
# Project:
#   GOOGLE_PROJECT
#   GCLOUD_PROJECT
# Region:
#   GOOGLE_REGION
#   GCLOUD_REGION
# Zone:
#   GOOGLE_ZONE
#   GCLOUD_ZONE
#
# ---------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These parameters must be supplied when consuming this module.
# ---------------------------------------------------------------------------------------------------------------------

variable "gcp_project_id" {
  description = "Name of GCP Project ID in which the Tor infrastructure will be created."
}

variable "gcp_region" {
  description = "Name of GCP region in which the Tor infrastructure will be created."
}

variable "gcp_zone" {
  description = "Name of GCP zone in which the Tor infrastructure will be created."
}

variable "tor_node_count" {
  description = "Number of tor nodes to create."
}


# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "tor_nickname" {
  description = "Nickname for tor nodes. Two digit number will be appended to end of the name to keep them unique."
  default     = "tor-tf-node"
}

variable "tor_base_image" {
  description = "Image for tor instance. Supported images are ubuntu-os-cloud/ubuntu-1804-lts, debian-cloud/debian-9, centos-cloud/centos-7."
  default     = "ubuntu-os-cloud/ubuntu-1804-lts"
}

variable "tor_network_name" {
  description = "Name of GCP network that will be used as primary tor network."
  default     = "tor-network"
}

variable "tor_machine_type" {
  description = "Machine type for tor nodes."
  default     = "n1-highcpu-2"
}
